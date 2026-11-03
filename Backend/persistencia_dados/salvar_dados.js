const fs = require('fs');

console.log('====SISTEMA DE REGISTRO DE MAQUINAS====');

const maquinasIndustriais = [ 
  {id: 101, nome: 'Torno Revolver', setor: 'Usinagem', operacional: true}, 
  {id: 102, nome: 'Furadeira de Bancada', setor: 'Manutencao', operacional: false},
  {id: 103, nome: 'Prensa Hidraulica 40T', setor: 'Estamparia', operacional: true}
]; 

const dadosParaGravar = JSON.stringify(maquinasIndustriais, null, 2); 
const nomeDoArquivo = 'maquinas.json';

fs.writeFile(nomeDoArquivo, dadosParaGravar, (err) => {
  if (err) {
    console.error('Erro ao gravar o arquivo:', err);
    return;
  }
  console.log('\nGravacao concluida com sucesso.');
  console.log(`Verifique o arquivo ${nomeDoArquivo} gerado.`); // Alterado para crases ( ` )
});
