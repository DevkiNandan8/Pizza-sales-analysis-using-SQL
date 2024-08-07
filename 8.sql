-- find category-wise distribution of pizzas

select 
count(pizza_types.name) , pizza_types.category from pizza_types
group by pizza_types.category;

-- select 
-- pizza_types.name , pizza_types.category from pizza_types
-- order by pizza_types.category;