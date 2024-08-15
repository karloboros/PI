SELECT TOP 5 s.CompanyName, SUM(o.Freight) AS TotalFreightPaid
FROM cOrders AS o
JOIN dShippers AS s ON o.ShipperID = s.ShipperID
GROUP BY s.CompanyName
ORDER BY SUM(o.Freight) DESC;
