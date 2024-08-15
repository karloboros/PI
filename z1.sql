SELECT p.ProductName, COUNT(*) AS NumOrders
FROM cOrderItems AS i
JOIN dProducts AS p ON i.ProductID = p.ProductID
WHERE i.OrderDate >= DATEADD(month, -1, (SELECT MAX(OrderDate) FROM cOrderItems WHERE OrderDate <= CAST(GETDATE() AS DATE)))
  AND i.OrderDate <= (SELECT MAX(OrderDate) FROM cOrderItems WHERE OrderDate <= CAST(GETDATE() AS DATE))
GROUP BY p.ProductID, p.ProductName
ORDER BY COUNT(*) DESC;


SELECT p.CategoryName, COUNT(*) AS NumOrders
FROM cOrderItems AS i
JOIN dProducts AS p ON i.ProductID = p.ProductID
WHERE i.OrderDate >= DATEADD(month, -1, (SELECT MAX(OrderDate) FROM cOrderItems WHERE OrderDate <= CAST(GETDATE() AS DATE)))
  AND i.OrderDate <= (SELECT MAX(OrderDate) FROM cOrderItems WHERE OrderDate <= CAST(GETDATE() AS DATE))
GROUP BY p.CategoryName
ORDER BY COUNT(*) DESC;
