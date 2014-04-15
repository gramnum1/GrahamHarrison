--Graham Harrison
--Lab 9
--4/14/14


--create DB

CREATE DATABASE Nasa;
  

--People Table

Create Table People(PID integer not null primary key,
                      FName text,
                      LName text,
                      DOB date);
--Engineer Table

Create Table Engineer(PID integer not null primary key references People(PID),
                       HighDeg text,
                       VideoGame text);
                       
 --Astronaut Table

 Create table Astronaut(PID integer not null primary key references People(PID),
                        FirstFlightDate date,
                        GolfHandi integer);

 --FCO Table

Create table FCO(PID integer not null primary key references People(PID),
                 Chair integer,
                 Drink text);
--SpaceCraft Table
Create table SpaceCraft(SCID integer not null primary key,
                        Name text,
                        TailNum integer,
                        WeightTon float(53),
                        FuelType text,
                        CrewCap integer);
--Crew Table
Create table Crew(SCID integer not null references SpaceCraft(SCID),
                  PID integer not null  references Astronaut(PID),
                  primary key(SCID, PID));
--System Table
Create Table System(SysID integer not null primary key,
                    Name text,
                    Descr text);
--Part table
Create table Part(PartID integer not null primary key,
                  Name text,
                  Descr text);
--SysPart Table
Create table SysPart(SysID integer not null  references System(SysID),
                     PartID integer not null  references Part(PartID),
                     primary key(SysID, PartID));
--Supplier table
Create table Supplier(SupID integer not null primary key,
                       Name text,
                       Addr text,
                       PayTerms text);
--Catalog Table
Create table Catalog(SupID integer not null  references Supplier(SupID),
                     PartID integer not null  references Part(PartID),
                     primary key(SupID, PartID));
--CraftSyst Table 
Create table CraftSyst(SCID integer not null references SpaceCraft(SCID),
                       SysID integer not null  references System(SysID),
                       primary key (SCID, SysID));


--Insert Statements
Insert into People(PID, FName, LName) 
Values(1,'Graham','Harrison'),
      (2, 'John', 'Hall'),
      (3, 'Max','Flash'),
      (4, 'Jim', 'Bob'),
      (5, 'Jake', 'Smith'),
      (6, 'Pam', 'Joe');

Insert into Engineer(PID, HighDeg, VideoGame)
Values(1,'PHD','WOW'),
      (2,'BS', 'Starcraft');


Insert Into Astronaut(PID)
Values(3),
      (4),
      (5);

Insert Into FCO(PID,Chair, Drink)
Values(6, 1, 'Milk');

Insert Into Spacecraft(SCID, Name, TailNum)
Values(1, 'Enterprise', 7);

Insert Into Crew(SCID, PID)
Values(1,3),
      (1,4),
      (1,5);

Insert Into System(SysID, Name, Descr)
Values(1,'First System', 'The First System'),
      (2, 'second system', 'the second system');

Insert into Part(PartID)
Values(1),
      (2),
      (3),
      (4),
      (5),
      (6);

Insert Into Supplier(SupID, Name)
Values(1, 'FirstSup'),
      (2, 'SecondSup');

Insert Into Catalog(SupID, PartID)
Values(1,1),
      (1,2),
      (1,3),
      (2,4),
      (2,5),
      (2,6);


Insert Into CraftSyst(SCID, SysID)
Values(1,1),
      (1,2);   

Insert into SysPart(SysID, PartID)
Values(1,1),
      (1,2),
      (1,3),
      (2,4),
      (2,5),
      (2,6);
	  
	    
Drop DATABASE IF EXISTS Nasa;
                      