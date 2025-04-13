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

| Table Name         | Description |
|--------------------|-------------|
| `cust_orders`      | Stores customer order details such as order date, customer, shipping method, status, and total amount. |
| `order_line`       | Stores individual items included in each order including book, quantity, and price. |
| `shipping_method`  | Stores shipping method options including cost, delivery time, and active status. |
| `order_history`    | Stores the status history of orders including timestamps for each status update. |
| `order_status`     | Stores the possible status values for customer orders. |

