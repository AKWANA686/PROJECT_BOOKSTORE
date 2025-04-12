
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

-- A table for knowing orders placed by a customer.
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
Shipping method table is created to store information about the shipping methods available for orders, including shipping method ID, name, cost, delivery days, and status.
**/
CREATE TABLE shipping_method(
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    shipping_method_name VARCHAR(100) NOT NULL,
    shipping_cost DECIMAL(10, 2) NOT NULL DEFAULT 0,
    delivery_days TINYINT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);