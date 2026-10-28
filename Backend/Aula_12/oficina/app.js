const entrada = require('readline-sync');
const oficina = require('./funcoesOficina');

console.log("=== SISTEMA DE GESTAO DE OFICINA 1.0 ===")

const peca = entrada.questionFloat("Preco da peca: R$");
const horas = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto:");

const total = oficina.calcularOrcamento(peca, horas);
const valorComdesconto = oficina.valorComdesconto(total)

const garantia = oficina.verificarGarantia(tempoUso);

console.log("\n--- RELATORIO DE SERVICO ---");
console.log(`Orcamento: R$ ${total.toFixed(2)}`);
console.log(`Status Garantia: ${garantia}`);
console.log(`Orcamento com 20% de desconto ${valorComdesconto.toFixed(2)}`)
console.log("--------------------------------------");


