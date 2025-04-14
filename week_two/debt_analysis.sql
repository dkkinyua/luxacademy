/*
This file contains the SQL answers for Week Two's SQL assignment.
*/

select * from dataanalytics.international_debt;

-- Question 1. Total amount of debt owed by all countries --

select SUM(debt) as total_debt
from dataanalytics.international_debt;

-- Question 2.  Distinct Countries recorded in the dataset --

select distinct country_name, country_code 
from dataanalytics.international_debt
order by country_name ASC;

-- Question 3. Distinct types of debt indicators and what they represent --
select distinct indicator_name, indicator_code 
from dataanalytics.international_debt;

-- Question 4. Country with the highest debt --

select country_name, debt as max_debt
from dataanalytics.international_debt
order by debt desc
limit 1;

-- Question 5. Average debt across all debt indicators --
select indicator_name, AVG(debt) as avg_debt
from dataanalytics.international_debt
group by indicator_name;

-- Question 6. Country with highest amount of principal repayments --

select country_name, indicator_name, debt 
from dataanalytics.international_debt
where indicator_name = 'Principal repayments on external debt, long-term (AMT, current US$)'
order by debt desc
limit 1;

/* The country with highest amount of principal repayments is China, 96218619904 */

-- Question 7. Common debt indicators across all countries --
select indicator_name, COUNT(country_name) as country_count
from dataanalytics.international_debt
group by indicator_name
order by country_count DESC;

/*The most common debt indicator among all countries is Principal repayments on external debt, long-term (AMT, current US$) with a count of 128 instances.*/


