const entrada = require("readline-sync");

console.log("-----------------------------------");
console.log(" CONTROLE DE ACESSO AO LABORATÓTIO ");
console.log("-----------------------------------\n");

const idade = entrada.questionInt("Idade do aluno: ")
const autorizacao = entrada.question("Voce possui a autorizacoo? [S/N]: ")
const acompanhado = entrada.question("Voce esta acompanho de um Professor? [S/N]: ")

console.log(`\nAluno: ${idade}`);

if ( (idade >= 16 &&  autorizacao === "S" )|| (acompanhado === "S" )) {
    console.log("ACESSO LIBERADO");
} else {
console.log("ACESSO NEGADO");
}
