-- SELECT * FROM 
Use sakila;
SELECT * FROM actor;

-- WHERE CLAUSE OPERATOR
SELECT 
    *
FROM
    ACTOR;
SELECT 
    *
FROM
    actor
WHERE
    first_name = 'JENNIFER';

SELECT 
    first_name
FROM
    actor
WHERE
    first_name LIKE 'AN%';

 -- DISTINCT OPERATOR ,removes the duplicate from the query and not from 
 -- the table meaning angela won't be repeated
 
SELECT DISTINCT
    first_name
FROM
    actor
WHERE
    first_name LIKE 'AN%';
SELECT 
    COUNT(DISTINCT first_name)
FROM
    actor
WHERE
    first_name LIKE 'AN%';

SELECT 
    *
FROM
    sakila.actor
WHERE
    first_name = 'nick';

UPDATE sakila.actor 
SET 
    first_name = 'Nicky'
WHERE
    actor_id = 2;

-- BETWEEN OPERATOR QUERY

use sakila;

SELECT 
    title, release_year, rental_duration
FROM
    film
WHERE
    rental_duration BETWEEN 3 AND 6
LIMIT 7;

-- IN --- OPERATOR QUERY which uses seect ,where and  from


SELECT 
    title, release_year, rental_duration
FROM
    film; 
SELECT 
    title, release_year, rental_duration
FROM
    film where rental_duration in (3,5) limit 7;

-- using like operator on the sakila  database
USE sakila;
-- specify any two colunms from actor  sakila
SELECT 
    first_name, last_name
FROM
    actor
WHERE
    first_name LIKE 'd%'; 
SELECT 
    first_name, last_name
FROM
    actor
WHERE
    first_name LIKE '%er%'; 
-- using the order by which means sorting by operator in the sakila database
SELECT 
    *
FROM
    sakila.actor
ORDER BY actor_id;
SELECT 
    *
FROM
    sakila.actor
ORDER BY actor_id ASC;

SELECT 
    *
FROM
    sakila.actor
WHERE
    first_name LIKE 'An%'
ORDER BY first_name , last_name;

-- using a  limit
SELECT 
    title
FROM
    film
LIMIT 7  ; 

-- subquery 
SELECT 
    *
FROM
    actor
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            film_actor
        WHERE
            film_id = 2);
-- nested ubquery ,means nesting a subquery in another subquery 
use sakila;
SELECT 
    *
FROM
    actor
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            film_actor
        WHERE
            film_id = (SELECT 
                    film_id
                FROM
                    film
                WHERE
                    title = 'Ace Goldfinger')); 
-- charater lenght  function  using the filmtable 
-- the will return the character lenght of this title

SELECT 
    title, CHAR_LENGTH(title), CHARACTER_LENGTH(title)
FROM
    film;

-- concat() function -allow to JOIN two or more parameter
SELECT 
    first_name, last_name, CONCAT(first_name, ' ', last_name)
FROM
    actor;
 -- Using the UNION function to join two table ,actor and film table
 
 (SELECT 
    actor_id, last_name
FROM
    actor) UNION (SELECT 
    customer_id, first_name
FROM
    customer) ORDER BY 2 , 1;
-- Aggerate function are function that enable calculation of 
-- mutiple rows of a table and return on a single columns
 -- (count ,sum ,avg(average) min,max)

SELECT 
    COUNT(film_id)
FROM
    film
WHERE
    replacement_cost > 27;
    -- using distinct to  remove duplicate return value in a column

 select  distinct rental_duration from film;
 
 -- aggregate function Sum only work on numeric
 -- data and null values are excluded from the result
 
SELECT 
    MIN(replacement_cost)
FROM
    film;
 -- return the largest value in a specified column   
   SELECT 
    MAX(replacement_cost)
FROM
    film; 
SELECT 
    AVG(replacement_cost)
FROM
    film;
-- GROUP BY FUNCTION  reduce number of repeating because 
-- it alreay grouped it ,thereby its only return the value once
SELECT 
    last_name
FROM
    sakila.actor
GROUP BY last_name;

-- putting count shows the number of times the return valu appears
-- using aggregate function ,you can only use with a paranthesis
-- e.g  min() and there must be no space bewtween the aggregate fxn and ()
SELECT 
    last_name, COUNT(*)
FROM
    sakila.actor
GROUP BY last_name;

-- having clAUSE FUNCTION TO KNOW THE NUMBER OF LASTNAME COUNTED GREATER THAT 3 
SELECT 
    last_name, COUNT(*)
FROM
    sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 3;


 SELECT c.customer_id AS 'Customer ID',
		c.first_name AS 'First Name',
		c.Last_name AS 'Last Name',
        SUM(amount) AS 'total paid'
from sakila.payment p
Inner join customer c on
p.customer_id = c.customer_id
group by c.customer_id
having sum(amount) > 180
order by sum(amount)desc;
 
 -- INNER JOIN - is used to return data from mutiple tables
-- must also have at least one identical table e.g city and country table both hve country_id common to both

SELECT 
    city, country
FROM
    city
        INNER JOIN
    country ON city.country_id = country.country_id;
 
 -- using country and city tbe as alias a and b
SELECT 
    city , country 
FROM
    city a
        INNER JOIN
    country b ON a.country_id = b.country_id;
    
-- using count and having n inner join

SELECT 
   country, count(city)
FROM
  country a
        INNER JOIN city b ON a.country_id = b.country_id
        group by country;
        
-- left  join
-- all rows from the left table are returned ,
-- used to return data muitiple table,could also retun null values
select c.customer_id,
c.first_name,
c.last_name,
a.actor_id,
a.first_name,
a.last_name 
from customer c
left join actor a on c.last_name = a.last_name
order by c.last_name;

-- right join
-- all rows from the right table are returned ,
-- used to return data muitiple table,could also retun null values

select c.customer_id,
c.first_name,
c.last_name,
a.actor_id,
a.first_name,
a.last_name 
from customer c
right join actor a on c.last_name = a.last_name
order by a.last_name;

-- self join used to join a table to itself
select a.customer_id,
a.first_name,
a.last_name,
b.customer_id,
b.first_name,
b.last_name 
from customer a
inner join customer b on a.last_name = b.last_name;


select a.customer_id,
a.first_name,
a.last_name,
b.customer_id,
b.first_name,
b.last_name 
from customer a
left join customer b on a.last_name = b.last_name;


select a.customer_id,
a.first_name,
a.last_name,
b.customer_id,
b.first_name,
b.last_name 
from customer a
right join customer b on a.last_name = b.last_name;