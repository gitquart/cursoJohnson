

    /*Crear vistas*/
    /*
    CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/

/*Example of a cursor in sql*/

DECLARE @Description AS nvarchar(400)
DECLARE ProdInfo CURSOR FOR SELECT [Description] FROM Production.ProductDescription
OPEN ProdInfo
FETCH NEXT FROM ProdInfo INTO @Description
WHILE @@fetch_status = 0
BEGIN
    PRINT @Description
    FETCH NEXT FROM ProdInfo INTO @Description
END
CLOSE ProdInfo
DEALLOCATE ProdInfo

/*Example of CASE*/

SELECT OrderID, Quantity,
CASE WHEN Quantity > 30 THEN 'The quantity is greater than 30'
WHEN Quantity = 30 THEN 'The quantity is 30'
ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;	

/*Creating an Stored procedure with fetch cursor*/


create procedure sp_WithFetch as
begin

DECLARE @ID AS int
DECLARE crs CURSOR FOR SELECT idtbmaestro FROM tbMaestro
OPEN crs
FETCH NEXT FROM crs INTO @ID
WHILE @@fetch_status = 0
BEGIN
    PRINT @ID
    FETCH NEXT FROM crs INTO @ID
END
CLOSE crs
DEALLOCATE crs

end


