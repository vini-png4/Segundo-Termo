const entrada = require ("readline-sync");

const PesoPeca = entrada.questionFloat("Digite o peso da peca: ");

if (PesoPeca >=95 && PesoPeca <=100){
    console.log("PECA APROVADA");
}
else{
     console.log("PECA REPROVADA");
}
console.log(`Peso Informado da peca: ${PesoPeca}g`)
