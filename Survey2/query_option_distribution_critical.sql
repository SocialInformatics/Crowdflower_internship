-- =====================================
-- OPTIONS AMONG THOSE FOR WHOM IT IS CRITICAL
-- =====================================
select 
case when _country='USA' then "USA" 
when _country in ('IND','BGD','PAK','NPL','CHN')  then "Asia"
else "Europe" end as  country,
solution_selected,
-- main_source_of_income,
-- searching_is_a_problem,
-- main_source_of_income,
count(*) as amount,
case when _country='USA'
then (count(*)/72)*100
when _country in ('IND','BGD','PAK','NPL','CHN') then (count(*)/75)*100
else (count(*)/63)*100 end as percentage_out_of_all_valid

from initial_valid
where is_this_problem_critica='Yes'
group by 
case when _country='USA' then "USA" 
when _country in ('IND','BGD','PAK','NPL','CHN')  then "Asia"
else "Europe" end,
solution_selected
-- main_source_of_income,
-- searching_is_a_problem,
-- main_source_of_income
order by 
case when _country='USA' then "USA" 
when _country in ('IND','BGD','PAK','NPL','CHN')  then "Asia"
else "Europe" end,
case when _country='USA'
then (count(*)/72)*100
when _country in ('IND','BGD','PAK','NPL','CHN') then (count(*)/75)*100
else (count(*)/63)*100 end desc
-- =====================================
