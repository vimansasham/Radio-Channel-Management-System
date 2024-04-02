create database Radio_channel_Management_System;
Use Radio_channel_Management_System;

Create table Employee(
Empl_ID varchar(25) not null,
Empl_Name varchar(25) not null,
Age int not null,
NIC varchar(25) not null,
DateOfBirth varchar(25) not null,
Position varchar(25) not null,
Manager_ID varchar(25),
Station_ID varchar(25) not null,
Genre_ID varchar(25),
primary key (Empl_ID),
unique(NIC)
);

Create table Employee_ContactInfo(
Empl_ID varchar(25) not null,
Contact_No varchar(25) not null,
primary key ( Contact_No)
);


Create table RadioStation(
Station_ID varchar(25) not null,
Station_Name varchar(25) not null,
Province varchar(25) not null,
District varchar(25) not null,
Street varchar(25) not null,
Frequency varchar(25) not null,
primary key (Station_ID)
);


Create table Schedule(
Scheduled_ID varchar(25) not null,
Date date not null,
Time time not null,
Program_Name varchar(25) not null,
Program_ID varchar(25) not null,
primary key (Scheduled_ID)
);


Create table Genre(
Genre_ID varchar(45) not null,
Program_ID varchar(25) not null,
Ad_ID varchar(45) not null,
Genre_Name varchar(45) not null,
primary key (Genre_ID)
);


Create table User_ContactInfo(
User_ID varchar(45) not null,
Contact_NO varchar(25) not null,
primary key (Contact_NO,User_ID)
);


Create table User(
User_ID varchar(25) not null,
Station_ID varchar(25) not null,
Program_ID varchar(25) not null,
User_Name varchar(25) not null,
Province varchar(25),
District varchar(25),
Street varchar(25),
primary key (User_ID)
);


Create table User_FavouriteGenres(
User_ID varchar(25) not null,
Favourite_Genres varchar(25),
primary key (User_ID,Favourite_Genres)
);

ALTER TABLE User_FavouriteGenres
ADD INDEX idx_Favourite_Genres (Favourite_Genres);



Create table Playlist(
Genres varchar(25),
Time time ,
Date date,
Ranking int,
Total_Duration varchar(25)
);
ALTER TABLE Playlist
ADD INDEX idx_Ranking (Ranking);



Create table Song(
Song_Name varchar(25) not null,
Artist varchar(25) not null,
Ranking int not null
);


Create table Manager(
Station_ID varchar(25) not null,
Manager_ID varchar(25) not null,
Manager_Name varchar(25) not null,
Position varchar(25) not null,
primary key (Manager_ID)
);


Create table Manager_ContactInfo(
Manager_ID varchar(25) not null,
Contact_No int not null,
primary key ( Contact_No)
);

Create table Holding_Language(
Language varchar(25) not null,
Language_ID varchar(25) not null,
primary key ( Language_ID)
);

Create table Program(
Program_ID varchar(25) not null,
Title varchar(25) not null,
Duration varchar(25) not null,
Empl_ID varchar(25) not null,
Station_ID varchar(25) not null,
primary key (Program_ID)
);


Create table DiskJockey(
DJ_Name varchar(25) not null,
Empl_ID varchar(25) not null,
Station_ID varchar(25) not null,
primary key ( Empl_ID)
);


Create table Advertisement(
Ad_ID varchar(25) not null,
Product varchar(25) not null,
Station_ID varchar (25) not null,
primary key ( Ad_ID)
);


Create table Ad_Slot(
Ad_ID varchar(25) not null,
Scheduled_ID varchar(25) not null,
Date date not null,
Time time not null,
Duration time not null,
primary key ( Ad_ID, Scheduled_ID)
);


-- ***************** Insert the 6 rows of data to all the tables.*****************************************

insert into Ad_Slot(Scheduled_ID,Ad_ID,Date,Time,Duration) values
		('sh1001','Ad2011','2023-05-04','08:00:00','00:01:00'),
		('sh1002','Ad2012','2023-05-09','08:00:00','00:01:00'),
		('sh1003','Ad2013','2023-08-04','07:00:00','00:01:00'),
		('sh1004','Ad2014','2023-08-10','08:00:00','00:01:00'),
		('sh1005','Ad2015','2023-09-14','09:00:00','00:01:00'),
		('sh1006','Ad2016','2023-12-04','10:00:00','00:01:00');

