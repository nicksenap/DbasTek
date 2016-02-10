/* SELECT firstname, lastname, EmployeeID ,city  FROM employees ORDER BY city; */
/* SELECT * FROM OrderDetails; */
SELECT Orders.OrderID,OrderDetails.OrderID, EmployeeID,SUM(UnitPrice) FROM Orders,OrderDetails GROUP BY EmployeeID/* WHERE Orders.OrderID= OrderDetails.OrderID;*/
