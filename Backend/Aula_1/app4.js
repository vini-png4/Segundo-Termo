//1. Criando as caixas (variáveis)
const nomePadaria = "Padaria do SENAI"; //Texto
const nomeProduto = "Pão de Queijo";    //Texto
let precoUnitario = 2.50;               //Número (decimal)
let quantidadeVendida = 10;             //Número (inteiro)

//2. Fazendo a conta
let valortotal = precoUnitario * quantidadeVendida;

//3.Mostrando o resultado
console.log(`Bem-vindo à ${nomePadaria}!`);
console.log(`Produto: ${nomeProduto}`);
console.log(`O valor total da venda é: R$ ${valortotal}!`);

