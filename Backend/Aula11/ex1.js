const produto = {
    nome: "Teclado Mecânico",
    preço: 150.00,
    estoque: 25,
    emOferta: true
};

console.log(`Produto: ${produto.nome}`);
console.log(`Preço: ${produto.preço.toFixed(2)}`);
console.log(`Produto: ${produto.nome} | ${produto.preço} | ${produto.estoque} | ${produto.emOferta}`);