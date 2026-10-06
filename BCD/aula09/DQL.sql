-- Active: 1788267994033@@127.0.0.1@3306@smartcoffee_dml_vinicius
INSERT INTO cliente (nome, email, telefone, cidade,ativo) VALUES 
('Manuella Rossatt', 'manuellarossatt@email.com', '1999999901', 'Limeira', TRUE);

-- CONSULTA COM SELECT
-- ESTRUTURA DE CONSTRUÇÃO DO SELECT
SELECT coluna
FROM tabela;

-- EX 1: SELECT PARA TODAS AS COLUNAS
SELECT * FROM cliente;

-- EX 2: SELECT POR COLUNAS
SELECT nome,email,ativo FROM cliente;

-- EX 3: ALTAS É UM APELIDO PARA O RESULTADO

SELECT nome AS Cliente,
       telefone AS Contato
FROM cliente;

SELECT nome AS Cliente,
       ativo AS Status
FROM cliente;

SELECT nome, preco, preco * 0.80 AS preco_promocao
FROM produto;

-- EX 4: ELIMINANDO REPETIÇÕES
SELECT DISTINCT cidade
FROM cliente;

SELECT cidade FROM cliente

-- SEM DISTINCT - Aparece varias vezes
-- COM DISTINCT - Aparece uma vez

-- EX 5: FILTROS EM REGISTROS
SELECT nome, preco
FROM produto
WHERE preco > 10;

SELECT nome, preco
FROM produto
WHERE preco <> 10;   -- ou != e  <> são são diferentes

SELECT `NOME_PRODUTO`, preco
FROM produto
WHERE ativo = TRUE;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;

-- OUTROS OPERADRES DE COMPARAÇÃO
-- = IGUAL
-- <>  != DIFERENTE
-- -> MAIOR
-- >= MAIOR IGUAL
-- < MENOR
-- <= MENOR IGUAL

-- EX 6: AND, OR E NOT
-- EXEMPLO COM AND
SELECT nome, preco
FROM produto
WHERE preco >= 1 AND preco <= 20;

-- EXEMPLO COM OR
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Piracicaba' OR cidade = 'Limeira';

-- EXEMPLO COM NOT
SELECT nome, cidade
FROM cliente
WHERE NOT cidade = 'Limeira';

-- EXEMPLO COM AND E OR JUNTOS UTILIZAR
SELECT nome, cidade, ativo
FROM cliente
WHERE ativo = TRUE 
AND (cidade = 'Limeira' OR cidade = 'Americanas');

-- EX 7: BETWEEN - PESQUISA POR INTERVALOS
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59';

-- EX 8: IN - VÁRIAS POSSIBILIDADES DE USAR PARA ELIMINAR A QUANTIDADE DE OR
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Americana');

SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ('Limeira', 'Americana');

-- EX 9: LIKE - PESQUISANDO POR TEXTOS
SELECT nome
FROM produto
WHERE nome LIKE 'Café%'
-- COMEÇA COM A PALAVRA DESEJADA

SELECT nome
FROM produto
WHERE nome LIKE '%chocolate%'
-- POSSUI A PALAVRA DESEJADA

SELECT nome
FROM produto
WHERE nome LIKE '%Silva'
-- UTILIZANDO % COMO CORINGA

SELECT nome
FROM produto
WHERE nome LIKE '_ilva'

SELECT nome
FROM cliente
WHERE nome LIKE 'br_';
-- UTILIZADO _ COMO CORINGA

-- EX 10: NULL - AUSÊNCIA DE VALOR
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;

-- EX 11: ORDER BY - ORDENAR RESULTADOS ASC É CRESCENTE E DESC É DECRESCENTE
SELECT nome_produto, preco
FROM produto
ORDER BY preco ASC;

SELECT nome_produto, preco
FROM produto
ORDER BY preco DESC;

SELECT nome, preco
FROM  cliente
ORDER BY cidade ASC, nome DESC;

