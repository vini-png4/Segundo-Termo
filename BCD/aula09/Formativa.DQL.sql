-- Active: 1788267994033@@127.0.0.1@3306@smartcoffee_dml_vinicius
select * from cliente;

select nome, cidade, email from cliente;

SELECT DISTINCT cidade
FROM cliente;

SELECT nome_produto, preco
FROM produto
ORDER BY preco ASC;

