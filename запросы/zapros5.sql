SELECT  
    rec.Recipient_ID AS [Код получателя],  
    rec.Name AS [Наименование получателя],  
    SUM(i.Quantity * i.Price) AS [Сумма полученного товара]  
FROM Inventory i  
INNER JOIN Expenses e ON i.Expense_ID = e.Expense_ID  
INNER JOIN Recipients rec ON e.Recipient_ID = rec.Recipient_ID  
WHERE i.Operation_Type = 'расход'  
GROUP BY rec.Recipient_ID, rec.Name  
ORDER BY [Сумма полученного товара] DESC;