select * from Ad_Slot;

insert into Employee(Empl_ID,Station_ID,NIC,Empl_Name,Age,DateOfBirth,Position,Genre_ID,Manager_ID) values
		('Em1108','st1001','996500278v','Mahesh','36','1994-05-06','Manager','Ge106','Em1113'),
		('Em1102','st1002','996500272v','Lahiru','27','1997-06-04','presenter','Ge102', 'Em1109'),
		('Em1107','st1003','996500277v','Amali','28','1997-04-19','Host','Ge103','Em1108'),
		('Em1104','st1004','996500274v','Demo','29','1997-12-01','presenter','Ge104','Em1111'),
		('Em1105','st1005','996500275v','Bima','30','1995-06-04','presenter','Ge105','Em1112'),
		('Em1106','st1006','996500276v','Dila','31','1999-03-10','presenter','Ge106', 'Em1110'),
		('Em1101','st1001','996508276v','Sachin','31','1996-05-04','presenter','Ge101','Em1108'),
		('Em1103','st1003','996509276v','Amali','31','1993-11-08','presenter','Ge103','Em1109');
select * from Employee;

insert into Employee_ContactInfo(Empl_ID,Contact_No) values
		('Em1101','0912336725'),
		('Em1101','0712336725'),
		('Em1102','0772336725'),
		('Em1102','0752336721'),
		('Em1103','0712336721'),
		('Em1104','0712336722'),
		('Em1105','0712336723'),
		('Em1106','0712336724');
        
select * from Employee_ContactInfo;

insert into Genre(Genre_ID,Program_ID,Ad_ID,Genre_Name) values
		('Ge101','Pr101','Ad2011','Sport'),
		('Ge102','Pr102','Ad2012','Child'),
		('Ge103','Pr103','Ad2013','Music'),
		('Ge104','Pr104','Ad2014','Film'),
		('Ge105','Pr106','Ad2015','Foreign'),
		('Ge106','Pr105','Ad2016','Food');
        
select * from Genre;

insert into Holding_Language(Language_ID,Language) values
		('Ln01','Sinhala'),
		('Ln02','English'),
		('Ln03','Tamil'),
		('Ln04','Hindi'),
		('Ln05','Theligu'),
		('Ln06','French');

select * from Holding_Language;

insert into Program(Program_ID,Empl_ID,Title,Duration,Station_ID) values
		('Pr101','Em1101','CopyChat','02:00:00','st1001'),
		('Pr102','Em1102','BandJ','02:00:00','st1004'),
		('Pr103','Em1103','ChartShow','02:00:00','st1006'),
		('Pr104','Em1104','Music20','01:30:00','st1005'),
		('Pr105','Em1105','Swarna','01:00:00','st1002'),
		('Pr106','Em1106','Hello','01:00:00','st1003');

select * from Program;

insert into Manager(Manager_ID,Station_ID,Manager_Name,Position) values
		('Em1108','st1003','Mahesh','Manager'),
		('Em1109','st1003','Nimal','Assistant_Manager'),
		('Em1110','st1001','Kamal','Manager'),
		('Em1111','st1002','Asantha','Manager'),
		('Em1112','st1001','Thilina','Assistant_Manager'),
		('Em1113','st1002','Chamara','Assistant_Manager');

select * from Manager;

insert into Manager_ContactInfo(Manager_ID,Contact_No) values
		('Em1108','0712336724'),
		('Em1109','0712336714'),
		('Em1113','0712336734'),
		('Em1110','0712336744'),
		('Em1111','0712336754'),
		('Em1112','0712336764'),
		('Em1113','0719336764');

select * from  Manager_ContactInfo;

insert into DiskJockey(Empl_ID,Station_ID,DJ_Name) values
		('Em1201','st1001','Asha'),
		('Em1202','st1001','Sonam'),
		('Em1203','st1001','Kasun'),
		('Em1204','st1002','Dasun'),
		('Em1205','st1002','Sahiru'),
		('Em1206','st1003','Teenu'),
		('Em1207','st1004','Sara'),
		('Em1208','st1005','Meli');

