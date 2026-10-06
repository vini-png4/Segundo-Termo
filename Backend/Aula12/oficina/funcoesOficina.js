 function calcularOrcamento(precoPeca, horasTrabalho) {
    const valorHora = 85.00;

    const totalMaodeObra = (horasTrabalho * valorHora);
    return precoPeca + totalMaodeObra;
 }

 function verificarGarantia(meses){
    if (meses <=3){
        return "Dentro da Garantia"
    }else {
        return "Garantia expirada"
    }
 }
function valorComdesconto(valorTotal){
    return valorTotal * 0.8
}

module.exports = {
    calcularOrcamento,
    verificarGarantia,
    valorComdesconto
}