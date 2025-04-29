#1
SELECT COUNT(*) AS unidades_cadastradas FROM bebida;

#2
SELECT COUNT(DISTINCT categoria) AS categorias_cadastradas FROM bebida;

#3
SELECT COUNT(*) AS com_copo FROM bebida WHERE bebida LIKE '%COPO%';

#6
SELECT * FROM bebida WHERE idbebida BETWEEN 100 AND 150;

#7
SELECT * FROM bebida WHERE bebida LIKE 'V%';

#8
SELECT * FROM bebida ORDER BY precocardapio DESC LIMIT 10;

#9
SELECT * FROM bebida ORDER BY precocardapio ASC LIMIT 20;

#10
SELECT * FROM bebida ORDER BY precocardapio DESC LIMIT 30;

#11
SELECT * FROM bebida WHERE codigo LIKE 'RV4%';

#12
SELECT bebida AS Produto, precocardapio AS 'Preço Venda',  custobebida AS 'Custo Bebida' FROM bebida;

#13
SELECT * FROM bebida WHERE bebida LIKE '%ZERO%';