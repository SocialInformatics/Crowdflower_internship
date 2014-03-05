select 
case when _country='USA' then "USA" 
when _country in ('IND','BGD','PAK','NPL','CHN')  then "Asia"
else "Europe" end as  country,
main_source_of_income,
searching_is_a_problem,
is_this_problem_critica,
count(*) as amount,
case when _country='USA'
then (count(*)/215)*100
when _country in ('IND','BGD','PAK','NPL','CHN') then (count(*)/241)*100
else (count(*)/205)*100 end as percentage
from initial_valid
group by case when _country='USA' then "USA" 
when _country in ('IND','BGD','PAK','NPL','CHN')  then "Asia"
else "Europe" end,main_source_of_income,
searching_is_a_problem,
is_this_problem_critica
order by case when _country='USA' then "USA" 
when _country in ('IND','BGD','PAK','NPL','CHN')  then "Asia"
else "Europe" end,
case when _country='USA'
then (count(*)/215)*100
when _country in ('IND','BGD','PAK','NPL','CHN') then (count(*)/241)*100
else (count(*)/205)*100 end desc
