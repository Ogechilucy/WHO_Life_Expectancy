-- retrieve life expectancy in Afghanistan between 2000 and 2015
select country, year, life_expectancy, adult_mortality, infant_deaths 
from who.health
where country = 'afghanistan'
and year
between '2000' and '2015'
group by 1, 2
order by 2;

-- compare life expectancy in 2 developed countries to 2 developing countries 
select life_expectancy, year, status, country
from who.health
where country in  ('Afghanistan', 'Albania', 'Australia', 'Austria')
order by 2;

-- find average life expectancy for 2 developed countries and 2 developing countries 
select avg(life_expectancy), avg(alcohol), status
from who.health 
group by status
order by 1 asc;

-- correlation between average life expectancy and average total expenditure 
select country, status, avg(life_expectancy), avg(total_expenditure),
case when avg(life_expectancy) <65
then 'low' 
when avg(life_expectancy) >80
then 'high'
else 'Average'
end as 'life expectancy ranking'
from who.health
group by country
having avg(life_expectancy) >0
order by 3 desc
limit 700;
