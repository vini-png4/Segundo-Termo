-- Active: 1788267994033@@127.0.0.1@3306@smartcoffee_dml_vinicius


-- 1. Liste todos os clientes cadastrados.
select * from cliente;
-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
select nome, cidade, email from cliente;
-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade
FROM cliente;
-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome_produto, preco
FROM produto
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome_produto, preco
FROM produto
ORDER BY preco DESC
LIMIT 5;

--6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome_produto, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

--7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Americana');

--8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome_produto, preco
FROM produto
WHERE nome_produto LIKE '%Café%';

-- 9. Liste os clientes que não informaram telefone.
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL
   OR telefone = '';

--10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00, do maior para o menor valor.
SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE status_pedido = 'FINALIZADO'
  AND valor_total > 20.00
ORDER BY valor_total DESC;

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS quantidade_produtos
FROM produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco,
    AVG(preco) AS preco_medio
FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT
    cidade,
    COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT
    cidade,
    COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(valor_total) AS faturamento_total
FROM pedido
WHERE status_pedido = 'FINALIZADO';

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT
    P.id_pedido,
    P.data_pedido,
    C.nome AS cliente,
    P.status_pedido AS status,
    P.valor_total
FROM pedido AS P
INNER JOIN cliente AS C
    ON C.id_cliente = P.id_cliente;

-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT
    PR.nome_produto AS produto,
    CA.nome_categoria AS categoria
FROM produto AS PR
INNER JOIN categoria AS CA
    ON CA.id_categoria = PR.id_categoria;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade, preço unitário e subtotal.
SELECT
    IP.id_pedido,
    PR.nome_produto AS produto,
    IP.quantidade,
    IP.preco_unitario,
    IP.quantidade * IP.preco_unitario AS subtotal
FROM item_pedido AS IP
INNER JOIN produto AS PR
    ON PR.id_produto = IP.id_produto
ORDER BY IP.id_pedido;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT
    C.id_cliente,
    C.nome,
    P.id_pedido,
    P.data_pedido
FROM cliente AS C
LEFT JOIN pedido AS P
    ON P.id_cliente = C.id_cliente
ORDER BY C.nome;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT
    C.id_cliente,
    C.nome,
    C.cidade,
    C.email
FROM cliente AS C
LEFT JOIN pedido AS P
    ON P.id_cliente = C.id_cliente
WHERE P.id_pedido IS NULL;

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto cada cliente gastou. Ordene do maior gasto para o menor.
SELECT
    C.id_cliente,
    C.nome AS cliente,
    COUNT(P.id_pedido) AS quantidade_pedidos,
    COALESCE(SUM(P.valor_total), 0) AS total_gasto
FROM cliente AS C
LEFT JOIN pedido AS P
    ON P.id_cliente = C.id_cliente
   AND P.status_pedido = 'FINALIZADO'
GROUP BY C.id_cliente, C.nome
ORDER BY total_gasto DESC;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.
SELECT
    CA.nome_categoria AS categoria,
    COUNT(PR.id_produto) AS quantidade_produtos,
    AVG(PR.preco) AS preco_medio
FROM categoria AS CA
LEFT JOIN produto AS PR
    ON PR.id_categoria = CA.id_categoria
GROUP BY CA.id_categoria, CA.nome_categoria;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
SELECT nome_produto, preco
FROM produto
WHERE preco > (
    SELECT AVG(preco)
    FROM produto
)
ORDER BY preco DESC;

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium e informe as faixas de preço.
SELECT
    nome_produto,
    preco,
    CASE
        WHEN preco < 8.00 THEN 'Econômico'
        WHEN preco <= 15.00 THEN 'Intermediário'
        ELSE 'Premium'
    END AS classificacao
FROM produto
ORDER BY preco ASC;


