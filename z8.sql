SELECT c.ContactName, c.CompanyName, SUM(i.Total) AS Revenue
FROM dCustomers as c
JOIN cOrderItems as i ON c.CustomerID = i.CustomerID
GROUP BY c.ContactName, c.CompanyName
ORDER BY Revenue DESC
