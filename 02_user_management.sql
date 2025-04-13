-- -----------------------------------------------------------------------------
-- File: 02_user_management.sql
-- Description: Creates standard user roles and grants permissions for the
--              bookstore_db database, as required by the project.
-- Author: [Name of Person 2 - User Manager Role] (Reviewed by [Name of Person 1], [Name of Person 3])
-- IMPORTANT: Replace placeholder passwords with strong, unique passwords!
--            This script should be run using a MySQL user with administrative
--            privileges (e.g., root) after the schema is created.
-- -----------------------------------------------------------------------------

-- Ensure we are using the correct database
USE bookstore_db;

-- -----------------------------------------------------
-- User Creation: Define functional roles for the Bookstore application
-- -----------------------------------------------------

-- 1. Admin User (Full control over bookstore_db, connects locally)
--    Needed for overall database maintenance within the bookstore scope.
CREATE USER IF NOT EXISTS 'bookstore_admin'@'localhost'
    IDENTIFIED BY 'ReplaceWithStrongAdminPassword!';

-- 2. Order Processing User (Manages orders, views related data, connects locally)
--    Simulates staff handling customer orders.
CREATE USER IF NOT EXISTS 'order_processor'@'localhost'
    IDENTIFIED BY 'ReplaceWithStrongOrderPassword!';

-- 3. Inventory Management User (Manages books, authors, publishers, connects locally)
--    Simulates staff managing the book catalog and related entities.
CREATE USER IF NOT EXISTS 'inventory_manager'@'localhost'
    IDENTIFIED BY 'ReplaceWithStrongInventoryPassword!';

-- 4. Read-Only Reporting User (Can view all data, potentially connects remotely)
--    For generating reports or analytics without risk of modifying data.
CREATE USER IF NOT EXISTS 'reporter'@'%' -- Allows connection from any host
    IDENTIFIED BY 'ReplaceWithStrongReporterPassword!';


-- -----------------------------------------------------
-- Granting Privileges: Assign permissions based on the principle of least privilege
-- -----------------------------------------------------

-- 1. bookstore_admin@localhost Privileges
--    Grants all operations ONLY on the bookstore_db database.
--    WITH GRANT OPTION allows this user to manage permissions for other bookstore users.
GRANT ALL PRIVILEGES ON bookstore_db.* TO 'bookstore_admin'@'localhost' WITH GRANT OPTION;


-- 2. order_processor@localhost Privileges
--    SELECT required for viewing customer, address, book, shipping, status info.
GRANT SELECT ON bookstore_db.Customer TO 'order_processor'@'localhost';
GRANT SELECT ON bookstore_db.address TO 'order_processor'@'localhost';
GRANT SELECT ON bookstore_db.country TO 'order_processor'@'localhost';
GRANT SELECT ON bookstore_db.customer_address TO 'order_processor'@'localhost';
GRANT SELECT ON bookstore_db.address_status TO 'order_processor'@'localhost';
GRANT SELECT ON bookstore_db.book TO 'order_processor'@'localhost';
GRANT SELECT ON bookstore_db.shipping_method TO 'order_processor'@'localhost';
GRANT SELECT ON bookstore_db.order_status TO 'order_processor'@'localhost';
--    SELECT, INSERT, UPDATE for managing orders and their details.
GRANT SELECT, INSERT, UPDATE ON bookstore_db.cust_order TO 'order_processor'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.order_line TO 'order_processor'@'localhost'; -- Allows modifying items within an order
GRANT SELECT, INSERT, UPDATE ON bookstore_db.order_history TO 'order_processor'@'localhost'; -- Allows managing status history


-- 3. inventory_manager@localhost Privileges
--    Full CRUD (Create, Read, Update, Delete) on core inventory tables.
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.book TO 'inventory_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.author TO 'inventory_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.publisher TO 'inventory_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.book_language TO 'inventory_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.book_author TO 'inventory_manager'@'localhost'; -- Manages the links between books and authors


-- 4. reporter@'%' Privileges
--    Read-only access across the entire bookstore_db. Necessary for reporting tools.
GRANT SELECT ON bookstore_db.* TO 'reporter'@'%';


-- -----------------------------------------------------
-- Apply Changes
-- -----------------------------------------------------
-- Ensure that the grant tables are reloaded and permission changes take effect.
FLUSH PRIVILEGES;

-- --- End of Script ---