-- determine the top 3 pizza based on revenue for each category 

select category, name , revenue from 
(select category , name , revenue,
rank() over(partition by category order by revenue desc) as rn
from
(select 
pizza_types.name, 
pizza_types.category,
sum(order_details.quantity *pizzas.price) as revenue
from pizzas join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
join order_details
on order_details.pizza_id= pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as a) as b
where rn<=3;