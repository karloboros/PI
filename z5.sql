SELECT p.ProductID, p.ProductName, SUM(i.Total) AS Revenue
FROM dProducts as p
JOIN cOrderItems as i ON p.ProductID = i.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Revenue DESC