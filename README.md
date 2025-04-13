# mysql-bookstore-project


## Introduction

This project involves designing and implementing a relational database for a bookstore using **MySQL**. The goal is to create a well-structured system to manage data related to books, customers, authors, orders, and shipping details. This practical project enhances skills in database design, SQL programming, and user access management.

---

## Technologies Used

- **MySQL** – For creating and managing the relational database.
- **Draw.io** – For designing the Entity Relationship Diagram (ERD).
- **GitHub** – For version control and collaboration.

---

## Objectives

- Create a functional and normalized MySQL database.
- Design tables to represent books, authors, customers, and orders.
- Establish relationships between tables using foreign keys.
- Implement user roles for secure data access.
- Test the database using sample SQL queries.

---

## Database Schema

The system consists of the following key tables:

- `book` – Details of books (title, language, publisher, price).
- `author` – Information about authors.
- `book_author` – Many-to-many relationship between books and authors.
- `book_language` – Languages that books are available in.
- `publisher` – Book publishers.
- `customer` – Bookstore customers.
- `address` – Address records.
- `customer_address` – Links customers to their addresses.
- `address_status` – Status of an address (e.g., current, old).
- `country` – Countries for addresses.
- `cust_order` – Customer order details.
- `order_line` – Books in each order.
- `order_status` – Status of each order (pending, delivered, etc.).
- `order_history` – History of order status updates.
- `shipping_method` – Delivery methods used.

---


