SELECT p.ProductName,
       SUM(CASE WHEN i.Discount > 0.0 THEN 1 ELSE 0 END) AS WithDiscount,
       SUM(CASE WHEN i.Discount = 0 THEN 1 ELSE 0 END) AS WithoutDiscount,
       SUM(CASE WHEN i.Discount > 0.0 THEN 1 ELSE 0 END) / SUM(CASE WHEN i.Discount = 0 THEN 1 ELSE 0 END) AS Ratio
FROM cOrderItems AS i
JOIN dProducts AS p ON p.ProductID = i.ProductID
GROUP BY p.ProductName
HAVING SUM(CASE WHEN i.Discount = 0 THEN 1 ELSE 0 END) > 0
ORDER BY Ratio DESC;