select * from  DiskJockey;


insert into Playlist(Genres,Time,Date,Ranking,Total_Duration) values
		('sinhala_songs','00:08:00','2023-05-04','3','02:00:00'),
		('Hipop_songs','00:10:00','2023-05-04','4','02:00:00'),
		('English_songs','00:18:00','2023-05-04','2','02:00:00'),
		('Hindi_songs','00:20:00','2023-05-04','5','02:00:00'),
		('Tamil_songs','00:22:00','2023-05-04','1','01:00:00'),
		('Malayalam_songs','00:06:00','2023-05-04','6','01:00:00'),
		('Tamil_songs','00:10:00','2023-08-09','2','02:00:00');



insert into Song(Song_Name,Artist,Ranking) values
		('walakul viyan thanala','Umariya','2'),
		('Nissara sansara','Abhisheka','1'),
		('Sebalaneni','Ranindu','3'),
		('Sorry','Justine bieber.','1'),
		('Blank space','Taylor Swift','2'),
		('Naina','Neha kakar','1');

select * from  Song;

insert into User_FavouriteGenres(User_ID,Favourite_Genres) values
		('Us1101','sinhala_songs'),
		('Us1102','Hipop_Songs'),
		('Us1103','English_songs'),
		('Us1104','Hindi_songs'),
		('Us1105','Tamil_songs'),
		('Us1106','Malayalam_songs');

select * from  User_FavouriteGenres;

insert into User_contactInfo(User_ID,Contact_NO) values
		('Us1101','0717345671'),
		('Us1101','0717345672'),
		('Us1102','0717345673'),
		('Us1102','0717345674'),
		('Us1103','0717345675'),
		('Us1104','0717345676');

select * from  User;

insert into Schedule(Scheduled_ID,Time,Date,Program_Name,Program_ID) values
		('sh1001','08:00:00','2023-05-04','CopyChat','Pr101'),
		('sh1002','08:00:00','2023-05-09','BandJ','Pr102'),
		('sh1003','07:00:00','2023-08-04','ChartShow','Pr103'),
		('sh1004','08:01:00','2023-08-10','Music20','Pr104'),
		('sh1005','09:01:00','2023-09-14','Swarna','Pr105'),
		('sh1006','10:01:00','2023-12-04','Hello','Pr106');

select * from  Schedule;

insert into Advertisement(Ad_ID,Product,Station_ID) values
		('Ad2011','Shoes','st1001'),
		('Ad2012','Clothes','st1001'),
		('Ad2013','Instruments','st1002'),
		('Ad2014','Pravegaya','st1003'),
		('Ad2015','BeautyCream','st1002'),
		('Ad2016','Noodles','st1001'),
		('Ad2020','Chocolate ','st1002');     
select * from  Advertisement;


insert into User(User_ID, Station_ID, Program_ID,User_Name,Province, District, Street) values
		('Us1101','st1001','Pr101','Prema', 'Western', 'Colombo','Araliya'),
		('Us1102','st1001','Pr101','Namal', 'Southern', 'Galle','Kumarathunga_MW'),
		('Us1103','st1001','Pr101','Kamal', 'Southern', 'Matara','Kumaradasa_MW'),
		('Us1104','st1001','Pr102','Jeewa', 'Sabaragamuwa', 'Rathnapura','Araliya'),
		('Us1105','st1002','Pr103','Hirun', 'Central', 'Kandy','Samanala_street'),
		('Us1106','st1001','Pr102','Gayan', 'North', 'Jafna','Saheena_street'),
		('Us1107','st1002','Pr101','Kumar', 'Southern', 'Hambanthota','Samagi');  
        
select * from  User;


insert into RadioStation(Station_ID,Station_Name,Province, District, Street,Frequency) values
		('st1001','SHRII', 'Western', 'Colombo','DS_Senanayaka_Rd','100Fm'),
		('st1002','SHAA', 'Western', 'Colombo','Araliya_uyana','102.1Fm'),
		('st1003','SUN', 'Western', 'Colombo','Sarasavi Asapuwa','101.1Fm'),
		('st1004','Hiru', 'Western', 'Colombo','Saman_pedesa','99.7Fm'),
		('st1005','SHAKTHI', 'Western', 'Colombo','Vidyaloka_mw','107.2Fm'),
		('st1006','SHRII', 'Western', 'Colombo','Gimhana_mw','98.7Fm'),
		('st1008','RIDAM', 'Western', 'Colombo','MainStreet','107Fm');
        
