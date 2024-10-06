# E-Commerce Database System

## Project Overview

This project is a simple e-commerce database system designed to manage customer, product, and order information using MySQL. The system features three key tables: customers, orders, and products, allowing efficient management of essential e-commerce data.

## Database Structure

### 1. **customers** Table
- `id`: Primary key, auto-incremented, unique identifier for each customer.
- `customer_name`: Customer's name.
- `email`: Customer's email address.
- `address`: Customer's physical address.

### 2. **orders** Table
- `id`: Primary key, auto-incremented, unique identifier for each order.
- `customer_id`: Foreign key referencing `customers(id)` to indicate which customer placed the order.
- `order_date`: The date the order was placed.
- `total_amount`: The total cost of the order.

### 3. **products** Table
- `id`: Primary key, auto-incremented, unique identifier for each product.
- `product_name`: Name of the product.
- `price`: Price of the product.
- `description`: Short description of the product.

### 4. **order_items** Table (Normalization)
- `id`: Primary key, auto-incremented, unique identifier for each order item.
- `order_id`: Foreign key referencing `orders(id)` to indicate which order the item belongs to.
- `product_id`: Foreign key referencing `products(id)` to indicate which product is being ordered.
- `quantity`: The quantity of the product in the order.

## Sample Data

The project includes sample data for the `customers`, `orders`, `products`, and `order_items` tables to simulate a functioning e-commerce system.

## Setup and Usage

### Prerequisites:
- MySQL installed on your system.

### Steps to Run:
1. **Create the database**: 
   - Use the following command to create the database:
     ```sql
     CREATE DATABASE ecommerce;
     ```

2. **Create the tables**:
   - Run the SQL scripts provided in the project to create the `customers`, `orders`, `products`, and `order_items` tables.

3. **Insert sample data**:
   - Insert the sample data into the respective tables using SQL `INSERT` statements.

4. **Run queries**:
   - You can execute SQL queries to retrieve and manipulate data in the system.

## Technologies Used
- **MySQL**: Relational database management system for creating and managing the e-commerce database.
- **SQL**: Structured Query Language for querying and updating the database.

## Project Purpose
This project demonstrates the fundamental aspects of relational database design for an e-commerce system. It helps understand how to create and link tables to manage product orders, customer information, and inventory effectively.
