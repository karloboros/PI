SELECT s.CompanyName, SUM(Total) AS TotalRevenue
FROM cOrderItems AS i
JOIN dShippers AS s ON i.ShipperID = s.ShipperID
WHERE i.OrderDate >= DATEADD(month, -1, (SELECT MAX(OrderDate) FROM cOrderItems WHERE OrderDate <= CAST(GETDATE() AS DATE))) AND i.OrderDate <= (SELECT MAX(OrderDate) FROM cOrderItems WHERE OrderDate <= CAST(GETDATE() AS DATE))
GROUP BY s.CompanyName
ORDER BY SUM(Total) DESC