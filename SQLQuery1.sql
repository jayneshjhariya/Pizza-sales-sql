CREATE DATABASE pizza_sales

--Questions

	--Retrieve the total number of orders placed.

		SELECT COUNT(order_id) AS total_orders FROM pizza_sales.dbo.orders

	--Calculate the total revenue generated from pizza sales.
		
		SELECT ROUND(SUM(order_details.quantity * pizzas.price),2) AS total_sales
		FROM order_details JOIN pizzas
		ON pizzas.pizza_id = order_details.pizza_id

	--Identify the highest-priced pizza.

		SELECT TOP 1 pizza_types.name, ROUND(pizzas.price, 2)
		FROM pizza_types JOIN pizzas
		ON pizza_types.pizza_type_id = pizzas.pizza_type_id
		ORDER BY pizzas.price DESC;

	--Identify the most common pizza size ordered.

		SELECT pizzas.size, COUNT(order_details.order_details_id) AS order_count
		FROM pizzas JOIN order_details
		ON pizzas.pizza_id = order_details.pizza_id
		GROUP BY pizzas.size ORDER BY order_count DESC

	--List the top 5 most ordered pizza types along with their quantities.

		SELECT TOP 5 pizza_types.name, 
		SUM(order_details.quantity) AS quantity
		FROM pizza_types JOIN pizzas
		ON pizza_types.pizza_type_id = pizzas.pizza_type_id
		JOIN order_details
		ON order_details.pizza_id = pizzas.pizza_id
		GROUP BY pizza_types.name ORDER BY quantity DESC