--  1

SELECT P.NumeroDoPedido, C.NomeDaEmpresa, C.Telefone, C.Fax
FROM Pedidos P
JOIN Clientes C ON P.CodigoDoCliente = C.CodigoDoCliente;

--2

SELECT C.CodigoDoCliente, C.NomeDaEmpresa, P.DataDoPedido, P.Frete
FROM Pedidos P
JOIN Clientes C ON P.CodigoDoCliente = C.CodigoDoCliente;

--3

SELECT F.CodigoDoFuncionario, F.Nome, F.Cargo, P.CodigoDoCliente, P.DataDoPedido
FROM Pedidos P
JOIN Funcionarios F ON P.CodigoDoFuncionario = F.CodigoDoFuncionario;

--4

SELECT P.NumeroDoPedido, P.DataDoPedido, P.DataDeEntrega, T.NomeDaEmpresa
FROM Pedidos P
JOIN Transportadoras T ON P.CodigoDaTransportadora = T.CodigoDaTransportadora;

--5

SELECT F.Nome, P.NumeroDoPedido, C.NomeDaEmpresa
FROM Pedidos P
JOIN Funcionarios F ON P.CodigoDoFuncionario = F.CodigoDoFuncionario
JOIN Clientes C ON P.CodigoDoCliente = C.CodigoDoCliente;

--6

SELECT PR.NomeDoProduto, CAT.NomeDaCategoria, FORN.NomeDaEmpresa
FROM Produtos PR
JOIN Categorias CAT ON PR.CodigoDaCategoria = CAT.CodigoDaCategoria
JOIN Fornecedores FORN ON PR.CodigoDoFornecedor = FORN.CodigoDoFornecedor;

--7

SELECT PR.NomeDoProduto, DP.PrecoUnitario, DP.Quantidade, P.NumeroDoPedido, T.NomeDaEmpresa
FROM DetalhesDoPedido DP
JOIN Produtos PR ON DP.CodigoDoProduto = PR.CodigoDoProduto
JOIN Pedidos P ON DP.NumeroDoPedido = P.NumeroDoPedido
JOIN Transportadoras T ON P.CodigoDaTransportadora = T.CodigoDaTransportadora;

--8

SELECT PR.NomeDoProduto, P.DataDoPedido, C.NomeDaEmpresa
FROM DetalhesDoPedido DP
JOIN Produtos PR ON DP.CodigoDoProduto = PR.CodigoDoProduto
JOIN Pedidos P ON DP.NumeroDoPedido = P.NumeroDoPedido
JOIN Clientes C ON P.CodigoDoCliente = C.CodigoDoCliente;

--9

SELECT F.NomeDaEmpresa, PR.NomeDoProduto, PR.PrecoUnitario, P.DataDoPedido, C.NomeDaEmpresa AS NomeDoCliente
FROM DetalhesDoPedido DP
JOIN Produtos PR ON DP.CodigoDoProduto = PR.CodigoDoProduto
JOIN Fornecedores F ON PR.CodigoDoFornecedor = F.CodigoDoFornecedor
JOIN Pedidos P ON DP.NumeroDoPedido = P.NumeroDoPedido
JOIN Clientes C ON P.CodigoDoCliente = C.CodigoDoCliente;

--10

SELECT F.Nome, C.NomeDaEmpresa
FROM Pedidos P
JOIN Funcionarios F ON P.CodigoDoFuncionario = F.CodigoDoFuncionario
JOIN Clientes C ON P.CodigoDoCliente = C.CodigoDoCliente;

--11

SELECT C.NomeDaCategoria, P.NomeDoProduto, DP.PrecoUnitario, DP.Quantidade, DP.Desconto
FROM DetalhesDoPedido DP
JOIN Produtos P ON DP.CodigoDoProduto = P.CodigoDoProduto
JOIN Categorias C ON P.CodigoDaCategoria = C.CodigoDaCategoria;

--12

SELECT P.NumeroDoPedido, P.DataDoPedido, C.NomeDaEmpresa AS Cliente, T.NomeDaEmpresa AS Transportadora
FROM Pedidos P
JOIN Clientes C ON P.CodigoDoCliente = C.CodigoDoCliente
JOIN Transportadoras T ON P.CodigoDaTransportadora = T.CodigoDaTransportadora;

--13

SELECT P.CodigoDoProduto, P.NomeDoProduto, F.CodigoDoFornecedor, F.NomeDaEmpresa
FROM Produtos P
JOIN Fornecedores F ON P.CodigoDoFornecedor = F.CodigoDoFornecedor;

--14

SELECT F.Nome, P.NumeroDoPedido, T.NomeDaEmpresa
FROM Pedidos P
JOIN Funcionarios F ON P.CodigoDoFuncionario = F.CodigoDoFuncionario
JOIN Transportadoras T ON P.CodigoDaTransportadora = T.CodigoDaTransportadora;

--15

SELECT DISTINCT PR.NomeDoProduto
FROM DetalhesDoPedido DP
JOIN Produtos PR ON DP.CodigoDoProduto = PR.CodigoDoProduto;

--16

SELECT F.Nome, 
       SUM(DP.PrecoUnitario * DP.Quantidade) AS TotalVendas,
       SUM(DP.PrecoUnitario * DP.Quantidade) * 0.05 AS Comissao_5,
       SUM(DP.PrecoUnitario * DP.Quantidade) * 0.10 AS Comissao_10
FROM DetalhesDoPedido DP
JOIN Pedidos P ON DP.NumeroDoPedido = P.NumeroDoPedido
JOIN Funcionarios F ON P.CodigoDoFuncionario = F.CodigoDoFuncionario
GROUP BY F.Nome;

--17

SELECT C.NomeDaCategoria, SUM(DP.Quantidade) AS TotalVendidos
FROM DetalhesDoPedido DP
JOIN Produtos P ON DP.CodigoDoProduto = P.CodigoDoProduto
JOIN Categorias C ON P.CodigoDaCategoria = C.CodigoDaCategoria
GROUP BY C.NomeDaCategoria;

--18

SELECT T.NomeDaEmpresa, SUM(P.Frete) AS TotalFrete, COUNT(P.NumeroDoPedido) AS TotalPedidos
FROM Pedidos P
JOIN Transportadoras T ON P.CodigoDaTransportadora = T.CodigoDaTransportadora
GROUP BY T.NomeDaEmpresa;

--19

SELECT C.NomeDaEmpresa, SUM(DP.Desconto) AS TotalDesconto
FROM DetalhesDoPedido DP
JOIN Pedidos P ON DP.NumeroDoPedido = P.NumeroDoPedido
JOIN Clientes C ON P.CodigoDoCliente = C.CodigoDoCliente
GROUP BY C.NomeDaEmpresa;

--20

SELECT F.Nome, SUM(DP.Desconto) AS TotalDesconto
FROM DetalhesDoPedido DP
JOIN Pedidos P ON DP.NumeroDoPedido = P.NumeroDoPedido
JOIN Funcionarios F ON P.CodigoDoFuncionario = F.CodigoDoFuncionario
GROUP BY F.Nome;
