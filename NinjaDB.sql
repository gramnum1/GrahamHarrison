--Graham Harrison 
--4/24/14
--Database Project





--Create database if not exists NinjaDB



--Table  Creations
Create Table People (PID integer not null primary key,
                     FName text,
                     LName text,
                     DOB date);

Create Table Ninja(PID integer not null primary key references People(PID),
                   NAGD date,
                   Strength integer not null check(Strength>=0 or Strength<=10),
                   Speed integer not null  check(Speed>=0 or Speed<=10),
                   Intel integer not null check(Intel>=0 or Intel<=10),
                   Stealth integer not null check(Stealth>=0 or Strength<=10));

Create Table Client(PID integer not null primary key references People(PID),
                    Address varchar(40),
                    PayPlan varchar(9) check(PayPlan='Standard' or PayPlan='Premium'),
                    Descr text);


Create Table Target(PID integer not null primary key references People(PID),
                    Address text,
                    TargetLevel text check(TargetLevel='Low' or TargetLevel='Medium'
                                           or TargetLevel='High'),
                    HairCol varchar(15),
                    EyeCol varchar(15),
                    Ethnicity varchar(15),
                    WeightLBS float(53),
                    HeightFt float (53),
                    Gender char check(Gender='M' or Gender='F'),
                    Descr text, 
                    BountyUSD decimal(19,2));

Create Table Tools(ToolName varchar(25) not null primary key,
                   PriceUSD decimal(19,2),
                   Descr text);

Create Table Team(TeamName varchar(25) not null primary key,
                  Dateformed date,
                  MSR decimal(5,2) check(MSR>=0 or MSR<=1),
                  Descr text);

Create Table NinjaKit(PID integer not null references Ninja(PID),
                      ToolName varchar(25) not null references Tools(ToolName),
                      Qty integer check(Qty>=0),
                      Primary Key(PID, ToolName));

Create Table TeamRoster(TeamName varchar(25) not null references Team(TeamName),
                        PID integer not null references Ninja(PID),
                        primary key (TeamName,PID));

Create Table Mission(ClientID integer not null references Client(PID),
                     TargetID integer not null references Target(PID),
                     DateIssued date not null,
                     MName varchar(25),
                     DateEnd date,
                     TeamName varchar(25) references Team(TeamName),
                     primary key (ClientID, TargetID, DateIssued));

--Inserts
Insert into People(PID, FName, LName, DOB)
Values (1, 'Graham', 'Harrison', '1994-04-13'),
       (2, 'Jon', 'Harrison', '1993-02-24'),
       (3, 'Bill', 'Guy', '1990-12-25'),
       (4,'Gus', 'Golly', '1991-09-12'),
       (5,'Carl', 'Green','1991-10-11'),
       (6, 'Ben', 'Blue', '1991-11-12'),
       (7,'Scott','Tan', '1992-01-02'),
       (8, 'Stacy', 'Yellow', '1992-03-03'),
       (9,'Henry', 'Hall', '1993-05-05'),
       (10,'Phillip', 'Cane', '1993-05-06'),
       (11, 'Greg', 'Ghastly', '1989-02-14'),
       (12, 'Megan', 'Ken', '1995-12-12'),
       (13, 'Billy', 'Bob', '1995-09-13'),
       (14, 'Frank', 'Hall', '1995-07-07'),
       (15, 'Lucy', 'Lu', '1996-05-02');

Insert into Ninja(PID, NAGD, Strength, Speed, Intel, Stealth)
Values(1,'2012-05-25',4,7,10,8),
      (2,'2011-02-02',10,5,4,5),
      (3,'2011-02-02',5,5,5,5),
      (4,'2012-05-25',3,5,4,8),
      (5,'2009-10-10',7,6,4,8),
      (6,'2009-10-10',4,9,5,6),
      (7,'2009-10-10',4,8,0,2),
      (8,'2010-03-11',5,8,2,5),
      (9,'2010-03-11',10,10,10,10);

