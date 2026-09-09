const entrada = require('readline-sync');


console.log("-------------------------------------------");
console.log("  CONTROLE DE QUALIDADE: PESAGEM DE PEÇAS ");
console.log("-----------------------------------------\n");

const 
temperatura = [];
const peso = [];
let somaTotal = 0;

const pecas = entrada.questionInt("Quantas pecas deseja avaliar? ");

for (let i= 0; i < pecas; i++) {
    let peso = entrada.questionFloat(`Digite o peso das pecas: ${i+1}: (kg) `);
    temperaturas.push(temperatura);
     peso.push(peso);
     somaTotal += peso;
 
}
const media = somaTotal / qtdPecas;

console.log("\n---RELATÓRIO---")
console.log(`Pesos registrados: ${peso.join(" Kg | ")} Kg`);
console.log(`peso do lote: ${media.toFixed(2)} kg`);

if (media >= 4.8 && media <= 5.2 ) {
    console.log("STATUS FINAL: LOTE APROVADO!")
}else{
    console.log("STATUS FINAL: LOTE REPROVADO!")
}