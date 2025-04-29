-- 1. 
SELECT SUM(Frete) AS TotalFrete FROM Pedidos;

-- 2. 
SELECT COUNT(*) AS TotalFuncionarios 
FROM Funcionarios 
WHERE YEAR(DataDeContratação) = 1992;

-- 3. 
SELECT COUNT(*) AS TotalFornecedores 
FROM Fornecedores 
WHERE Pais = 'Alemanha';

-- 4. 
SELECT SUM(Quantidade) AS TotalQuantidadeVendida 
FROM DetalhesDoPedido;

-- 5. 
SELECT MAX(Frete) AS FreteMaisCaro FROM Pedidos;

-- 6.
SELECT MIN(Desconto) AS DescontoMaisBarato FROM DetalhesDoPedido;

-- 7. 
SELECT COUNT(*) AS TotalProdutosCondimentos 
FROM Produtos 
WHERE CodigoDaCategoria = 2;

-- 8. 
SELECT COUNT(*) AS TotalCategorias 
FROM Categorias 
WHERE NomeDaCategoria LIKE 'C%';

-- 9. 
SELECT COUNT(*) AS TotalProdutosEstoqueBaixo 
FROM Produtos 
WHERE UnidadesEmEstoque < NivelDeReposicao;

-- 10. 
SELECT SUM(PrecoUnitario) AS TotalPrecosUnitarios FROM Produtos;

-- 11. 
SELECT SUM(PrecoUnitario * Quantidade) AS TotalVendido 
FROM DetalhesDoPedido 
WHERE CodigoDoProduto = 51;

-- 12. 
SELECT COUNT(*) AS TotalPedidos 
FROM Pedidos 
WHERE CodigoDoCliente = 'ROMEY' AND YEAR(DataDoPedido) = 1996;

-- 13. .
SELECT COUNT(*) AS TotalAniversariantesJulho 
FROM Funcionarios 
WHERE MONTH(DataDeNascimento) = 7;

-- 14.
SELECT COUNT(*) AS TotalProdutos 
FROM Produtos 
WHERE NomeDoProduto LIKE 'C%' 
   OR NomeDoProduto LIKE 'G%' 
   OR NomeDoProduto LIKE 'N%';

-- 15. 
SELECT COUNT(*) AS TotalClientes 
FROM Clientes 
WHERE Pais IN ('Alemanha', 'México', 'Reino Unido');

-- 16.
SELECT COUNT(*) AS TotalClientesSemFax 
FROM Clientes 
WHERE Fax IS NULL OR Fax = '';

-- 17. 
SELECT SUM(PrecoUnitario * UnidadesEmEstoque) AS TotalEstoque FROM Produtos;

-- 18. 
SELECT SUM(PrecoUnitario * Quantidade) AS TotalVendas FROM DetalhesDoPedido;

-- 19. 
SELECT SUM(PrecoUnitario * Quantidade) AS TotalVendidoProduto19 
FROM DetalhesDoPedido 
WHERE CodigoDoProduto = 19;

-- 20. 
SELECT SUM(Frete) AS TotalFreteLILAS 
FROM Pedidos 
WHERE CodigoDoCliente = 'LILAS';