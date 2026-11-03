const entrada = require ("readline-sync");

const NomeMaterial = entrada.question("Digite o Nome do Material:");
const precoUnitario = entrada.questionFloat("Qual o preco do produto Unico: ");
const quantidade = entrada.question("Digite a quantidade desejada: ");

const totalCompra = precoUnitario * quantidade;

console.log("\n === REGISTRO DE COMPRA ===");
console.log(`Materia Prima: ${NomeMaterial}`);
console.log(`Quantidade pedida: ${quantidade}`);
console.log(`Total a ser pagar: R${totalCompra.toFixed(2)}`);