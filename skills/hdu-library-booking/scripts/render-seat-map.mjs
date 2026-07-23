#!/usr/bin/env node

import { mkdir, readFile, rename, rm, writeFile } from "node:fs/promises";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

function argument(name) {
  const index = process.argv.indexOf(name);
  return index >= 0 ? process.argv[index + 1] : "";
}

function fail(message) {
  process.stderr.write(`${message}\n`);
  process.exit(1);
}

const input = argument("--input");
const output = argument("--output");
if (!input || !output) {
  fail("usage: node render-seat-map.mjs --input seats.json --output seat-map.html");
}

let raw;
try {
  if (input === "-") {
    process.stdin.setEncoding("utf8");
    raw = "";
    for await (const chunk of process.stdin) raw += chunk;
  } else {
    raw = await readFile(resolve(input), "utf8");
  }
} catch (error) {
  fail(`read seat response: ${error.message}`);
}

let response;
try {
  response = JSON.parse(raw);
} catch (error) {
  fail(`parse seat response: ${error.message}`);
}

const data = response?.data ?? response;
if (!data || !Array.isArray(data.rooms)) {
  fail("seat response does not contain data.rooms");
}
for (const room of data.rooms) {
  if (!room || !room.roomId || !Array.isArray(room.seats)) {
    fail("seat response contains an invalid room");
  }
}

const scriptDir = dirname(fileURLToPath(import.meta.url));
const templatePath = resolve(scriptDir, "../assets/seat-map.html");
const marker = "__HDU_LIBRARY_BOOKING_DATA__";
let template;
try {
  template = await readFile(templatePath, "utf8");
} catch (error) {
  fail(`read seat map template: ${error.message}`);
}
if (!template.includes(marker)) {
  fail("seat map template marker is missing");
}

const serialized = JSON.stringify(data)
  .replaceAll("<", "\\u003c")
  .replaceAll(">", "\\u003e")
  .replaceAll("&", "\\u0026")
  .replaceAll("\u2028", "\\u2028")
  .replaceAll("\u2029", "\\u2029");
const rendered = template.replace(marker, serialized);
const outputPath = resolve(output);
const temporaryPath = `${outputPath}.tmp-${process.pid}`;
try {
  await mkdir(dirname(outputPath), { recursive: true });
  await writeFile(temporaryPath, rendered, { encoding: "utf8", mode: 0o600 });
  await rename(temporaryPath, outputPath);
} catch (error) {
  await rm(temporaryPath, { force: true });
  fail(`write seat map: ${error.message}`);
}

process.stdout.write(`${JSON.stringify({ status: "ok", output: outputPath, rooms: data.rooms.length, availableSeats: data.availableSeatCount ?? 0 })}\n`);
