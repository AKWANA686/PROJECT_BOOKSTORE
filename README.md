"# Our BookStore Database Project" 
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



