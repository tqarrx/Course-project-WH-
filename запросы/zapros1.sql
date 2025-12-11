SELECT 
    p.Product_ID AS [KoA товара],
    p.Name AS [Наименование товара],
    SUM(CASE WHEN i.Operation_Type = 'приход' THEN i.Quantity ELSE 0 END) -
    SUM(CASE WHEN i.Operation_Type = 'расход' THEN i.Quantity ELSE 0 END) AS [Количество на складе],
    SUM(CASE WHEN i.Operation_Type = 'приход' THEN i.Quantity * i.Price ELSE 0 END) -
    SUM(CASE WHEN i.Operation_Type = 'расход' THEN i.Quantity * i.Price ELSE 0 END) AS [Стоимость на складе]
FROM Products p
LEFT JOIN Inventory i ON p.Product_ID = i.Product_ID
GROUP BY p.Product_ID, p.Name
HAVING (SUM(CASE WHEN i.Operation_Type = 'приход' THEN i.Quantity ELSE 0 END) -
    SUM(CASE WHEN i.Operation_Type = 'расход' THEN i.Quantity ELSE 0 END)) > 0
ORDER BY p.Name;