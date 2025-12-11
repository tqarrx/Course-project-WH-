SELECT
    p.Product_ID AS [Код товара],
    p.Name AS [Наименование товара],
    p.MinQuantity AS [Минимальный запас],
    ISNULL(stock.QuantityOnStock, 0) AS [Остаток на складе],
    (p.MinQuantity - ISNULL(stock.QuantityOnStock, 0)) AS [Требуемое количество]
FROM Products p
LEFT JOIN (
    SELECT
        Product_ID,
        SUM(CASE WHEN Operation_Type = 'приход' THEN Quantity ELSE 0 END) -
        SUM(CASE WHEN Operation_Type = 'расход' THEN Quantity ELSE 0 END) AS QuantityOnStock
    FROM Inventory
    GROUP BY Product_ID
) stock ON p.Product_ID = stock.Product_ID
WHERE ISNULL(stock.QuantityOnStock, 0) < p.MinQuantity
ORDER BY [Требуемое количество] DESC;