Insert into Client(PID, Address, PayPlan, Descr)
Values (10, '139 Ellis Rd Havertown PA 19083', 'Standard', 'Phillip likes long walks on the beach'),
       (11, '3399 North Rd Poughkeepsie NY 12601','Standard', 'Greg likes Fishing'),
       (12, '222 Dark Ln SomeTown CA 19583', 'Premium', 'Megan like to bowl');

Insert into Target(PID, Address, TargetLevel, HairCol, EyeCol, Ethnicity,
                   WeightLbs, HeightFt, Gender, Descr, BountyUSD)
Values (13, '345 Astreet Acity WA 19283', 'Low', 'Grey', 'Green', 
        'White', 140.5, 5.5, 'M', 'Billy works at a casino', 500),

        (14, '3658 Fox Blv Hopeville PA 19039', 'Medium', 'Red', 'Blue', 
        'Asian', 120, 5, 'M', 'Frank runs a store', 1000),

        (15, '77 West Rd Easton TX 93929','High', 'Black', 'Brown', 
        'White', 120.5, 5, 'F', 'Lucy has a nail salon', 5000);

Insert Into Tools(ToolName, PriceUSD, Descr)
Values('Ninja Star', 1.50, 'Throwable Sharp Projectile Medium Range'),
      ('Sword', 300, 'Long Ninja Blade'),
      ('Knife',250,'Short Ninja Blade'),
      ('Nunchuck', 50.99, 'Two pieces of wood connected by a chain'),
      ('Smoke Bomb', 3.00, 'Creates a cloud of smoke'),
      ('Flash Bomb', 3.00, 'Creates blinding flash of light'),
      ('Bow', 220.99, 'Device that shoots arrows long distances'),
      ('Arrow', 4, 'Sharp Projectile'),
      ('Poison',100, 'Deadly Ninja Poison');

Insert into NinjaKit(PID, ToolName, Qty)
Values (1, 'Ninja Star', 20),
       (1, 'Sword', 1),
       (2,'Knife', 1),
       (2, 'Bow', 1),
       (2, 'Arrow', 20),
       (2, 'Smoke Bomb', 5),
       (3, 'Nunchuck',1),
       (3, 'Poison', 2),
       (4, 'Sword', 2),
       (4, 'Flash Bomb', 4),
       (5, 'Knife',1),
       (5,'Ninja Star', 15),
       (6, 'Bow', 1),
       (6, 'Arrow', 50),
       (7, 'Sword', 1),
       (8, 'Nunchuck', 1),
       (9, 'Sword', 1),
       (9, 'Nunchuck', 1),
       (9, 'Ninja Star', 10);

Insert Into Team(TeamName, DateFormed, MSR, Descr)
Values ('Team One', '2013-11-11', .89, 'This is Team One'),
       ('Team Two', '2012-12-29', .50, 'This is Team Two'),
       ('Team Three', '2013-09-09', .85, 'This is team three'),
       ('Super Team', '2014-04-24', 1.00, 'The Super Team');


Insert into TeamRoster(TeamName, PID)
Values ('Team One',1),
       ('Team One', 2),
       ('Team One',3),
       ('Team Two', 4),
       ('Team Two',5),
       ('Team Two',6),
       ('Team Three', 7),
       ('Team Three', 8),
       ('Team Three', 9),
       ('Super Team', 9),
       ('Super Team', 1),
       ('Super Team', 2);

Insert into Mission(ClientId, TargetID, DateIssued, MName, DateEnd, TeamName)
Values (10, 13, '2013-05-05', 'Operation Blue Daisy', '2013-05-10', 'Team One'),
       (11,14,'2013-06-06','Operation Ivy', '2013-06-07', 'Team Two'),
       (12,15,'2013-07-07', 'Operation Endgame', '2013-07-07', 'Team Three');

