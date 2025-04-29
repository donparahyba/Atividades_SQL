#1
SELECT c.NomeDaEmpresa
FROM Clientes c
LEFT JOIN Pedidos p ON c.CodigoDoCliente = p.CodigoDoCliente
WHERE p.NumeroDoPedido IS NULL;

#2
SELECT p.NomeDoProduto, c.NomeDaCategoria
FROM Produtos p
JOIN Categorias c ON p.CodigoDaCategoria = c.CodigoDaCategoria;

#3
SELECT pe.NumeroDoPedido, f.Nome + ' ' + f.Sobrenome AS NomeFuncionario
FROM Pedidos pe
JOIN Funcionarios f ON pe.CodigoDoFuncionario = f.CodigoDoFuncionario;

#4
SELECT p.NomeDoProduto, f.NomeDaEmpresa
FROM Produtos p
JOIN Fornecedores f ON p.CodigoDoFornecedor = f.CodigoDoFornecedor
ORDER BY f.NomeDaEmpresa ASC;

#5
SELECT f.Nome + ' ' + f.Sobrenome AS NomeFuncionario, p.NomeDoProduto
FROM Pedidos pe
JOIN Funcionarios f ON pe.CodigoDoFuncionario = f.CodigoDoFuncionario
JOIN Detalhes_do_Pedido dp ON pe.NumeroDoPedido = dp.NumeroDoPedido
JOIN Produtos p ON dp.CodigoDoProduto = p.CodigoDoProduto;

# inner (só join) outer (left right full)