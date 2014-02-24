﻿--Graham Harrison
--Lab 5
-- Brainstormed generic ideas with Megan Crane

--Q1
Select agents.city
from agents,
     orders,
     customers
     
where agents.aid=orders.aid
      and orders.cid=customers.cid
      and customers.name='Basics';

-- Q2
--had a lot of trouble with this

Select distinct orders.pid
from orders,
     agents,
     customers
where orders.aid=agents.aid
  and customers.cid=orders.cid
  and customers.city = ('Kyoto')
  
-- Q3
Select name
from customers 
where cid not in(
			select cid
			from orders)

--Q4
select name
from customers c
FULL OUTER JOIN orders o
ON c.cid=o.cid
where o.cid is null
     


--Q5

Select distinct customers.name, agents.name
from customers,
     orders, 
     agents
where customers.cid=orders.cid
  and agents.aid=orders.aid
  and agents.city=customers.city


 -- Q6

 select customers.name, agents.name, customers.city
 from customers,
      agents
 where customers.city=agents.city

-- Q7  
--couldn't figure out how to not display duluth
Select customers.name, customers.city
from customers,
     products
where customers.city=products.city
  and products.quantity = (
				select min(quantity)
				from products
				where customers.city=products.city
				
				
				)
                            
 



