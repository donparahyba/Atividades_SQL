-- 1
SELECT CodigoDoCliente, NomeDaEmpresa, Endereco FROM Clientes;

-- 2
SELECT Sobrenome, Nome, DataDeNascimento, DataDeContratacao FROM Funcionarios;

-- 3
SELECT CodigoDaCategoria, NomeDaCategoria, Descricao FROM Categorias;

-- 4
SELECT NomeDaEmpresa, NomeDoContato, Telefone FROM Fornecedores;

-- 5
SELECT CodigoDoProduto, NomeDoProduto, PrecoUnitario FROM Produtos;

-- 6
SELECT CodigoDaTransportadora, NomeDaEmpresa, Telefone FROM Transportadoras;

-- 7
SELECT NomeDaEmpresa AS NomeDoCliente, Endereco, 'Cliente preferencial' AS Status FROM Clientes;

-- 8
SELECT CodigoDoProduto, 'Produto existente' AS Status, NomeDoProduto FROM Produtos;

-- 9
SELECT Endereco, TelefoneResidencial, 'Pertence ao quadro' AS Quadro, Ramal, 'Ativo' AS Status FROM Funcionarios;

-- 10
SELECT NomeDaCategoria, Descricao, 'Definição' AS Definicao FROM Categorias;

-- 11
SELECT TOP 5 * FROM Pedidos;

-- 12
SELECT TOP 15 * FROM Funcionarios;

-- 13
SELECT TOP 3 NomeDaEmpresa FROM Fornecedores;

-- 14
SELECT TOP 20 * FROM Produtos;

-- 15
SELECT TOP 2 * FROM Categorias;

-- 16
SELECT Nome AS Funcionario, Cargo AS Funcao, Tratamento AS Titulo FROM Funcionarios;

-- 17
SELECT NomeDaEmpresa AS Empresa, NomeDoContato AS Contato, CargoDoContato AS Cargo FROM Fornecedores;

-- 18
SELECT Nome, TelefoneResidencial AS Fone, Observacoes AS Obs FROM Funcionarios;

-- 19
SELECT NomeDaCategoria AS Categoria, Descricao AS Observacao, 'Aprovado' AS Situacao FROM Categorias;

-- 20
SELECT CodigoDoProduto, NomeDoProduto, PrecoUnitario, PrecoUnitario * 1.07 AS PrecoComAcrescimo FROM Produtos;

-- 21
SELECT Nome, Sobrenome FROM Funcionarios ORDER BY Nome DESC;

-- 22
SELECT CodigoDoProduto, NomeDoProduto, PrecoUnitario FROM Produtos ORDER BY NomeDoProduto ASC;

-- 23
SELECT CodigoDoProduto AS 'Cód.', NomeDoProduto AS Produto, PrecoUnitario AS 'P. Unitário' FROM Produtos ORDER BY CodigoDoProduto DESC;

-- 24
SELECT Pais, Regiao, CodigoDoFornecedor, NomeDaEmpresa, NomeDoContato 
FROM Fornecedores 
ORDER BY Pais ASC, Regiao DESC, NomeDaEmpresa ASC;

-- 25
SELECT CodigoDoFuncionario, Sobrenome, Nome 
FROM Funcionarios 
ORDER BY Pais ASC;