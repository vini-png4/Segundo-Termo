const entrada = require ("readline-sync");

const pecas = entrada.questionInt("Quantidade de pecas produzidas:");
const Horasturno = entrada.questionInt("Horas trabalhadas:");

const total = pecas * Horasturno;

console.log(`pecas produzidas: ${pecas}`);
console.log(`Tempo consumido do Turno: ${Horasturno} Horas `);
console.log(`Quantidade produzida foi: ${total} peças`);