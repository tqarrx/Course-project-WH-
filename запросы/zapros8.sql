DECLARE @Date DATE = '2025-10-15';

SELECT
    p.Product_ID AS [Код товара],
    p.Name AS [Наименование товара],
    SUM(i.Quantity) AS [Количество],
    SUM(i.Quantity * i.Price) AS [Сумма]
FROM Inventory i
INNER JOIN Products p ON i.Product_ID = p.Product_ID
INNER JOIN Expenses e ON i.Expense_ID = e.Expense_ID
WHERE i.Operation_Type = 'расход'
    AND CAST(e.ExpenseDate AS DATE) = @Date
GROUP BY p.Product_ID, p.Name;