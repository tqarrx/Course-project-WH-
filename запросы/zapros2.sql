SELECT 
    Recipient_ID AS [Код получателя],
    Name AS [Наименование],
    Address AS [Адрес],
    Phone AS [Телефон],
    Contact_Person AS [Контактное лицо]
FROM Recipients
ORDER BY Name;