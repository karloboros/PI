SELECT i.DiscountDesc, SUM(Total) AS TotalDiscountType
FROM cOrderItems as i
GROUP BY i.DiscountDesc
ORDER BY TotalDiscountType DESC

SELECT o.PaymentMethod, SUM(i.Total) AS TotalPaymentType
FROM cOrderItems as i
JOIN cOrders as o ON o.OrderID = i.OrderID
GROUP BY o.PaymentMethod
ORDER BY TotalPaymentType DESC