const entrada = require("readline-sync")

const temperatura = entrada.questionFloat("Digite a temperatura da maquina: ")

if (temperatura <= 60 ){
    console.log("SITUAÇÃO: NORMAL")
}
else if (temperatura => 61 && temperatura <= 80) {
    console.log("SITUAÇÃO: ALERTA")
}
else{
    console.log("SITUAÇÃO: CRITICA")
}


