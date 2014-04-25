
--Graham Harrison
--Lab 10
--4/24/14

--PreReqsFor function
Create or replace function PreReqsFor(int) returns Table(preReqName text) as
$$
Declare
  courseNumber int :=$1;
  
Begin
   return query 
  
     Select p.name
     from Courses c,
          Courses p,
          Prerequisites
     where c.num=Prerequisites.courseNum
       and p.num=Prerequisites.preReqNum
       and c.num=courseNumber;
 
end;
$$
language plpgsql;

--test 
 select PreReqsFor(499);


--IsPreReqFor function
Create or replace function IsPreReqFor(int) returns table(courseName text) as
$$
declare
   courseNumber int :=$1;
   
begin
   return query 
      Select c2.name
      from courses c1,
           courses c2,
           prerequisites p
      where c1.num=p.preReqNum
        and c2.num=p.courseNum
        and c1.num=courseNumber;
    
end;
$$
language plpgsql;
    
--test
select IsPreReqFor(120);


--triggers
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

 Create Trigger NinjaCheck before insert on Ninja
 for each row execute procedure NinjaCheck();

 Create Trigger ClientCheck before insert on Client
 for each row execute procedure ClientCheck();

 Create trigger TargetCheck before insert on Target
 for each row execute procedure TargetCheck();

 Create Trigger MissionCheck before insert on Mission 
 for each row execute procedure MissionCheck();
           
      











     
   
  