select * from  RadioStation;

-- **************************** Add foreign Key constraints.***************************************

Alter table employee
Add constraint Fk01_Emp 
Foreign key (Manager_ID) references Manager(Manager_ID) on delete set null,
Add constraint Fk2_Emp 
Foreign key (Station_ID) references RadioStation(Station_ID) on delete cascade;
Alter table employee
Add constraint Fk3_Emp 
Foreign key (Genre_ID) references Genre(Genre_ID) on delete set null;


Alter table Employee_ContactInfo
Add constraint Fk4_Emp 
Foreign key (Empl_ID) references Employee(Empl_ID);

Alter table Schedule
Add constraint Fk14_Emp 
Foreign key (Program_ID) references Program(Program_ID) on delete cascade;

Alter table Genre
Add constraint Fk8_Emp 
Foreign key (Ad_ID) references Advertisement(Ad_ID) ON DELETE CASCADE,
Add constraint Fk9_Emp 
Foreign key (Program_ID) references Program(Program_ID) on delete cascade;

Alter table User_contactInfo
Add constraint Fk13_Emp 
Foreign key (User_ID) references User(User_ID);

Alter table User
Add constraint Fk10_Emp 
Foreign key (Program_ID) references Program(Program_ID) on delete cascade,
Add constraint Fk11_Emp 
Foreign key (Station_ID) references RadioStation(Station_ID) on delete cascade;

Alter table User_FavouriteGenres
Add constraint Fk12_Emp 
Foreign key (User_ID) references User(User_ID) on delete cascade;

Alter table Playlist
Add constraint Fk20_Emp 
Foreign key (Genres) references User_FavouriteGenres(Favourite_Genres) on delete cascade on update cascade ;


Alter table Song
Add constraint Fk21_Emp 
Foreign key (Ranking) references Playlist(Ranking);

Alter table Manager
Add constraint Fk17_Emp 
Foreign key (Station_ID) references RadioStation(Station_ID)on delete cascade;

Alter table Manager_ContactInfo
Add constraint Fk18_Emp 
Foreign key (Manager_ID) references Manager(Manager_ID) on delete cascade on update no action;

Alter table Program
Add constraint Fk15_Emp 
Foreign key (Station_ID) references RadioStation(Station_ID) on delete cascade,
Add constraint Fk16_Emp 
Foreign key (Empl_ID) references Employee(Empl_ID) on delete cascade;

Alter table DiskJockey
Add constraint Fk19_Emp 
Foreign key (Station_ID) references RadioStation(Station_ID) on delete cascade;

Alter table Advertisement
Add constraint Fk7_Emp 
Foreign key (Station_ID) references RadioStation(Station_ID);

Alter table Ad_Slot
Add constraint Fk5_Emp 
Foreign key (Ad_ID) references Advertisement(Ad_ID),
Add constraint Fk6_Emp 
Foreign key (Scheduled_ID) references Schedule(Scheduled_ID) on delete cascade;


-- **************Update and delete the 2 rows and Delete a rowm for each table in RadioStation tables.**************

-- for ad_slot

UPDATE ad_slot
SET Scheduled_ID = 'sh1006'  WHERE Ad_Id = 'Ad2014';
UPDATE ad_slot
SET Date = '2023-06-22'  WHERE Ad_Id = 'Ad2015';

DELETE FROM ad_slot WHERE Scheduled_ID = 'sh1005';

select * from Ad_Slot;

-- for advertisement
UPDATE advertisement
SET Station_Id = 'st1004'  WHERE Ad_Id = 'Ad2013';
UPDATE advertisement
SET Product = 'jewellery'  WHERE Ad_Id = 'Ad2014';
 
Delete from advertisement where Ad_ID = 'Ad2020';

-- for diskjockey

UPDATE diskjockey
SET Station_Id = 'st1005'  WHERE empl_id = 'em1203';
UPDATE diskjockey
SET dj_name = 'sathu'  WHERE empl_id = 'em1206';

