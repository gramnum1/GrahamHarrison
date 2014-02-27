--Graham Harrison
--Lab 6
-- brainstormed ideas with Megan Crane
--Reference stack overflow for cast function 

--Q1
--i dont understand the question

--Q2
--i dont understand the question

--Q3
Select name, price
from products
where priceUSD>(select AVG(priceUSD)
	   from products)




--Q4
Select customers.name, pid, dollars
from orders,
     customers
where orders.cid=customers.cid
order by dollars desc

--Q5
--show the customer names (in order) 
--and their total ordered, and nothing more
--use coalesce to avoid nulls
Select c.name, coalesce(sum(o.dollars), 0)
from customers c left outer join orders o on c.cid=o.cid
group by c.cid
order by c.name asc 





--Q6
Select c.name, a.name, p.name
from customers c,
     agents a,
     products p,
     orders
where c.cid=orders.cid
  and a.aid=orders.aid
  and p.pid=orders.pid
  and a.city='New York'

--Q7
Select o.dollars, CAST((o.qty*p.priceUSD)-(o.qty*p.priceUSD)*(c.discount/100) as numeric(12,2)) as price_Validation
from orders o,
     products p,
     customers c
where o.pid=p.pid
  and c.cid=o.cid
  
