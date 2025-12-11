SELECT
    SUM(i.Quantity * i.Price) AS [Общая сумма отпущенного товара]
FROM Inventory i
WHERE i.Operation_Type = 'расход';