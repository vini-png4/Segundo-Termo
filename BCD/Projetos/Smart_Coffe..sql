-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Produto (
nome varchar(100) not null,
descricao text,
preco_unitario decimal(10,2) not null,
categoria int not null,
ID_Produto int primary key auto_increment PRIMARY KEY
)

CREATE TABLE Funcionario (
ID_Funcionario int primary key auto_increment PRIMARY KEY,
Nome varchar(100) not full,
data_admissao date not null,
Cargo varchar(50) not null,
salario decimal(10,2) not null,
CPF varchar(11)not full
)

CREATE TABLE Delivery (
endereco_entrega varchar(255) not full,
data_hora_saida datetime,
status_entrega varchar(50),
taxa_entrega decimal(10,2) not null,
ID_Delivery int primary key auto_increment PRIMARY KEY
)

CREATE TABLE Pedidos (
ID_Pedidos int primary key auto_increment,
tipo_pedido varchar(50) not null,
status varchar(50) not null,
valor_total decimal(10,2) not null,
data_hora datetime not null,
)

CREATE TABLE Pagamento(
ID_Pagamento int primary key auto_increment,
forma_pagamento varchar(50) not null,
valor_pago decimal(10,2) not null,
data_hora_pagamento datetime not null,
status_pagamento varchar(50) not null,
)

ID_Delivery int,
PRIMARY KEY(ID_Pedidos,ID_Pagamento),
FOREIGN KEY(ID_Delivery) REFERENCES Delivery (ID_Delivery)


CREATE TABLE Cliente (
ID_Cliente int primary key auto_increment,
Nome vachar(100) not null,
data_cadastro  date not null,
Email vachar(255),
CPF vachar(11)not null,
Telefone varchar(20) not null,
)

CREATE TABLE Fidelidade(
saldo_pontos int not null,
data_ultima_atualizacao datetime not null,
ID_Fidelidade int primary key auto_increment,
PRIMARY KEY(ID_Cliente,ID_Fidelidade)
)

CREATE TABLE Estoque (
ID_Estoque int primary key auto_increment PRIMARY KEY,
quantidade_atual int not null,
nome_produto varchar(30),
unidade_medida date not null,
quantidade_minima varchar
)

CREATE TABLE Realiza (
ID_Pedidos int ,
ID_Cliente int,
ID_Fidelidade int ,
FOREIGN KEY(ID_Pedidos) REFERENCES Pedidos (ID_Pedidos),
FOREIGN KEY(ID_Cliente)REFERENCES Cliente (ID_Cliente)
)

CREATE TABLE Contem (
ID_Produto int,
ID_Pedidos int ,
FOREIGN KEY(ID_Produto) REFERENCES Produto (ID_Produto),
FOREIGN KEY(ID_Pedidos) REFERENCES Pedidos (ID_Pedidos)
)

CREATE TABLE Atende (
ID_Pedidos int,
ID_Pagamento int,
ID_Funcionario int,
FOREIGN KEY(ID_Pedidos) REFERENCES Pedidos+Pagamento (ID_Pedidos),
FOREIGN KEY(ID_Funcionario) REFERENCES Funcionario (ID_Funcionario)
)

CREATE TABLE Consome (
ID_Estoque int,
ID_Produto int ,
FOREIGN KEY(ID_Estoque) REFERENCES Estoque (ID_Estoque),
FOREIGN KEY(ID_Produto) REFERENCES Produto (ID_Produto)
)

CREATE TABLE Entrega (
ID_Delivery int ,
ID_Funcionario int ,
FOREIGN KEY(ID_Delivery) REFERENCES Delivery (ID_Delivery),
FOREIGN KEY(ID_Funcionario) REFERENCES Funcionario (ID_Funcionario)
)

