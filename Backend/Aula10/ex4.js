const entrada = require("readline-sync")

console.log("=== REGISTRO DE TEMPERATURAS ===")

const temperaturas = [];

const quantidade  = entrada.questionInt("Quantas temperaturas deseja registrar? ");

for (let i= 0; i < quantidade; i++) {
    let temperatura = entrada.questionFloat(`Temperatura ${i+1}: `);
    temperaturas.push(temperatura);
}
console.log("\n---RELATÓRIO---")
console.log(`Temperaturas registradas: ${temperaturas.join(" °C | ")} °C`)
console.log(`Quantidade de temperaturas: ${temperaturas.length}`);
console.log(`primeiro temperatura: ${temperaturas[0]}`);
console.log(`Ultima temperatura registrada: ${temperaturas[temperaturas.length - 1]}`);