# Online Retail App Database Schema

This repository contains the SQL scripts for creating and managing the database schema for an **Online Retail Application**. The schema supports core features like user management, product cataloging, order processing, inventory tracking, and payment management.

## File Overview

- **[`online_retail.sql`](https://github.com/NishantBarik/SQL/blob/37b6fe29ce3071b8a44a80c01bbe8adbd84ef552/online_retail.sql)**: SQL script to create the database schema for the online retail application.

## Features

- **User Management**: Handles user sign-up, login, and profile data.
- **Customer Profiles**: Tracks customer information and activity.
- **Employee and Vendor Management**: Supports internal and external employee records.
- **Product Catalog**: Manages products, categories, pricing, and inventory.
- **Order and Payment Processing**: Tracks orders, order items, payments, and delivery.
- **Inventory Auditing**: Logs inventory changes for better tracking.

## Database Structure

The schema includes the following key tables:

1. **user_login**: Stores user authentication details.
2. **customers**: Tracks customer profiles and last login timestamps.
3. **employment_type**: Defines employment categories like internal or vendor.
4. **employees**: Stores employee data and links to employment types.
5. **payment**: Tracks payment transactions, modes, and success statuses.
6. **orders**: Handles customer orders, linking them to payments and delivery staff.
7. **product_items**: Manages product information, pricing, inventory, and soft deletion.
8. **order_items**: Tracks individual items in each order.
9. **order_delivery**: Manages delivery stages for orders.
10. **vendors**: Stores vendor details and their employees.
11. **product_categories**: Organizes products into hierarchical categories.
12. **inventory_logs**: Audits inventory changes like additions, removals, and sales.

## Prerequisites

- **Database**: MySQL 5.7+ or MariaDB.
- **Tools**: MySQL Workbench, DBeaver, or any SQL client.

**Contribution :**

Feel free to contribute! If you have suggestions or encounter issues, open a pull request or file an issue in the repository.

Author: Nishant Barik

For questions or feedback, connect with me on GitHub.
