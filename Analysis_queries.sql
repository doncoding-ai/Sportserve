SELECT * FROM [dbo].[sports_user1] ORDER BY ID;

SELECT UID, COUNT(*)
FROM [dbo].[sports_user1]
GROUP BY UID
ORDER BY COUNT(*) DESC;

--
SELECT COUNTRY, STATE, count(*) count
FROM [dbo].[sports_user1]
GROUP BY COUNTRY, STATE
ORDER BY COUNT(*) DESC;

select  [plan], count(*) count from [dbo].[sports_user1] group by [plan] order by count(*) desc;

select  GENDER, count(*) count
from [dbo].[sports_user1]
group by GENDER
order by count(*) desc;

select STATUS,  count(*) count
from [dbo].[sports_user1]
group by STATUS
order by count(*) desc;


select PAYMENT_METHOD,  count(*) count
from [dbo].[sports_user1]
group by PAYMENT_METHOD
order by count(*) desc;

SELECT TERM, COUNT(*) COUNT
from [dbo].[sports_user1]
group by TERM
order by count(*) desc;

with age_data as(
SELECT social_insurance_number, DATEDIFF(YEAR, date_of_birth, GETDATE()) as age
FROM [dbo].[sports_user1]),
age_generation as(
select social_insurance_number, age, case when age <30 then 'Gen-z' when age >=30 and age <=45 then 'Millenials'
else 'Boomers' end as age_Category
from age_data) 
select age_Category, count(*) count from age_generation
group by age_Category
order by count desc;