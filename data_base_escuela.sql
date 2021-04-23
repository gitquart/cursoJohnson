/*
Primero debemos crear la base de datos donde existirán nuestra tablas, en este caso: dbescuela. Y luego debemos “seleccionar” la base de datos, si sólo la creamos y no la seleccionamos no podremos trabajar con ella.
El prefijo “db” es una buena práctica para saber que el objeto es una base de datos.

*/

CREATE DATABASE dbescuela;
USE dbescuela;

/*
Se crea la tabla tbAlumno, el campo “idtbalumno” es la llave primaria (PK), 
por tanto, no puede ser nulo (Not null), su tipo es “número” (int) , puede ser otro tipo 
de dato pero normalmente las llaves primarias son números y auto incrementables (AUTO_INCREMENT) 
para que no se repitan. La PK puede ser otro tipo de dato como UUIDD, GUID, etc, mientras hagan único 
el valor. El resto de campos pueden ser del tipo de dato que el usuario decida. De manera similar crearemos el resto de tablas

*/

CREATE TABLE tbAlumno (
    idtbalumno int NOT NULL IDENTITY(1,1),
    nombre varchar(50) , 
    apellidoPaterno varchar(50),
    apellidoMaterno varchar (45),
    matricula varchar (45)
    PRIMARY KEY (idtbalumno));

/*Misma lógica aplicada que en la tabla “tbAlumno” ahora en "tbMaestro" */   

CREATE TABLE tbMaestro (
    idtbmaestro int NOT NULL IDENTITY(1,1),
    nombre varchar(45) ,
    apellidoPaterno varchar(45),
    apellidoMaterno varchar (45),
    PRIMARY KEY ( idtbmaestro )
);

DROP TABLE [dbo].[tbAlumno];

/*
El campo “créditos” podemos escribirlo con acento o sin acento, sin embargo una buena práctica es escribirlo sin acento “creditos” por razones prácticas.
El campo “créditos” se entiende que lleva un número, en este caso podemos decidir si ponerlo como tipo de dato texto o número, todo depende si el campo se usará en operaciones aritméticas. En este caso, asumiremos que “créditos” será usado para operaciones aritméticas, por tanto tiene tipo “INT” (Entero).
Para relacionar la tabla tbMateria con tbMaestro, necesitamos la instrucción de “FOREIGN KEY” con lo cual establecemos : “Aplica llave foránea al campo “fk_idmaestro” que hace referencia con la tabla tbMaestro con el campo “idtbMaestro” ”


*/

CREATE TABLE tbMateria_2 (
    idtbmateria int NOT NULL IDENTITY(1,1),
    nombre varchar(45) ,
    descripción varchar(45),
    creditos int,
    fk_idmaestro int,
	fk_idalumno int, 
    PRIMARY KEY (idtbmateria),
    FOREIGN KEY (fk_idmaestro) REFERENCES tbMaestro  (idtbmaestro),
	FOREIGN KEY (fk_idalumno) REFERENCES tbAlumno (idtbalumno));

	SELECT * FROM tbMateria_2
/*

Finalmente terminamos con la tabla “tbAlumno_tbMaestro” que es una tabla transitoria ya que es el resultado de una relación “N a N”, el nombre de la tabla es libre, pero se recomienda poner un nombre alusivo a la relación de las tablas.
Nótese que esta vez el campo identificador es “ID”, esto es otra prática común ya que la llave primeria sólo se refiere a un campod e la tabla, por tanto no se confundirá. Es decir, al nombrar un campo “ID” sabemos que hablamos de la llave primaria de una tabla, sin embargo el usuario puede nombrarlo como guste.
Al igual que en el ejemplo anterior, hacemos referencia de los campos foráneos (fk) a los campos de la tablas correspondientes. De igual manera estos campos se pueden nombrar como el usuario guste, pueden llevar el prefjo “fk” o no.


*/

CREATE TABLE tbAlumno_tbMaestro (
    ID int NOT NULL IDENTITY(1,1),
    fk_idtbalumno INT,
    fk_idtbmaestro INT,    
    PRIMARY KEY (ID),
    FOREIGN KEY (fk_idtbalumno) REFERENCES tbAlumno  (idtbalumno),
    FOREIGN KEY (fk_idtbmaestro) REFERENCES tbMaestro  (idtbmaestro));

	/* Como ver la tabla en sentencia */

	SELECT * FROM tbAlumno; 

	INSERT INTO tbAlumno VALUES ('Raul','Ventura','Quintero','ABC1234')

	INSERT INTO tbMaestro VALUES ('Martha', 'Palomo', 'Barajas')
	INSERT INTO tbMaestro VALUES ('Emma', 'Coronado', 'Saucedo')

	SELECT * FROM tbAlumno_tbMaestro;

	INSERT INTO tbAlumno_tbMaestro VALUES (1,2)

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


