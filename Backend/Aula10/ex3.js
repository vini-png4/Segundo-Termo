const alunos =["Ana", "Bruno", "Carlos", "Enzo", "Sabrina", "Yago"];

console.log("Lista de Alunos: ");
console.log(alunos);

console.log(`primeiro aluno da lista é: ${alunos[0]}`);
console.log(`segundo aluno da lista é: ${alunos[1]}`);
console.log(`terceiro aluno da lista é: ${alunos[2]}`);
console.log(`sexto aluno da lista é: ${alunos[5]}`);
console.log(`Quantidade de alunos: ${alunos.length}`);

alunos.push("Cecília");
alunos.push("Leona");

console.log(`terceiro aluno da lista é: ${alunos[2]}`);
console.log(`Ultimo aluno da lista é: ${alunos[alunos.length - 1]}`);