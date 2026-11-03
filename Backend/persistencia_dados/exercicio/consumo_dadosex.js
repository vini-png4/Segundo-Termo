const fs = require('fs');

console.log("=== SISTEMA DE PERSISTENCIA: LEITURA DE MAQUINAS ===");

const nomeDoArquivo = "maquinasex.json";

if (!fs.existsSync(nomeDoArquivo)) {
    console.error(`Erro: O arquivo '${nomeDoArquivo}' não foi encontrado.`);
}

const conteudoTexto = fs.readFileSync(nomeDoArquivo, 'utf-8');

const maquinasRecuperadas = JSON.parse(conteudoTexto);

function buscarPorId(maquinas, id) {
    return maquinas.find((maquina) => maquina.id === id);
}

function filtraPorStatus(maquinas, status) {
    return maquinas.filter((maquina) => maquina.status === status);
}

console.log("Dados carregados com sucesso:\n");
console.table(maquinasRecuperadas);

console.log(`\nTotal de maquinas cadastradas: ${maquinasRecuperadas.length}`);
console.log(`Primeira maquina da lista: ${maquinasRecuperadas[0].nome}`);

function executar () {
    console.log('\n=== BUSCA PElO ID 3 ===');
    console.table(buscarPorId(maquinasRecuperadas, 3)?? 'maquina nao encontrada');


    console.log('\n=== MAQUINA EM MANUTENCAO ===');
    console.table(filtraPorStatus(maquinasRecuperadas, 'manutencao'));
}

executar();