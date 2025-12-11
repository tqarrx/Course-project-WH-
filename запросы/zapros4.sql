DECLARE @ProductID INT = 1;

SELECT
    i.Operation_Type AS [Тип операции],
    i.Quantity AS [Количество],
    i.Price AS [Цена],
    COALESCE(r.ReceiptDate, e.ExpenseDate) AS [Дата операции],
    COALESCE(r.Doc_Number, e.DocNumber) AS [Номер документа],
    COALESCE(sk.Full_Name, sk2.Full_Name) AS [Кладовщик],
    COALESCE(s.Name, rec.Name) AS [Контрагент]
FROM Inventory i
LEFT JOIN Receipts r ON i.Receipt_ID = r.Receipt_ID
LEFT JOIN Suppliers s ON r.Supplier_ID = s.Supplier_ID
LEFT JOIN Storekeepers sk ON r.Storekeeper_ID = sk.Storekeeper_ID
LEFT JOIN Expenses e ON i.Expense_ID = e.Expense_ID
LEFT JOIN Recipients rec ON e.Recipient_ID = rec.Recipient_ID
LEFT JOIN Storekeepers sk2 ON e.Storekeeper_ID = sk2.Storekeeper_ID
WHERE i.Product_ID = @ProductID
ORDER BY [Дата операции];