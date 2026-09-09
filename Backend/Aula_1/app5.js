const entrada = require(`readline-sync`);

console.log("--- Sistema de Vendas Padaria --");

const nomeProduto = entrada.question("Qual o nome do produto? ");
const precoUnitario = entrada.questionFloat("Qual o preço unitario? ");
const quantidade = entrada.question("Quantos uniformes foram vendidos? ");

const total = precoUnitario * quantidade;

console.log("\n---RECIBO DE VENDA---")
console.log(`Produto: ${nomeProduto}`);
console.log(`Total a pagar: R${total.toFixed(2)}`);