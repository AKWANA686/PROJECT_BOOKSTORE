-- This SQL script creates a database schema for a bookstore system.
CREATE DATABASE BookstoreDB;

-- This is for using the created database
USE BookstoreDB;

CREATE ROLE 'team_member';

-- The 'team_member' role is created to manage access to the bookstoreDB database.
-- The role will have all privileges on the bookstoreDB database, allowing users to perform any action within it.
GRANT ALL PRIVILEGES ON bookstoreDB.* TO 'team_member';

-- The 'team_member' role has been created with all privileges on the bookstoreDB database.
CREATE USER 'phoebe'@'%' IDENTIFIED BY 'phoebe123';
CREATE USER 'clive'@'%' IDENTIFIED BY 'clive123';

-- Granting the 'team_member' role to the users so they can access the bookstoreDB database.
GRANT 'team_member' TO 'phoebe'@'%';
GRANT 'team_member' TO 'clive'@'%';

-- Assigning the default role to the users so that they can use it without needing to set it each time they log in.
SET DEFAULT ROLE 'team_member' TO 'phoebe'@'%';
SET DEFAULT ROLE 'team_member' TO 'clive'@'%';


FLUSH PRIVILEGES;

-- This table is for the list of all books available in the bookstore.
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    publication_year INT,
    publisher_id INT,
    language_id INT,
    genre VARCHAR(100),
    price DECIMAL(10, 2),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

--A list of all authors.
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

--A table to manage the many-to-many relationship between books and authors.
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

--This is a list of the possible languages of books.
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(50) UNIQUE NOT NULL
);

--A list of publishers for books.
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(255) UNIQUE NOT NULL
);

-- Table to store all customer information
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- A table to link customers and addresses, allowing multiple addresses per customer
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Table to store all addresses in the system
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street_address VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
    );

-- Table to store address status (e.g., current, old)
CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) UNIQUE
);

-- Table to store countries where addresses are located
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) UNIQUE
);

/**
The cust_orders table is created to store
information about customer orders, including order ID,
customer ID, order date, shipping method ID,
status ID, and total amount.
**/
CREATE TABLE cust_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    shipping_method_id INT NOT NULL,
    status_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id) 
);

/**
The order_line table is created to store information
about the items in each order,
including order line ID, order ID,
book ID, quantity, and price.
**/
CREATE TABLE order_line(
    order_line_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10, 2) NOT NULL,
    UNIQUE (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_orders(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

/**
Shipping method table is created to store
information about the shipping methods available
for orders, including
shipping_method_ID, name, cost, delivery days, and status.
**/
CREATE TABLE shipping_method(
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    shipping_method_name VARCHAR(100) NOT NULL,
    shipping_cost DECIMAL(10, 2) NOT NULL DEFAULT 0,
    delivery_days TINYINT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

/**
The order history table is created to store
information about the history of orders,
including order_history_ID, order ID, status ID, and date.
**/
CREATE TABLE order_history(
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    change_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_orders(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

/**
The order_status table is
created to store information
about the status of orders,
including status_ID and name.
**/
CREATE TABLE order_status(
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);