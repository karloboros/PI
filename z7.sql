SELECT v.hour, COUNT(*) as Deliveries
FROM cOrders as o
JOIN ShippedTime as v ON o.ShippedTime = v.formattedTime
GROUP BY v.hour
ORDER BY Deliveries DESC