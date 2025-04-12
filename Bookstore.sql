
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