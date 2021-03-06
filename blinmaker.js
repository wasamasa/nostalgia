#!/usr/bin/env gjs
// port of https://www.youtube.com/watch?v=FMIZEfjYmtM

const {GLib, Gio} = imports.gi;
const stdin = Gio.DataInputStream.new(Gio.UnixInputStream.new(0, false));
const stdout = Gio.DataOutputStream.new(Gio.UnixOutputStream.new(1, false));

function printline(string = '') {
  stdout.put_string(`${string}\n`, null);
}

function readline(prompt) {
  stdout.put_string(prompt, null);
  stdout.flush(null);
  return stdin.read_line_utf8(null)[0];
}

let eggsAmount;
const eggsMin = 1;
let milkAmount;
const milkMin = 200; // milliliter
let flourAmount;
const flourMin = 100; // grams

printline('Hello Boris!');
printline('Blin maker is starting up..');
eggsAmount = readline('How many eggs you have?\n');
milkAmount = readline('How much milk you have?\n');
flourAmount = readline('How much flour you have?\n');

if (eggsAmount < eggsMin || milkAmount < milkMin || flourAmount < flourMin) {
  printline('no blin today :(');
} else {
  flourAmount = flourAmount / flourMin;
  milkAmount = milkAmount / milkMin;

  const smallest = Math.min(eggsAmount, milkAmount, flourAmount);
  printline();
  printline(`You can make ${smallest * 4} of blins`);
  printline();
  printline(`You will need ${smallest * eggsMin} eggs`);
  printline(`You will need ${smallest * flourMin} grams flour`);
  printline(`You will need ${smallest * milkMin}ml milk`);
  printline();
  printline('Blinmaker shutting down..');
}
