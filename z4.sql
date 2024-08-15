SELECT e.EmployeeID, e.LastName, e.FirstName, SUM(i.Total) AS Revenue
FROM dEmployees as e
JOIN cOrderItems as i ON e.EmployeeID = i.EmployeeID
GROUP BY e.EmployeeID, e.LastName, e.FirstName
ORDER BY Revenue DESC