DELETE FROM diskjockey WHERE Empl_ID = 'em1203';

-- for Employee
UPDATE Employee
SET Age = 28, Position = 'Senior Presenter'  WHERE Empl_ID = 'Em1102';
UPDATE Employee
SET DateOfBirth = '1995-08-20', Empl_Name = 'Dilani' WHERE Empl_ID = 'Em1106';

DELETE FROM Employee WHERE Empl_ID = 'Em1107';

-- for employee_contactinfo
UPDATE employee_contactinfo
SET empl_id = 'Em1106' WHERE contact_no = '0912336725';
UPDATE employee_contactinfo
SET contact_no = '0912336555' WHERE empl_id = 'Em1104';

DELETE FROM employee_contactinfo WHERE Contact_No = '0712336721';

-- for genre
UPDATE genre
SET program_id = 'Pr106' WHERE ad_id = 'Ad2013';
UPDATE genre
SET  genre_name='Music', program_id='pr102' WHERE genre_id = 'Ge106';

DELETE FROM genre WHERE program_id = 'pr104';

-- for holding_language

UPDATE holding_language
SET language = 'Malayalam' WHERE Language_ID = 'Ln01';
UPDATE holding_language
SET language = 'sinhala' WHERE Language_ID = 'Ln05';

DELETE FROM holding_language WHERE Language_ID = 'Ln04';

-- for manager
UPDATE manager
SET Manager_Name = 'chathura' WHERE Manager_ID = 'Em1110';
UPDATE manager
SET Position = 'manager', Station_ID='st1004' WHERE Manager_ID = 'Em1113';

DELETE FROM manager WHERE Manager_ID = 'Em1111';

-- for manager_contactinfo

UPDATE manager_contactinfo
SET Contact_No = '755284975' WHERE Manager_ID = 'Em1110';
UPDATE manager_contactinfo
SET Contact_No = '712336541'  WHERE Manager_ID = 'Em1114'  ;

DELETE FROM manager_contactinfo WHERE Manager_ID = 'Em1111';

-- for playlist

UPDATE playlist 
SET date = '2023-08-12' WHERE Genres = 'folk song';
UPDATE playlist
SET Time = '00:15:00'  WHERE Genres = 'Hipop_songs'  ;

Delete from Playlist where Genres='Hipop_Songs';



-- for program

UPDATE program
SET Duration = '02:30:00' WHERE Program_ID = 'Pr102';
UPDATE program
SET title = 'Hotchat'  WHERE Empl_ID = 'Em1105';

DELETE FROM program WHERE title = 'swarana';




-- for radiostation
UPDATE radiostation

SET District = 'Galle', province='Southern', Street='A5 mainstrrt' WHERE Station_ID = 'st1006';
UPDATE radiostation
SET Station_Name='sooriyan'  WHERE Station_ID = 'st1001';

Delete from radiostation where station_ID='st1008';


-- for schedule
UPDATE schedule
SET date='2023-01-10', time='11:00:00' WHERE Scheduled_ID = 'sh1006';
UPDATE schedule
SET Program_Name='music express'  WHERE Program_ID = 'Pr102';

DELETE FROM schedule WHERE Scheduled_ID='sh1004'; 


-- for song

UPDATE song
SET artist ='veerasehara' WHERE Song_Name = 'naina';
UPDATE song
SET Song_Name='hiththane'  WHERE Artist = 'Umariya';

DELETE FROM song WHERE Song_Name='Sorry'; 



-- for user

UPDATE user
SET User_Name ='veerasehara' WHERE User_ID = 'Us1104';
UPDATE user
SET District = 'Galle', province='Southern', Street='A6 mainstreet', Station_ID='st1003'  WHERE User_Name = 'Namal';
   
Delete from User where user_ID ='Us1107';


-- for user_contactinfo
UPDATE user_contactinfo
SET Contact_NO ='755284974' WHERE User_ID = 'Us1103';
UPDATE user_contactinfo
SET User_ID = 'Us1105' WHERE Contact_NO ='0717345672';

DELETE FROM user_contactinfo WHERE Contact_NO='0717345673'; 



