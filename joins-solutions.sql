--1. Get all customers and their addresses.
SELECT first_name, last_name, street, city, state, zip, address_type FROM customers
JOIN addresses ON customers.id = addresses.customer_id;
--2. Get all orders and their line items.
SELECT order_date, description, line_items.unit_price, quantity, total FROM orders
JOIN line_items ON orders.id = line_items.order_id
JOIN products on line_items.product_id = products.id;

--3. Which warehouses have cheetos?
SELECT warehouse FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON  warehouse_product.warehouse_id = warehouse.id
WHERE description = 'cheetos';

--4. Which warehouses have diet pepsi?
SELECT warehouse FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON  warehouse_product.warehouse_id = warehouse.id
WHERE description = 'diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT first_name, last_name, count(customers.id)  FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
JOIN line_items ON orders.id = line_items.order_id
GROUP BY customers.id;

--6. How many customers do we have?
SELECT count(id)  FROM customers;
--7. How many products do we carry?
SELECT count(id) FROM products;
--8. What is the total available on-hand quantity of diet pepsi?
SELECT sum(on_hand) FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON  warehouse_product.warehouse_id = warehouse.id
WHERE description = 'diet pepsi';
