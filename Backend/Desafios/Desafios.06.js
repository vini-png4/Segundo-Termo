
const entrada = require('readline-sync');

console.log("---------------------------------------------");
console.log("   URNA ELEITORAL | Verificador de Votação ");
console.log("---------------------------------------------\n");

const nome = entrada.question("Digite seu Nome: ");
const data_nascimento = entrada.questionFloat("Digite o ano em que voce nasceu:");
const idade = 2026 - data_nascimento

if (idade >= 16) {
    console.log("Permitido");
} else {
    (idade <= 16)  
      console.log("Negado, menor de idade")
}



