-- 1. Adicionar coluna Total_Pedido à tabela Pedidos
ALTER TABLE Pedidos
ADD Total_Pedido smallmoney;

-- 2. Atualizar a coluna Total_Pedido com base na soma dos detalhes do pedido
UPDATE Pedidos
SET Total_Pedido = (
    SELECT SUM(PrecoUnitario * Quantidade * (1 - Desconto))
    FROM [Detalhes do Pedido] DP
    WHERE DP.NumeroDoPedido = Pedidos.NumeroDoPedido
);

-- 3. Trigger para informar o número total de clientes após inserção
CREATE TRIGGER trg_Cliente_Insert
ON Clientes
AFTER INSERT
AS
BEGIN
    DECLARE @Total INT;
    SELECT @Total = COUNT(*) FROM Clientes;

    PRINT 'Total de registros na tabela Clientes: ' + CAST(@Total AS VARCHAR);
END;

-- 4. Trigger para atualizar Total_Pedido após inserção em Detalhes do Pedido
CREATE TRIGGER trg_UpdateTotalPedido
ON [Detalhes do Pedido]
AFTER INSERT
AS
BEGIN
    UPDATE Pedidos
    SET Total_Pedido = (
        SELECT SUM(PrecoUnitario * Quantidade * (1 - Desconto))
        FROM [Detalhes do Pedido]
        WHERE [Detalhes do Pedido].NumeroDoPedido = Pedidos.NumeroDoPedido
    )
    WHERE NumeroDoPedido IN (SELECT DISTINCT NumeroDoPedido FROM INSERTED);
END;

-- 5. Trigger para verificar o estoque antes de inserir em Detalhes do Pedido
CREATE TRIGGER trg_VerificaEstoque
ON [Detalhes do Pedido]
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        JOIN Produtos p ON i.CodigoDoProduto = p.CodigoDoProduto
        WHERE i.Quantidade > p.UnidadesEmEstoque
    )
    BEGIN
        RAISERROR ('Quantidade solicitada maior que o estoque disponível.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO [Detalhes do Pedido] (CodigoDoProduto, NumeroDoPedido, PrecoUnitario, Quantidade, Desconto)
        SELECT CodigoDoProduto, NumeroDoPedido, PrecoUnitario, Quantidade, Desconto
        FROM INSERTED;
    END
END;

-- 6. Trigger para excluir registros em Detalhes do Pedido ao excluir um Pedido
CREATE TRIGGER trg_DeletePedido
ON Pedidos
AFTER DELETE
AS
BEGIN
    DELETE FROM [Detalhes do Pedido]
    WHERE NumeroDoPedido IN (SELECT NumeroDoPedido FROM DELETED);
END;