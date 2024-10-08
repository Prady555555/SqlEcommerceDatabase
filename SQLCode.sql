-- To create a database we use this 
CREATE DATABASE ecommerce;

-- TO use the database we use this

use ecommerce;
-- To create a table we use this

CREATE TABLE customers( 
id INT NOT NULL auto_increment,
customer_name VARCHAR(20) NOT NULL,
email VARCHAR(25) NOT NULL,
adress VARCHAR(30) NOT NULL,
PRIMARY KEY (`id`)
)ENGINE = InnoDB;
-- To insert values into the table we use this
INSERT INTO customers (id, customer_name , email , adress) 
VALUES
(NULL , "pradeepdurai", "p@gmail.com" ,  "kanyakumari" ),
(NULL , "pradeep", "pra@gmail.com" , "nagercovil" ),
(NULL , "venkadesh", "venkadesh@gmail.com" ,  "tirunelveli" );



-- Creatng a table for orders
CREATE TABLE orders( 
id INT NOT NULL auto_increment,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
total_amount DECIMAL(10,2) NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (customer_id) REFERENCES customers(id)
)ENGINE = InnoDB;
-- Inserting values into the orders table
INSERT INTO orders (id, customer_id , order_date , total_amount) 
VALUES
(NULL ,1, "2024-09-1" ,  40.00 ),
(NULL ,2, "2024-09-15" , 20.00 ),
(NULL , 3, "2024-09-25" ,  300.00 );
-- creating a table for products
CREATE TABLE products( 
id INT NOT NULL auto_increment,
product_name VARCHAR(25) NOT NULL,
price DECIMAL(10,2)  NOT NULL,
decription TEXT NOT NULL,
PRIMARY KEY (`id`)

)ENGINE = InnoDB;
-- inserting values into the products table
INSERT INTO products (id,product_name,price,decription)
VALUES
(NULL, "brush",10.00,"brush it is used for brushing"),
(NULL, "paste",10.00,"paste it is used to brush our teeth"),
(NULL, "shoe",100.00,"shoe it is used to wear for office ");

-- 1. Retrieve all customers who have placed an order in the last 30 days.
SELECT customer_name FROM customers a 
JOIN orders b ON a.id = b.customer_id
WHERE b.order_date >= CURDATE() - INTERVAL 30 DAY;


--2. Get the total amount of all orders placed by each customer.

SELECT c.customer_name, o.total_amount
FROM customers c
JOIN orders o ON c.id = o.customer_id;


-- 3. Update the price of Product C to 45.00.

UPDATE products
SET price = 45.00
WHERE id = 3;


-- 4. Add a new column discount to the products table.
ALTER TABLE products 
ADD COLUMN discount INT NOT NULL;

-- 5.Retrieve the top 3 products with the highest price. 

SELECT product_name , price FROM products 
ORDER BY price  DESC LIMIT 3;

--6. Get the names of customers who have ordered Product A.

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),  
(2, 2, 1),  
(3, 3, 1); 

SELECT DISTINCT c.customer_name,p.product_name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.product_name = 'brush';






-- 7. Join the orders and customers tables to retrieve the customer's name and order date for each order. 

SELECT DISTINCT c.customer_name , o.order_date FROM customers c
JOIN orders o ON c.id = o.customer_id;

-- 8. Retrieve the orders with a total amount greater than 150.00 

SELECT total_amount FROM  orders o 
WHERE total_amount >150;



-- 9.Already i have created a table for order_items in 6 question so i can use that table to retrieve the data 
SELECT oi.order_id, p.product_name, oi.quantity
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

-- 10. Retrieve the average total of all orders
SELECT AVG(total_amount) AS average_order_amount 
FROM orders;