-- for user_favouritegenres

  
UPDATE user_favouritegenres 
SET Favourite_Genres ='folk song' WHERE User_ID = 'Us1103';
UPDATE user_favouritegenres
SET User_ID = 'Us1104' WHERE Favourite_Genres ='Hindi_songs';
 
DELETE FROM user_favouritegenres WHERE Favourite_Genres='Hindi_songs'; 




-- ********************************7 Simple queries **************************************************************

-- (1) Select all data from the Employee table

SELECT * FROM Employee;




-- (2)Project only the Empl_Name and Position columns from the Employee table:

SELECT Manager_Name, Position FROM Manager;




-- (4)Perform a Cartesian product between the Employee and RadioStation tables:

SELECT * FROM Employee, RadioStation;



-- (5) Create a view named EmployeeView that selects all employees from a specific station:

CREATE VIEW EmployeeView1 AS 
SELECT * FROM Employee WHERE Station_ID = 'st1001';


-- (3) Rename the Empl_Name column to EmployeeName in the Employee table:

SELECT Ad_ID AS Advertisement_ID FROM Advertisement;


-- (6) Calculate the average age of employees:

SELECT AVG(Age) AS AverageAge FROM Employee;


-- (7) Retrieve the Ranking,Song_Name,Artist which acsending order with Rank.

Select Ranking,Song_Name,Artist from Song  order by Ranking asc;




-- ******************************************13 complex queries*****************************************************

-- Union Operation

SELECT* from Song where Song_Name='Sebalaneni' 
UNION
SELECT * from Song where Artist='Umaria';

-- Union Operation tunning
show index from Song;

Explain
SELECT* from Song where Song_Name='Sebalaneni' 
UNION
SELECT * from Song where Artist='Umaria';
CREATE INDEX Artist_Index ON Song(Artist);

-- Intersect Operation
SELECT * FROM Employee AS E
WHERE EXISTS (SELECT 1 FROM Employee AS E1
    WHERE E1.Empl_ID = E.Empl_ID
    AND E1.Station_ID = 'st1001'
)
INTERSECT
SELECT * FROM Employee AS E
WHERE EXISTS (
    SELECT 1 FROM Employee AS E2
    WHERE E2.Empl_ID = E.Empl_ID
    AND E2.Station_ID = 'st1001'
);


-- Intersect Operation tunning
show index from Song;
CREATE INDEX Empl_ID_Index ON Employee(Empl_ID);
Explain
SELECT * FROM Employee AS E
WHERE EXISTS (SELECT 1 FROM Employee AS E1
    WHERE E1.Empl_ID = E.Empl_ID
    AND E1.Station_ID = 'st1001'
)
INTERSECT
SELECT * FROM Employee AS E
WHERE EXISTS (
    SELECT 1 FROM Employee AS E2
    WHERE E2.Empl_ID = E.Empl_ID
    AND E2.Station_ID = 'st1001'
);

-- Set Difference Operation: Find employees who are not managers.

SELECT Empl_Name AS Name FROM Employee
EXCEPT
SELECT Manager_Name AS Name FROM Manager;


-- Tunning of Set Difference Operation
 
show index from Employee;

CREATE INDEX idx_Employee_Empl_Name ON Employee(Empl_Name);
Explain
SELECT Empl_Name AS Name FROM Employee
EXCEPT
SELECT Manager_Name AS Name FROM Manager;

-- Division Operation: Find employees who are assigned to all stations.

SELECT Empl_Name AS Name FROM Employee
WHERE NOT EXISTS (
    SELECT Station_ID FROM RadioStation
    WHERE NOT EXISTS (
        SELECT * FROM Employee
        WHERE Employee.Station_ID = RadioStation.Station_ID
    )
);

-- Inner Join :Retrieve a list of employees and their associated station names using an inner join:

SELECT E.Empl_Name, R.Station_Name FROM Employee AS E
INNER JOIN RadioStation AS R ON E.Station_ID = R.Station_ID;



-- Tune the Inner Join Operation.
SHOW index from RadioStation;
SHOW index from Employee;

CREATE INDEX idx_R_station ON RadioStation(Station_ID);

explain( select Empl_Name, R.Station_Name FROM Employee AS E
INNER JOIN RadioStation AS R ON E.Station_ID = R.Station_ID);





-- Left Outer Join: Retrieve a list of employees who are also managers using a left outer join:

