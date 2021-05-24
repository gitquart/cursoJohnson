
/*--------START OF SQL TRAINING DOCUMENT--------*/

/*VIDEO/ SECTION: Creation of a database in Microsoft SQL Server*/
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
    PRIMARY KEY (idtbTeacher ));


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



/*VIDEO / SECTION: INSERT & SELECT*/

/*Insert values into tbStudent*/

INSERT INTO tbStudent VALUES ('John','Kirk')
INSERT INTO tbStudent VALUES ('Steve', 'Patrick')
INSERT INTO tbStudent VALUES ('Emma', 'Thompson')

SELECT * FROM tbStudent;


/*Insert values into tbTeacher*/
	

INSERT INTO tbTeacher VALUES ('Maria','Wilson')
INSERT INTO tbTeacher VALUES ('Laura', 'Dawson')
INSERT INTO tbTeacher VALUES ('Laurie', 'Greek')

Select * from tbTeacher

/*Insert values to tbSubject*/

INSERT INTO tbSubject values ('Math I','Basics of Math for College',30,1)
INSERT INTO tbSubject values ('Math II','Advanced of Math for College',35,1)
INSERT INTO tbSubject values ('Algorithms I','Basics of computing',35,2)
INSERT INTO tbSubject values ('Algorithms II','Learning of computing',35,3)

SELECT * FROM tbSubject;

/*INSERT data to tbStudent_tbTeacher*/

INSERT INTO tbStudent_tbTeacher values (1,1)
INSERT INTO tbStudent_tbTeacher values (2,1)
INSERT INTO tbStudent_tbTeacher values (3,1)
INSERT INTO tbStudent_tbTeacher values (1,2)
INSERT INTO tbStudent_tbTeacher values (2,2)
INSERT INTO tbStudent_tbTeacher values (3,2)

SELECT * FROM tbStudent_tbTeacher 

/*VIDEO /SECTION : UPDATE*/

/*Setting different WHERE conditions*/
update tbStudent set firstName='Jonathan',lastName='Lambert' where idtbStudent=1;
update tbStudent set firstName='Johnny' where lastName='Lambert';

/*No WHERE condition*/

update tbStudent set firstName='Johnny',lastName='Coucou';


/*Back to Normal*/

update tbStudent set firstName='John',lastName='Lambert' where idtbStudent=1;
update tbStudent set firstName='Steve',lastName='Patrick' where idtbStudent=2;
update tbStudent set firstName='Emma',lastName='Thompson' where idtbStudent=3;

SELECT * FROM tbStudent;

/*VIDEO / SECTION: : ALTER*/

/*Alter table tbTeacher*/

alter table tbTeacher add profession varchar(50)
alter table tbTeacher add salary int

update tbTeacher set profession='Mathematician', salary=20000 where idtbTeacher=1
update tbTeacher set profession='Engineer', salary=40000 where idtbTeacher=2
update tbTeacher set profession='Architect', salary=50000 where idtbTeacher=3

SELECT * FROM tbTeacher;


/*VIDEO / SECTION : JOIN*/
	
select * from tbStudent_tbTeacher


SELECT main.fk_idtbStudent,stu.firstName,stu.lastName,main.fk_idtbTeacher,teach.firstName,teach.lastName FROM tbStudent_tbTeacher main 
inner join tbStudent stu on main.fk_idtbStudent=stu.idtbStudent
inner join tbTeacher teach on main.fk_idtbTeacher=teach.idtbTeacher


/*VIDEO / SECTION: REPLACE*/


SELECT lastName as 'OLD VALUE',REPLACE(lastName,'Patrick','Pat') as 'NEW VALUE' from tbStudent

/*Check again tbStudent to see the data is not modifief permanently*/
Select * from tbStudent;

/*VIDEO / SECTION :DELETE*/

delete from tbSubject where idtSubject=3;
delete from tbSubject
Select * from tbSubject;

/*VIDEO / SECTION : DROP */

drop table tbSubject;

/*To delete a database, first change it*/
use master;
drop database dbSchool;

/*VIDEO / SECTION: IMPORTING TABLE AND DATA FROM CSV, EXCEL.*/

Select * from tbStudent$;

/*Check teh tables created from EXCEL*/

Select * from tbStudent$;
select * from tbStudent_tbTeacher$;
select * from tbSubject$;
select * from tbTeacher$;

/*----------------------END OF SQL TRAINING-------------------------*/
