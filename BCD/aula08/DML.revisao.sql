-- Active: 1788267994033@@127.0.0.1@3306@smartcoffee_dml_vinicius
-- Revisão de DML - Aula 08

-- Revisão de inserts

insert into cliente (nome, email, telefone, cidade, ativo) values 
('Laura C', 'laura@email.com', '1999999901', 'Limeira', TRUE), 
('Laura N', 'lauran@email.com', '19999999802', 'Limeira', TRUE), 
('Laura R', 'laurar@email.com', '199999903', 'Limeira', TRUE), 
('Leonardo 8', 'leonardob@email.com', '1999999904', 'Limeira', TRUE), 
('Leonardo BT', 'leonardobt@email.com', '199999905', 'Americana', TRUE), 
('Lidia M', 'lidia@email.com', '199999906', 'Belem', TRUE), 
('Livia V', 'livia@email.com', NULL, 'Limeira', TRUE), 
('Marcos V', 'marcos@email.com', '1999999987', 'Campo Mourão', TRUE), 
('Nicolas N', 'nicolasn@email.com', '199999988', 'Limeira', FALSE), 
('Nicolas F', 'nicolasf@email.com', '199999909', 'Campinas', TRUE), 
('Pablo H', 'pablo@email.com', '199999910', 'Indaiatuba', TRUE), 
('Sophie A', 'sophie@email.com', '199999911', 'Campinas', TRUE), 
('Vinicius H', 'vinicius@email.com', NULL, 'Limeira', TRUE), 
('Vitoria S', 'vitoria@email.com', '1999999912', 'Limeira', TRUE), 
('Virginia S', 'virginia@email.com', NULL, 'Boston', TRUE);

INSERT INTO CATEGORIA (NOME_CATEGORIA) VALUES 
('Combos Especiais'),('Nutella');

INSERT INTO pedido (data_pedido, status_pedido,valor_total,id_cliente) VALUES
(NOW(), 'ABERTO', 0.00,8);

INSERT INTO pedido (data_pedido, status_pedido,valor_total,id_cliente) VALUES
(NOW(), 'ABERTO', 0.00,8);

set @pedido = LAST_INSERT_ID();
SELECT @pedido;

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 4, 2, 13.00, 'Nutella');

----------------------------------------------------------------------------------------------

-- ATUALIZANDO DADOS NO BD
UPDATE cliente
SET telefone = '19999333301'
WHERE id_cliente = 3

UPDATE cliente
SET telefone = '19992277701',
    cidade = 'Piracicaba',
    ativo = FALSE
WHERE id_cliente = 9

----- TOMA MUITO CUIDADO ---- NÃO ESQUECER DE COLOCAR O WHERE ⚠️

UPDATE cliente
SET ativo = FALSE;

UPDATE pedido
SET valor_total = 1.00;

--------------------------------------------------------------

-- DICAS DE OURO
-- EXECUTAR O SELECT SEMPRE ANTES DE ATUALIZAR
-- SELECT * FROM TABELA_QUE_DESEJO

--------------------------------------------------------------

-- CONDICIONAIS
UPDATE produto
SET preco =
CASE
    WHEN preco < 30 THEN preco * 1.50
    ELSE preco * 1.25
END
WHERE ativo = TRUE;

UPDATE cliente
SET telefone = NULL
WHERE id_cliente = 2

-- APAGANDO DADOS DO BD
DELETE FROM cliente
WHERE id_cliente = 25;

TRUNCATE TABLE cliente;

---EXCLUINDO DADOS DE FORMA LOGICA
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 8

---------------------------------------------------------------------------------

-- CADASTRANDO UM PROCEDIMENTO DE COMPRA

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Bruno M','bruno@email.com','1999999913','Piracicaba',TRUE);
SET @cliente = LAST_INSERT_ID();

-- PASSO 2 : ADICIONANDO UM NOVO PEDIDO
INSERT INTO pedido (data_pedido,status_pedido,valor_total,id_cliente) VALUES
(NOW(),'ABERTO',0.00,@cliente)

-- PASSO 3: ADICIONANDO ITENS AO PEDIDO 
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 4, 2, 13.00, 'Mel'),
(@pedido, 5, 1, 15.50, '');

-- PASSO 4: ATUALIZANDO O VALOR TOTAL DO PEDIDO
UPDATE pedido
SET valor_total = 22.00,
    status_pedido = 'Preparando'
WHERE id_pedido = @pedido;

-- PASSO 5: REGISTRANDO PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido, 2, 22.00, NOW());

-- CONSULTA DE FORMA COMPLETA
SELECT p.id_pedido,
       c.nome AS cliente,
       p.status_pedido,
       p.valor_total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_produto = @pedido


-- CONSULTAS PARA OS DADOS NO BD

select * from pedido;

;
select * from cliente
where id_cliente = 23;