Insert into Mission(ClientID, TargetID, DateIssued, MName, TeamName)
Values (12,15,'2014-04-24', 'Operation Endgame part 2', 'Super Team'); 





  

--Views
Create View NinjaDetails as
  Select Concat(FName,' ',LName) as NinjaName, NAGD as NinjaAcademyGraduationDate, 
         Strength, 
         Speed, 
         Intel as Intelligence, 
         Stealth,
         Concat('$',KitCost(ninja.pid)) as KitCost
  from People,
       Ninja
  Where People.PID=Ninja.PID
  order by NinjaName asc; 

Create View ClientDetails as
  Select Concat(FName,' ',LName) as ClientName, Address, PayPlan as PaymentPlan, Descr as Description
  from People,
       Client
  Where People.PID=Client.PID
  order by ClientName asc;

Create View TargetDetails as
  Select Concat(FName,' ',LName) as TargetName, 
         Address, 
         TargetLevel, 
         HairCol as HairColor,
         EyeCol as EyeColor,
         Ethnicity,
         WeightLbs,
         HeightFt,
         Gender,
         Concat('$',BountyUSD) as Bounty
  from People,
       Target
  Where People.PID=Target.PID
  order by TargetName;                                                                          



Create View Equipment as
  Select Concat(FName,' ',LName) as NinjaName,
         ToolName,
         Qty
  from People,
       NinjaKit
  where People.pid=NinjaKit.PID
  order by NinjaName asc;

Create View TeamMembers as
    Select TeamName,
           Concat(FName,' ',LName) as NinjaName
    from People,
         TeamRoster
    where People.PID=TeamRoster.PID
    order by Teamname asc;

Create View MissionDetails as
  Select Concat(c.FName,' ',c.LName) as ClientName,
         Concat(t.FName,' ',t.LName) as TargetName,
         DateIssued,
         MName as MissionName,
         DateEnd,
         TeamName
  from People c,
       People t,
       Mission
  Where c.PID=Mission.ClientID
    and t.PID=Mission.TargetID
  order by DateIssued asc;
    
           
--Records
--Ranged Ninja
Select FName, LName, ToolName
from People,
     Ninja,
     NinjaKit
Where People.PID=Ninja.PID
  and Ninja.PID=NinjaKit.PID  
  and (NinjaKit.ToolName='Bow'
       or NinjaKit.ToolName='Ninja Star')
order by ToolName asc;

--Ranked Ninja
Select FName, LName, (Strength+Speed+Intel+Stealth)/4 as AverageScore
from People,
     Ninja
Where People.PID=Ninja.PID
order by AverageScore desc; 
  
--completed missions
Select MName, 
       FName as TargetFName,
       LName as TargetLName,
       TeamName,  
       DateIssued,
       DateEnd
from Mission,
      People
where People.PID=Mission.TargetID
  and DateEnd is not null;

--Ninjas in the field
Select FName, LName, MName,Mission.TeamName, DateIssued
from People,
     Ninja, 
     TeamRoster,
     Mission
Where People.PID=Ninja.PID
  and TeamRoster.PID=Ninja.PID
  and TeamRoster.TeamName=Mission.TeamName
  and Mission.DateEnd is Null
  order by DateIssued Desc;

--Ninja with most experience
Select distinct FName, LName, NAGD
From People,
     Ninja,
     Target,
     Mission,
     TeamRoster
Where People.PID=Ninja.PID
  and Ninja.PID=TeamRoster.PID
  and TeamRoster.TeamName=Mission.TeamName
  
  and Target.PID=Mission.TargetID
  and Target.TargetLevel='High'   
  order by NAGD asc;  


--Functions
--KitCost function
Create or replace function kitCost(int) returns Decimal(19,2) as
$$
declare
   NinjaID int :=$1;
   Kitcost decimal(19,2);
