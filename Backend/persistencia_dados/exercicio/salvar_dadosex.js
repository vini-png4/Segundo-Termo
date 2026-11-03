const fs = require('fs');

console.log('====SISTEMA DE REGISTRO DE MAQUINAS====');

const maquinasIndustriais = [ 
  {id: 1, nome: 'Torno CNC T-01', setor: 'Usinagem', status: 'operando', horasUso: 1250}, 
  {id: 2, nome: 'Prensa Hidraulica P-02', setor: 'Estamparia', status: 'manutencao' ,horasUso: 980},
  {id: 3, nome: 'Esteira E-03', setor: 'Montagem', status: 'operando', horasUso: 2100},
  {id: 4, nome: 'Fresadora F-04', setor: 'Usinagem', status: 'parada', horasUso: 760},
  {id: 5, nome: 'Robo de Solda R-05', setor: 'Soldagem', status: 'operando', horasUso: 1320},
  {id: 6, nome: 'Prensa Hidraulica P-06', setor: 'Estamparia', status: 'manutencao', horasUso: 1580},
  {id: 7, nome: 'Mesa de corte C-07', setor: 'Corte', status: 'parada', horasUso: 480},
  {id: 8, nome: 'Esteira E-08', setor: 'Montagem', status: 'operando', horasUso: 860},

]; 

const dadosParaGravar = JSON.stringify(maquinasIndustriais, null, 2); 
const nomeDoArquivo = 'maquinasex.json';

fs.writeFile(nomeDoArquivo, dadosParaGravar, (err) => {
  if (err) {
    console.error('Erro ao gravar o arquivo:', err);
    return;
  }
  console.log('\nGravacao concluida com sucesso.');
  console.log(`Verifique o arquivo ${nomeDoArquivo} gerado.`);
});
