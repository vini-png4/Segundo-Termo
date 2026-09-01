 -- Comandos para criar um banco de dados
create database ESCOLA_Vinicius;

create database ESCOLA_Vinicius2;

-- Comando para apagar banco de dados
Drop database ESCOLA_Vinicius2;

-- Comando para ativar Banco de Dados
use ESCOLA_Vinicius;

-- Mostrar tabelas de Banco de Dados
Show tables;

Create table ALUNO(
ID_Aluno int auto_increment primary key,
Nome varchar(60) not null,
Data_Nascimento date not null,
Responsavel varchar(60) not null,
RA_Escolar int,
Turma char(10)
);

Create table PROFESSOR(
ID_Professor int auto_increment primary key,
CPF varchar(14) not null,
Nome varchar (60) not null,
Disciplina char (20),
Salario decimal (5,2),
Status_Professor boolean
);

-- Comando para alterar informações
Alter table ALUNO add TELEFONE varchar(15);

-- Alterar o tipo de dados e tamanho do atributo

-- Renomear o nome do atributo
-- Alter table alunos change TELEFONE celular(15);

-- Excluir atributos
Alter table ALUNO drop column TELEFONE;