begin
   KitCost=Sum(Tools.PriceUSD*NinjaKit.Qty)
   from Tools,
        NinjaKit,
        People,
        Ninja
   where people.pid=NinjaID
     and people.pid=ninja.pid
     and ninja.pid=NinjaKit.pid
     and tools.toolname=ninjakit.toolname;
	
   return kitcost;
end;
$$
language plpgsql;       
          
     


--NinjaTeamMates function
Create or replace function NinjaTeamMates(int) returns table(NName text, TName varchar(25)) as
$$
declare
   NinjaID int :=$1;
begin
   return query
      Select distinct concat(p.FName,' ',p.LName) as NName,
             t2.TeamName
      from people,
           people p,
           TeamRoster t1,
           TeamRoster t2,
           Team
       where T1.Teamname=Team.teamname
         and t2.teamname=team.teamname
         and t2.teamname=team.teamname
         and t1.teamname=t2.teamname
         and t2.pid!=NinjaID
         and t1.pid=NinjaID
         and p.pid=t2.pid
       order by t2.TeamName;
         
end;
$$
language plpgsql; 

         


 --triggers
--PeopleCheck Trigger Function
Create function PeopleCheck() returns trigger as 
$PeopleCheck$
begin
   if exists (select pid
              from people
              where Fname=new.FName
                and LName=new.LName
                and DOB=new.DOB)
   then 
      raise exception 'Person with same info already exists in the database';
   end if;
   return new;
   end;
   $PeopleCheck$
   language plpgsql;


--NinjaCheck Trigger Function
Create Function NinjaCheck() returns trigger as
$NinjaCheck$
begin
   if exists(Select PID
             from Ninja
             Where NAGD=new.NAGD
               and Strength=new.Strength
               and Speed=new.Speed
               and Intel=new.Intel
               and Stealth=new.Stealth)
   Then
      Raise Exception 'Ninja already exists';
   end if;
   return new;
end;
$NinjaCheck$
language plpgsql;

--ClientCheck Trigger Function
Create function ClientCheck() returns trigger as
$ClientCheck$
begin
   if exists(Select PID
             from client
             where Address=new.Address
               and PayPlan=new.PayPlan
               and Descr=new.Descr)
   then
      Raise exception 'Client already exists';
   end if;
   return new;
end;
$ClientCheck$
language plpgsql;

--TargetCheck Trigger Functions
Create Function TargetCheck() returns trigger as
$TargetCheck$
begin
   if exists(Select PID
             from target
             where Address=new.address
               and targetlevel=new.targetlevel
               and haircol=new.haircol
               and eyecol=new.eyecol
               and weightlbs=new.weightlbs
               and heightft=new.heightft
               and gender=new.gender
               and bountyusd=new.bountyusd)
   then 
     raise exception 'target already exists';
   end if;
   return new;
end;
$TargetCheck$
language plpgsql;

   
--MissionCheck Trigger Function
Create Function MissionCheck() returns trigger as
$MissionCheck$
begin
   if exists(Select ClientID, TargetID, DateIssued
             from mission
             where MName=new.MName
               and DateEnd=new.DateEnd
               and TeamName=new.TeamName) 
    then
       Raise exception 'Mission with same information already exists';
    end if;
    return new;
end;
$MissionCheck$
 language plpgsql;

 --Insert people
 Create Trigger PeopleCheck before insert on People
 for each row execute procedure PeopleCheck();

--Insert Ninja
 Create Trigger NinjaCheck before insert on Ninja
 for each row execute procedure NinjaCheck();

--Insert Client
 Create Trigger ClientCheck before insert on Client
 for each row execute procedure ClientCheck();
--Insert Target
 Create trigger TargetCheck before insert on Target
 for each row execute procedure TargetCheck();
--Insert Mission
 Create Trigger MissionCheck before insert on Mission 
 for each row execute procedure MissionCheck();



 --Security
Grant all Privileges on all tables in schema public to Administrator;

Grant Select, insert, update on all tables in schema public to ClanLeader;

Grant select on all tables in schema public to ANinja;



                      
      
     



  
  
              