SELECT c.CompanyName, o.OrderDate, DATEDIFF(day, OrderDate, ShippedDate) AS LateDeliveries
FROM cOrders as o
JOIN dCustomers as c ON c.CustomerID = o.CustomerID
ORDER BY DATEDIFF(day, OrderDate, ShippedDate) DESC

SELECT c.CompanyName, 
	SUM(CASE WHEN i.Delay = 'significant' THEN 1 ELSE 0 END) AS ReallyLateDeliveries,
	SUM(CASE WHEN i.Delay = 'moderate' THEN 1 ELSE 0 END) AS LateDeliveries
FROM cOrders as o
JOIN dCustomers as c ON c.CustomerID = o.CustomerID
LEFT JOIN cOrderItems as i ON i.OrderID = o.OrderID
GROUP BY c.CompanyName, o.OrderDate, o.ShippedDate
ORDER BY ReallyLateDeliveries DESC, LateDeliveries DESC