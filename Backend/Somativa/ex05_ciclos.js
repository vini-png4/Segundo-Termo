const entrada = require("readline-sync");

const pecas = entrada.questionInt("Quantas pecas produzir por ciclo? ");
let total = 0;

for (let i = 1; i <= 10; i++) {
  total += pecas;
  console.log(`Ciclo ${i}: ${total}`);
} 