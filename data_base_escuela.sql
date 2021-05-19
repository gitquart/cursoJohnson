
/*Creatin of Database*/
CREATE DATABASE dbSchool;

USE dbSchool;


CREATE TABLE tbStudent (
    idtbStudent int NOT NULL IDENTITY(1,1),
    firstName varchar(50) , 
    lastName varchar(50),
    
    PRIMARY KEY (idtbStudent));


CREATE TABLE tbTeacher (
    idtbTeacher int NOT NULL IDENTITY(1,1),
    firstName varchar(45) ,
    lastName varchar(45),
    PRIMARY KEY (idtbTeacher )
);


CREATE TABLE tbSubject (
    idtSubject int NOT NULL IDENTITY(1,1),
    subjectName varchar(45) ,
    subjectDesc varchar(45),
    credits int,
    fk_idTeacher int,
    PRIMARY KEY (idtSubject),
    FOREIGN KEY (fk_idTeacher) REFERENCES tbTeacher  (idtbTeacher));


CREATE TABLE tbStudent_tbTeacher (
    ID int NOT NULL IDENTITY(1,1),
    fk_idtbStudent INT,
    fk_idtbTeacher INT,    
    PRIMARY KEY (ID),
    FOREIGN KEY (fk_idtbStudent) REFERENCES tbStudent  (idtbStudent),
    FOREIGN KEY (fk_idtbTeacher) REFERENCES tbTeacher  (idtbTeacher));

/*End of Creating database*/

/*--------START OF SQL TRAINING--------*/

/*Insert values into tbStudent*/

INSERT INTO tbStudent VALUES ('John','Kirk')
INSERT INTO tbStudent VALUES ('Steve', 'Patrick')
INSERT INTO tbStudent VALUES ('Emma', 'Thompson')

SELECT * FROM tbStudent;

	
update tbStudent set firstName='John',lastName='Lambert' where idtbStudent=1;
update tbStudent set firstName='Steve',lastName='Patrick' where idtbStudent=2;
update tbStudent set firstName='Emma',lastName='Thompson' where idtbStudent=3;

SELECT * FROM tbStudent;

/*Insert values to tbSubject*/

INSERT INTO tbSubject values ('Math I','Basics of Math for College',30,1)
INSERT INTO tbSubject values ('Math II','Advanced of Math for College',35,1)
INSERT INTO tbSubject values ('Algorithms I','Basics of computing',35,2)
INSERT INTO tbSubject values ('Algorithms II','Learning of computing',35,3)

SELECT * FROM tbSubject;

/*Insert values into tbTeacher*/
	

INSERT INTO tbTeacher VALUES ('Maria','Wilson')
INSERT INTO tbTeacher VALUES ('Laura', 'Dawson')
INSERT INTO tbTeacher VALUES ('Laurie', 'Greek')

/*Alter table tbTeacher*/

alter table tbTeacher add profession varchar(50)
alter table tbTeacher add salary int

update tbTeacher set profession='Mathematician', salary=20000 where idtbTeacher=1
update tbTeacher set profession='Engineer', salary=40000 where idtbTeacher=2
update tbTeacher set profession='Architect', salary=50000 where idtbTeacher=3

SELECT * FROM tbTeacher;

/*INSERT data to tbStudent_tbTeacher*/

INSERT INTO tbStudent_tbTeacher values (1,1)
INSERT INTO tbStudent_tbTeacher values (2,1)
INSERT INTO tbStudent_tbTeacher values (3,1)
INSERT INTO tbStudent_tbTeacher values (1,2)
INSERT INTO tbStudent_tbTeacher values (2,2)
INSERT INTO tbStudent_tbTeacher values (3,2)

SELECT * FROM tbStudent_tbTeacher 


/*JOIN Example*/
	

SELECT * FROM tbStudent_tbTeacher 






/*END OF SQL TRAINING*/

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