-- EX 12: LIMIT - LIMITANDO A QUANTIDADE DE RESULTADOS
SELECT nome_produto, preco
FROM produto
ORDER BY preco DESC
LIMIT 8;

SELECT `NOME_PRODUTO`, preco
FROM produto
ORDER BY `NOME_PRODUTO`
LIMIT 8 OFFSET 8;

-- EX 13: COLUNAS COM CÀCULOS
SELECT `NOME_PRODUTO`, preco, preco * 1.10 AS preco_promocao
FROM produto;

-- CALCULO COM SUBTOTAL
SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS subtotal
FROM item_pedido;

-- EX 14: FUNÇÕES ÚTEIS EM CONSULTAS
SELECT UPPER(nome) AS nome_maiusculo,
       LOWER(nome) AS nome_minusculo
FROM cliente;
-- DEIXAR EM MAIUSCULO E MINUSCULO


SELECT CONCAT(nome, ' - ', cidade) AS cliente_Cidade
FROM cliente;
-- ARREDONDAR CASAS DECIMAIS

SELECT id_pedido, data_pedido, DATE(data_pedido) AS Data_Pedido, YEAR(data_pedido) AS Ano_Pedido, MONTH(data_pedido) AS Mês_Pedido
FROM pedido;
-- FORMATAÇÃO DE RESULTADOS POR DATA MES E ANO

-- SUBSTITUINDO NULL PARA TEXTO DESEJADO
SELECT nome,
COALESCE(telefone, 'SEM TELEFONE') AS telefone
FROM cliente;

-- FUNÇÕES DE AGREGAÇÕES
--EX 15: FUNÇÕES DE CALCULOS AGREGADAS
-- COUNT() - CONTAR
--SUM() - SOMAR
-- AVG() - MEDIA
-- MIN() - MINIMO
--MAX() - MÁXIMO
SELECT COUNT(*) AS TOTAL_CLIENTES
FROM cliente;
-- QUANTOS CLIENTES TEMOS EM NOSSA TABELA CLIENTE
SELECT AVG(preco) AS MEDIA_PRECO
FROM produto;
-- CALCULE O PREÇO MÉDIO DOS PRODUTOS
SELECT MIN(preco) AS MENOR_PRECO,
       MAX(preco) AS MAIOR_PRECO,
       AVG(preco) AS MEDIA_PRECO
FROM produto;
-- RESUMO DOS PREÇOS

SELECT SUM(valor_total) AS FATURAMENTO
FROM pedido
WHERE status_pedido = 'FINALIZADO';
-- TOTAL PEDIDOS FINALIZADOS

-- EX 16: GROUP BY - AGRUPAR DADOS
SELECT cidade,
         COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade;
-- QUANTIDADE DE CLIENTE EM CADA CIDADE

SELECT id_categoria,
       COUNT(*) AS quantidade_produtos,
       AVG(preco) AS media_preco
FROM produto
GROUP BY id_categoria;
-- QUANTIDADE DE PRODUTOS POR CATEGORIA

-- EX 17: HAVING - FILTRAR GRUPOS
-- WHERE FILTRA LINHAS ANTES DO AGRUPAMENTO
-- HAVING FILTRA GRUPOS DEPOIS DO GROUP BY
SELECT cidade,
       COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;
-- CIDADES COM PELO MENOS DOIS CLIENTES

-- EX 18: RESUMO E ORDEM DE UMA CONSULTA COMPLETA
SELECT colunas 
FROM tabela
WHERE condicao
GROUP BY colunas_agrupar
HAVING condicao_agrupar
ORDER BY colunas
LIMIT quantidade;

SELECT  cidade, COUNT(*) AS quantidade_clientes
FROM cliente
WHERE cidade = 'Limeira'
GROUP BY cidade
HAVING COUNT(*) >= 3
LIMIT 5;






