SELECT E.Empl_Name, M.Manager_Name
FROM Employee AS E
LEFT OUTER JOIN Manager AS M ON E.Empl_ID = M.Manager_ID;

-- Tune the Left Outer Join operation
show index from Manager;

CREATE INDEX idx_Manager_Manager_ID ON Manager(Manager_ID);
Explain
SELECT E.Empl_Name, M.Manager_Name
FROM Employee AS E
LEFT OUTER JOIN Manager AS M ON E.Empl_ID = M.Manager_ID
WHERE M.Manager_Name IS NOT NULL;



-- Right Outer Join Operation.

SELECT E.Empl_Name, R.Station_Name
FROM Employee AS E
RIGHT OUTER JOIN RadioStation AS R ON E.Station_ID = R.Station_ID;






SELECT P.Genres, P.Time, P.Date, P.Ranking, P.Total_Duration, S.Song_Name
FROM Playlist AS P
LEFT JOIN Song AS S ON P.Ranking = S.Ranking;
 
 
 
 
 

 -- Tunning of Right outer join
Show index from Employee;
Show index from RadioStation;

Explain
SELECT E.Empl_Name, R.Station_Name
FROM Employee AS E
RIGHT OUTER JOIN RadioStation AS R ON E.Station_ID = R.Station_ID;



-- Natural Join: Retrieve employees and their associated stations using a natural join 

SELECT Empl_Name, Station_Name
FROM Employee
NATURAL JOIN RadioStation;


-- Tune the natural Outer join 
show index from Employee;
show index from RadioStation;

CREATE INDEX idx_Employee_Station_ID ON Employee(Station_ID);


Explain
SELECT Empl_Name, Station_Name
FROM Employee
NATURAL JOIN RadioStation;

-- Full Outer Join: Retrieve all employees and stations, including those without matches.

SELECT E.Empl_Name, R.Station_Name
FROM Employee AS E
LEFT OUTER JOIN RadioStation AS R ON E.Station_ID = R.Station_ID
UNION ALL
SELECT E.Empl_Name, R.Station_Name
FROM Employee AS E
RIGHT OUTER JOIN RadioStation AS R ON E.Station_ID = R.Station_ID;

-- Tune the Full outer join

show index from Employee;
show index from RadioStation;


Explain
SELECT E.Empl_Name, R.Station_Name
FROM Employee AS E
LEFT OUTER JOIN RadioStation AS R ON E.Station_ID = R.Station_ID
UNION
SELECT E.Empl_Name, R.Station_Name
FROM Employee AS E
RIGHT OUTER JOIN RadioStation AS R ON E.Station_ID = R.Station_ID;

-- Outer Union: Combine employees and stations, preserving duplicates.
show index from Employee;
show index from RadioStation;

CREATE INDEX idx_Empl_Name ON Employee(Empl_Name);
CREATE INDEX idx_Station_Name ON RadioStation(Station_Name);

Explain
SELECT Empl_Name AS Name FROM Employee
UNION ALL
SELECT Station_Name AS Name FROM RadioStation;


-- Nested Query (Subquery): Find employees who manage a station in the Western province.
SELECT Empl_Name
FROM Employee
WHERE Empl_ID IN (
    SELECT Manager_ID
    FROM Manager
    WHERE Station_ID IN (
        SELECT Station_ID
        FROM RadioStation
        WHERE Province = 'Western'
    )
);

-- Nested Query (Correlated Subquery): Find employees who manage stations in the same province.

SELECT Empl_Name
FROM Employee AS E
WHERE EXISTS (
    SELECT 1
    FROM Manager AS M
    WHERE M.Manager_ID = E.Empl_ID
    AND M.Station_ID IN (
        SELECT Station_ID
        FROM RadioStation
        WHERE Province = (
            SELECT Province
            FROM RadioStation
            WHERE Station_ID = M.Station_ID
        )
    )
);

--  find the average age of employees in each station and then use the results in an outer query 
SELECT Station_Name
FROM RadioStation
WHERE Station_ID IN (
    SELECT E.Station_ID
    FROM Employee AS E
    GROUP BY E.Station_ID
    HAVING AVG(E.Age) > (
        SELECT AVG(Age) FROM Employee
    )
);

