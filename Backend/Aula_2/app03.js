const entrada = require(`readline-sync`);

console.log("---SISTEMA DE RADAR---");

const Velocidade = entrada.questionFloat("Velocidado do veiculo (km/h):");

console.log(`velocidade ${Velocidade}km/h`);

if (Velocidade => 80) {
    console.log("Veiculo MULTADO!!");
} else {
      
      console.log("Continue a viagem")
}