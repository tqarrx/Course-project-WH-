DECLARE @SupplierID INT = 1;

SELECT
    p.Product_ID AS [Код товара],
    p.Name AS [Наименование товара],
    SUM(i.Quantity) AS [Количество отпущенного],
    SUM(i.Quantity * i.Price) AS [Сумма отпущенного]
FROM Inventory i
INNER JOIN Products p ON i.Product_ID = p.Product_ID
INNER JOIN Expenses e ON i.Expense_ID = e.Expense_ID
INNER JOIN Storekeepers sk ON e.Storekeeper_ID = sk.Storekeeper_ID
INNER JOIN Receipts r ON r.Storekeeper_ID = sk.Storekeeper_ID
WHERE i.Operation_Type = 'расход'
AND r.Supplier_ID = @SupplierID
GROUP BY p.Product_ID, p.Name;