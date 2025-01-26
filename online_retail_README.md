# Online Retail App Database Schema

This repository contains the SQL scripts for creating and managing the database schema for an **Online Retail Application**. The schema is designed to support features such as user management, product cataloging, order processing, inventory management, and payment tracking.

## Features

- **User Management**: Handles user sign-ups, logins, and customer data.
- **Product Management**: Stores product details, categories, pricing, and inventory.
- **Order Processing**: Tracks customer orders, items in orders, and delivery statuses.
- **Payments**: Manages payment information, modes, and statuses.
- **Employee Management**: Supports internal employees and external vendor employees.
- **Audit and Logs**: Maintains logs for inventory changes and updates.

## Database Structure

The database schema consists of the following key tables:

1. **User Login**: Stores user authentication data.
2. **Customers**: Manages customer profiles and last login details.
3. **Employment Types**: Defines different types of employment (e.g., internal, vendor).
4. **Employees**: Stores employee details and links to employment types.
5. **Payments**: Tracks payment transactions.
6. **Orders**: Handles customer orders and links to payments, delivery, and employees.
7. **Product Items**: Stores product details, pricing, and inventory counts.
8. **Order Items**: Manages items in each order and their quantities.
9. **Order Delivery**: Tracks the delivery status of orders.
10. **Vendors**: Manages vendor details for external employees.
11. **Product Categories**: Organizes products into categories with support for hierarchical relationships.
12. **Inventory Logs**: Audits inventory changes (e.g., added, removed, sold).

## Prerequisites

- **Database**: MySQL 5.7+ or MariaDB.
- **Tools**: MySQL Workbench or any SQL client for executing the script.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/your-repository.git
   cd your-repository
2. Open the SQL script in your preferred SQL client.

3. Execute the script to create the schema:
source schema.sql;

How to Use

Run the SQL script to create the database schema.
Populate tables with initial data (optional).
Integrate the schema with your backend or application.
Key Constraints and Features

UUIDs: Used as primary keys for scalability and uniqueness.
Constraints: Includes FOREIGN KEY, CHECK, and UNIQUE constraints for data integrity.
Indexes: Optimized query performance with relevant indexes.
Soft Deletes: Added is_deleted columns to manage soft deletion of records.

Contribution:

Contributions are welcome! If you have suggestions or find issues, please open a pull request or file an issue.

Author: Nishant Barik
Feel free to connect with me on GitHub!

