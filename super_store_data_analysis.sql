-- Step 1
-- Aggregated profit at category and sub-category level
-- Exlcuded the one with positive profit from the result set
with total_profit_calc as 
(
select 
category,
sub_category,
sum(profit) as total_profit
from superstore_view
group by category, sub_category
having total_profit <= 0 
),

-- Step 2
-- Calculate running_loss and its % contribution in total loss
category_in_loss_calc as 
(
select
category,
sub_category, 
total_profit,
sum(total_profit) over(order by total_profit) as running_loss,
sum(total_profit) over() as grand_loss,
round((sum(total_profit) over(order by total_profit) / sum(total_profit) over()),2) as cumulative_loss
from total_profit_calc
order by total_profit
),

-- Step 3 - Keep subcategory which contribute to 95% in total loss
top_contributors_in_loss as ( 
select *
from category_in_loss_calc
where cumulative_loss <= 0.95
)

-- Step 4 - Analyse the yearly distribution for losses for top contributing sub-categories
select 
year(sv.order_dt) as order_year,
sv.category,
sv.sub_category,
sum(sv.profit) as yearly_loss, 
sum(sum(sv.profit)) over() grand_loss,
round(
    (sum(sv.profit) / sum(sum(sv.profit)) over()) * 100, 
    2
) as pct_of_grand_loss
from superstore_view sv
join top_contributors_in_loss tc on (sv.category = tc.category and sv.sub_category = tc.sub_category)
group by order_year, sv.category, sv.sub_category
having yearly_loss <= 0
order by yearly_loss asc
;