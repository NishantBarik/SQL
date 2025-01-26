DROP SCHEMA IF EXISTS online_retail_app;
CREATE SCHEMA online_retail_app;
USE online_retail_app;

DROP TABLE IF EXISTS user_login;
CREATE TABLE user_login (
    user_id CHAR(36) PRIMARY KEY,
    user_password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email_id VARCHAR(255) UNIQUE NOT NULL,
    sign_up_on DATE DEFAULT CURRENT_DATE
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) UNIQUE,
    contact VARCHAR(15) NOT NULL CHECK (contact REGEXP '^[0-9]{10,15}$'),
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_login(user_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS employment_type;
CREATE TABLE employment_type (
    employment_type_id CHAR(36) PRIMARY KEY,
    employment_type VARCHAR(255) NOT NULL,
    internal_employee BOOLEAN DEFAULT TRUE,
    vendor_name VARCHAR(255)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id CHAR(36) PRIMARY KEY,
    employment_type_id CHAR(36),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email_id VARCHAR(255) UNIQUE NOT NULL,
    contact VARCHAR(15) NOT NULL CHECK (contact REGEXP '^[0-9]{10,15}$'),
    registered_on DATE DEFAULT CURRENT_DATE,
    contract_expiry DATE,
    FOREIGN KEY (employment_type_id) REFERENCES employment_type(employment_type_id) ON DELETE SET NULL
);

DROP TABLE IF EXISTS payment;
CREATE TABLE payment (
    payment_id CHAR(36) PRIMARY KEY,
    total_amount DECIMAL(10, 2) NOT NULL,
    payment_mode VARCHAR(50) NOT NULL,
    paid_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_success BOOLEAN DEFAULT TRUE
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id CHAR(36) PRIMARY KEY,
    ordered_by CHAR(36),
    payment_id CHAR(36),
    is_delivered BOOLEAN DEFAULT FALSE,
    delivery_date DATE,
    delivered_by CHAR(36),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ordered_by) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id) ON DELETE SET NULL,
    FOREIGN KEY (delivered_by) REFERENCES employees(employee_id) ON DELETE SET NULL
);

DROP TABLE IF EXISTS product_items;
CREATE TABLE product_items (
    item_id CHAR(36) PRIMARY KEY,
    item_code VARCHAR(255) UNIQUE NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    item_type VARCHAR(255) NOT NULL,
    item_description TEXT,
    item_image JSON,
    sold_by CHAR(36),
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    discount DECIMAL(5, 2) DEFAULT 0.00,
    stock_count INT DEFAULT 0 CHECK (stock_count >= 0),
    is_deleted BOOLEAN DEFAULT FALSE,
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id CHAR(36),
    item_id CHAR(36),
    quantity INT DEFAULT 1 CHECK (quantity > 0),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES product_items(item_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS order_delivery;
CREATE TABLE order_delivery (
    row_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id CHAR(36),
    delivery_stage VARCHAR(255) NOT NULL,
    updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS vendors;
CREATE TABLE vendors (
    vendor_id CHAR(36) PRIMARY KEY,
    vendor_name VARCHAR(255) NOT NULL,
    contact VARCHAR(15) CHECK (contact REGEXP '^[0-9]{10,15}$'),
    email_id VARCHAR(255) UNIQUE NOT NULL,
    registered_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS product_categories;
CREATE TABLE product_categories (
    category_id CHAR(36) PRIMARY KEY,
    category_name VARCHAR(255) UNIQUE NOT NULL,
    parent_category_id CHAR(36),
    FOREIGN KEY (parent_category_id) REFERENCES product_categories(category_id) ON DELETE SET NULL
);

DROP TABLE IF EXISTS inventory_logs;
CREATE TABLE inventory_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id CHAR(36),
    change_type ENUM('Added', 'Removed', 'Sold') NOT NULL,
    quantity_change INT NOT NULL,
    updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES product_items(item_id) ON DELETE CASCADE
);

CREATE INDEX idx_user_email ON user_login(email_id);
CREATE INDEX idx_item_code ON product_items(item_code);
