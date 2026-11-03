-- Active: 1788267994033@@127.0.0.1@3306@biblioteca_som2

CREATE DATABASE IF NOT EXISTS biblioteca_som2;
select * from usuario;
select * from livro;    
select * from emprestimo;


create table if not exists Usuario(
    id_usuario int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    telefone VARCHAR(20),
    ativo boolean not null default true
);

create table if not exists Livro (
    id_livro int auto_increment primary key,
    titulo varchar(150) not null,
    editora varchar(100) not null,
    isbn varchar(13) not null unique,
    ano_publicacao int not null,
    quantidade_disponivel int not null default 0, check (quantidade_disponivel >= 0)
);
DROP TABLE IF EXISTS emprestimo;

create table if not exists emprestimo (
    id_emprestimo int auto_increment primary key,
    data_emprestimo datetime not null default current_timestamp,
    data_prevista date not null,
    data_devolucao date not null,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO', CHECK (status_emprestimo IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    id_usuario int not null,
    id_livro int not null,
    constraint fk_emprestimo_usuario foreign key (id_usuario) references usuario(id_usuario),
    constraint fk_emprestimo_livro foreign key (id_livro) references livro(id_livro)
);

ALTER TABLE livro ADD COLUMN editora VARCHAR(100);


insert into usuario (nome, email, telefone, ativo) values
('BRUNO SOUZA','bruno.souza@email.com','19999999001', TRUE),
('CARLOS PEREIRA', 'carlos.pereira@email.com', '19999999002', TRUE),
('MARIA SILVA', 'maria.silva@email.com', '19999999003', TRUE),
('NATHALIA LIMA','nathalia.lima@email.com','19999999004', TRUE),
('LUIZA COSTA','luiza.costa@email.com',NULL, TRUE);

insert into livro (titulo, autor, editora, isbn, ano_publicacao, quantidade_disponivel) values
('O Senhor dos Anéis', 'J.R.R. Tolkien', 'HarperCollins', '9780261102385', 1954, 5),
('1984', 'George Orwell', 'Secker & Warburg', '9780451524935', 1949, 3),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Reynal & Hitchcock', '9780156012195', 1943, 7),
('Dom Casmurro', 'Machado de Assis', 'Garnier', '9788520920910', 1899, 4),
('A Revolução dos Bichos', 'George Orwell', 'Secker & Warburg', '9780451526342', 1945, 6),
('Cem Anos de Solidão', 'Gabriel García Márquez', 'Harper & Row', '9780060883287', 1967, 2);

insert into emprestimo (data_emprestimo, data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro) VALUES
('2024-06-01 10:00:00', '2024-06-15', '2024-06-15', 'ABERTO', 1, 1),
('2024-06-02 11:30:00', '2024-06-16', '2024-06-16', 'ABERTO', 2, 2),
('2024-06-03 12:15:00', '2024-06-17', '2024-06-17', 'ABERTO', 3, 3);

UPDATE usuario
SET telefone = '19999999005'
WHERE id_usuario = 5;

UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_publicacao >= 1943;

DELETE FROM usuario
WHERE id_usuario = 4;

UPADTE usuario
