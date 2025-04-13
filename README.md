# Our BookStore Database Project 
# Bookstore Database

A relational database designed to manage customers, addresses, and geographic data for a bookstore system. This project includes well-structured tables, relationships, and sample data for testing and development.

Database Structure

The database consists of the following tables:

| Table            | Description |
|------------------|-------------|
| `customer`        | Stores customer details such as name, email, and phone number. |
| `address_status`  | Stores possible statuses for an address (e.g., Current, Old). |
| `country`         | Stores country names where addresses are located. |
| `address`         | Stores full address details including street, city, postal code, and country. |
| `customer_address`| A table that links customers to their multiple addresses and address statuses. |

# Bookstore Database - Order Management Schema

This document outlines the structure of the order-related tables used in the bookstore database project. These tables are responsible for managing customer orders, order items, shipping methods, and order history.

## Tables Overview

| Table Name        | Description |
|-------------------|-------------|
| `cust_orders`     | Stores
information about customer orders, including order ID,
customer ID, order date, shipping method ID,
status ID, and total amount. |       
| `order_line`      | The table is created to store information
about the items in each order,
including order line ID, order ID,
book ID, quantity, and price. |
| `shipping_method` | Stores
information about the shipping methods available
for orders, including
shipping_method_ID, name, cost, delivery days, and status. |
| `order_history`   | Stores
information about the history of orders,
including order_history_ID, order ID, status ID, and date. |
| `order_status`    | Stores information
about the status of orders,
including status_ID and name. |

