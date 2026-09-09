const entrada = require(`readline-sync`);


const data_nascimento = entrada.questionFloat("Digite o ano em que voce nasceu:");

const idade = 2026 - data_nascimento

if (idade >= 16) {
    console.log("Permitido");
} else {
    (idade <= 16)  
      console.log("Negado, menor de idade")
}
























