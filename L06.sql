-- 1.
SELECT NomeDoProduto 
FROM Produtos 
WHERE PrecoUnitario > (SELECT AVG(PrecoUnitario) FROM Produtos);

-- 2. 
SELECT DISTINCT C.NomeDaEmpresa
FROM Clientes C
JOIN Pedidos P ON C.CodigoDoCliente = P.CodigoDoCliente
JOIN DetalhesDoPedido DP ON P.NumeroDoPedido = DP.NumeroDoPedido
JOIN Produtos PR ON DP.CodigoDoProduto = PR.CodigoDoProduto
WHERE PR.NomeDoProduto = 'Maxilaku';

-- 3. 
SELECT NumeroDoPedido 
FROM DetalhesDoPedido 
GROUP BY NumeroDoPedido 
HAVING SUM(Quantidade) > 5;

-- 4. 
SELECT C.NomeDaEmpresa, MAX(DP.PrecoUnitario * DP.Quantidade) AS MaiorPedido
FROM Clientes C
JOIN Pedidos P ON C.CodigoDoCliente = P.CodigoDoCliente
JOIN DetalhesDoPedido DP ON P.NumeroDoPedido = DP.NumeroDoPedido
GROUP BY C.NomeDaEmpresa;

-- 5. 
SELECT PR.NomeDoProduto, MAX(DP.Quantidade) AS MaiorQuantidadeVendida
FROM Produtos PR
JOIN DetalhesDoPedido DP ON PR.CodigoDoProduto = DP.CodigoDoProduto
GROUP BY PR.NomeDoProduto;

-- 6.
SELECT PR.NomeDoProduto, MIN(DP.PrecoUnitario) AS PrecoMaisBaixo
FROM Produtos PR
JOIN DetalhesDoPedido DP ON PR.CodigoDoProduto = DP.CodigoDoProduto
GROUP BY PR.NomeDoProduto;

-- 7. 
FROM Pedidos 
WHERE YEAR(DataDoPedido) = 1996 
AND MONTH(DataDoPedido) BETWEEN 4 AND 6
AND Via = (SELECT CodigoDaTransportadora FROM Transportadoras WHERE NomeDaEmpresa = 'Speedy Express');

-- 8. 
SELECT NumeroDoPedido 
FROM Pedidos 
WHERE (YEAR(DataDoPedido) = 1996 AND MONTH(DataDoPedido) = 4)
   OR (YEAR(DataDoPedido) = 1997 AND MONTH(DataDoPedido) = 3);

-- 9.
SELECT NumeroDoPedido
FROM DetalhesDoPedido
WHERE (PrecoUnitario * Quantidade - Desconto) > 
      (SELECT AVG(PrecoUnitario * Quantidade - Desconto) 
       FROM DetalhesDoPedido 
       JOIN Pedidos ON DetalhesDoPedido.NumeroDoPedido = Pedidos.NumeroDoPedido
       WHERE YEAR(DataDoPedido) = 1997 AND MONTH(DataDoPedido) BETWEEN 4 AND 6);

-- 10.
SELECT DISTINCT F.NomeDaEmpresa 
FROM Fornecedores F
JOIN Produtos P ON F.CodigoDoFornecedor = P.CodigoDoFornecedor
WHERE P.PrecoUnitario > (SELECT AVG(PrecoUnitario) FROM Produtos);

-- 11. 
SELECT NomeDoProduto, PrecoUnitario
FROM Produtos
WHERE CodigoDaCategoria = (SELECT CodigoDaCategoria FROM Categorias WHERE NomeDaCategoria = 'Confeitos');

-- 12.
SELECT NumeroDoPedido, CodigoDoCliente, DataDoPedido
FROM Pedidos
WHERE Via IN (SELECT CodigoDaTransportadora FROM Transportadoras WHERE NomeDaEmpresa IN ('Speedy Express', 'Federal Shipping'));

-- 13. 
SELECT C.NomeDaEmpresa, P.NumeroDoPedido, P.DataDoPedido
FROM Clientes C
JOIN Pedidos P ON C.CodigoDoCliente = P.CodigoDoCliente
WHERE (YEAR(DataDoPedido) = 1996 AND MONTH(DataDoPedido) = 8)
   OR (YEAR(DataDoPedido) = 1997 AND MONTH(DataDoPedido) = 9);

-- 14. 
SELECT NumeroDoPedido
FROM Pedidos
WHERE CodigoDoCliente IN (SELECT CodigoDoCliente FROM Clientes WHERE Fax IS NULL OR Fax = '');

-- 15. 
SELECT C.NomeDaEmpresa
FROM Clientes C
JOIN Pedidos P ON C.CodigoDoCliente = P.CodigoDoCliente
JOIN DetalhesDoPedido DP ON P.NumeroDoPedido = DP.NumeroDoPedido
GROUP BY C.NomeDaEmpresa
HAVING SUM(DP.PrecoUnitario * DP.Quantidade) > 
       (SELECT AVG(PrecoUnitario * Quantidade) FROM DetalhesDoPedido);

-- 16. 
SELECT Nome
FROM Funcionarios
WHERE DATEDIFF(YEAR, DataDeNascimento, GETDATE()) < 
      (SELECT AVG(DATEDIFF(YEAR, DataDeNascimento, GETDATE())) FROM Funcionarios);

-- 17. 
SELECT F.Nome
FROM Funcionarios F
JOIN Pedidos P ON F.CodigoDoFuncionario = P.CodigoDoFuncionario
GROUP BY F.Nome
HAVING COUNT(P.NumeroDoPedido) > 
       (SELECT AVG(PedidosFeitos) 
        FROM (SELECT COUNT(*) AS PedidosFeitos FROM Pedidos GROUP BY CodigoDoFuncionario) AS MediaPedidos);

-- 18. 
SELECT NumeroDoPedido
FROM Pedidos
WHERE CodigoDoCliente IN (SELECT CodigoDoCliente FROM Clientes WHERE Fax IS NULL OR Fax = '');

-- 19. 
SELECT NomeDaEmpresa
FROM Clientes
WHERE CodigoDoCliente NOT IN (SELECT DISTINCT CodigoDoCliente FROM Pedidos);

-- 20. 
SELECT DISTINCT P.NumeroDoPedido
FROM Pedidos P
JOIN DetalhesDoPedido DP ON P.NumeroDoPedido = DP.NumeroDoPedido
JOIN Produtos PR ON DP.CodigoDoProduto = PR.CodigoDoProduto
JOIN Categorias C ON PR.CodigoDaCategoria = C.CodigoDaCategoria
WHERE C.NomeDaCategoria = 'Bebidas';