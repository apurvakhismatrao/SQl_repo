CREATE DATABASE BankingFraudDetection;

USE BankingFraudDetection;

SELECT DATABASE();

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    registration_date DATE
);

DESC Customers;

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    account_type VARCHAR(30),
    balance DECIMAL(12,2),
    account_status VARCHAR(20),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

DESC Accounts;

CREATE TABLE Merchants (
    merchant_id INT PRIMARY KEY AUTO_INCREMENT,
    merchant_name VARCHAR(100) NOT NULL,
    merchant_category VARCHAR(50),
    city VARCHAR(50),
    risk_level VARCHAR(20)
);

DESC Merchants;

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    merchant_id INT,
    transaction_date DATETIME,
    transaction_type VARCHAR(30),
    amount DECIMAL(12,2),
    transaction_status VARCHAR(20),
    FOREIGN KEY (account_id)
        REFERENCES Accounts(account_id),
    FOREIGN KEY (merchant_id)
        REFERENCES Merchants(merchant_id)
);

DESC Transactions;

CREATE TABLE Fraud_Alerts (
    alert_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_id INT NOT NULL,
    fraud_status VARCHAR(20),
    reason VARCHAR(200),
    alert_date DATE,
    FOREIGN KEY (transaction_id)
        REFERENCES Transactions(transaction_id)
);

DESC Fraud_Alerts;

CREATE TABLE Login_Activity (
    login_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    login_date DATETIME,
    login_status VARCHAR(20),
    device_type VARCHAR(30),
    city VARCHAR(50),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

DESC Login_Activity;

SHOW TABLES;

INSERT INTO Customers
(customer_name, email, phone, city, registration_date)
VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Mumbai', '2025-01-10'),
('Priya Patil', 'priya@gmail.com', '9876543211', 'Pune', '2025-01-15'),
('Amit Joshi', 'amit@gmail.com', '9876543212', 'Thane', '2025-02-05'),
('Sneha Kulkarni', 'sneha@gmail.com', '9876543213', 'Nashik', '2025-02-20'),
('Rohan Deshmukh', 'rohan@gmail.com', '9876543214', 'Mumbai', '2025-03-01'),
('Neha More', 'neha@gmail.com', '9876543215', 'Pune', '2025-03-15'),
('Akash Jadhav', 'akash@gmail.com', '9876543216', 'Thane', '2025-04-01'),
('Pooja Shinde', 'pooja@gmail.com', '9876543217', 'Mumbai', '2025-04-10'),
('Kunal Pawar', 'kunal@gmail.com', '9876543218', 'Nashik', '2025-05-01'),
('Anjali Sawant', 'anjali@gmail.com', '9876543219', 'Pune', '2025-05-15');

SELECT * FROM Customers;

INSERT INTO Accounts
(customer_id, account_type, balance, account_status)
VALUES
(1, 'Savings', 50000.00, 'Active'),
(2, 'Savings', 75000.00, 'Active'),
(3, 'Current', 120000.00, 'Active'),
(4, 'Savings', 45000.00, 'Active'),
(5, 'Savings', 90000.00, 'Active'),
(6, 'Current', 150000.00, 'Active'),
(7, 'Savings', 35000.00, 'Active'),
(8, 'Savings', 60000.00, 'Active'),
(9, 'Current', 110000.00, 'Active'),
(10, 'Savings', 40000.00, 'Blocked');

SELECT * FROM Accounts;

INSERT INTO Merchants
(merchant_name, merchant_category, city, risk_level)
VALUES
('Amazon India', 'Shopping', 'Mumbai', 'Low'),
('Flipkart', 'Shopping', 'Pune', 'Low'),
('ABC Electronics', 'Electronics', 'Thane', 'Medium'),
('Quick Travel', 'Travel', 'Mumbai', 'Medium'),
('Online Casino', 'Gaming', 'Pune', 'High'),
('XYZ Jewellery', 'Jewellery', 'Mumbai', 'High'),
('Food Corner', 'Food', 'Thane', 'Low'),
('Supermart', 'Grocery', 'Nashik', 'Low'),
('Crypto World', 'Cryptocurrency', 'Mumbai', 'High'),
('Book Store', 'Books', 'Pune', 'Low');

SELECT * FROM Merchants;

INSERT INTO Transactions
(account_id, merchant_id, transaction_date, transaction_type, amount, transaction_status)
VALUES
(1, 1, '2025-06-01 10:15:00', 'Purchase', 1200.00, 'Success'),
(2, 2, '2025-06-01 11:20:00', 'Purchase', 2500.00, 'Success'),
(3, 3, '2025-06-01 12:30:00', 'Purchase', 8500.00, 'Success'),
(4, 4, '2025-06-01 13:10:00', 'Payment', 3000.00, 'Success'),
(5, 5, '2025-06-01 14:20:00', 'Purchase', 15000.00, 'Failed'),
(6, 6, '2025-06-01 15:00:00', 'Purchase', 4500.00, 'Success'),
(7, 7, '2025-06-01 16:15:00', 'Withdrawal', 5000.00, 'Success'),
(8, 8, '2025-06-01 17:30:00', 'Purchase', 1800.00, 'Success'),
(9, 9, '2025-06-01 18:00:00', 'Transfer', 25000.00, 'Success'),
(10, 10, '2025-06-01 19:10:00', 'Purchase', 7000.00, 'Failed'),

(1, 3, '2025-06-02 09:30:00', 'Purchase', 22000.00, 'Success'),
(2, 1, '2025-06-02 12:10:00', 'Purchase', 1800.00, 'Success'),
(3, 5, '2025-06-02 14:20:00', 'Purchase', 35000.00, 'Success'),
(4, 7, '2025-06-02 16:00:00', 'Payment', 1200.00, 'Success'),
(5, 6, '2025-06-03 10:45:00', 'Purchase', 2800.00, 'Success'),
(6, 8, '2025-06-03 11:30:00', 'Purchase', 3200.00, 'Success'),
(7, 9, '2025-06-03 13:15:00', 'Purchase', 40000.00, 'Success'),
(8, 2, '2025-06-03 15:40:00', 'Purchase', 2100.00, 'Success'),
(9, 6, '2025-06-04 09:50:00', 'Purchase', 50000.00, 'Failed'),
(10, 4, '2025-06-04 17:20:00', 'Payment', 1500.00, 'Success'),

(1, 9, '2025-06-05 08:30:00', 'Purchase', 30000.00, 'Success'),
(2, 10, '2025-06-05 10:00:00', 'Purchase', 900.00, 'Success'),
(3, 6, '2025-06-05 12:30:00', 'Purchase', 27000.00, 'Success'),
(4, 1, '2025-06-05 14:00:00', 'Purchase', 1300.00, 'Success'),
(5, 5, '2025-06-06 09:15:00', 'Purchase', 45000.00, 'Success'),
(6, 3, '2025-06-06 11:45:00', 'Purchase', 7500.00, 'Success'),
(7, 5, '2025-06-06 13:30:00', 'Purchase', 28000.00, 'Failed'),
(8, 7, '2025-06-06 16:20:00', 'Payment', 1100.00, 'Success'),
(9, 9, '2025-06-07 10:10:00', 'Transfer', 60000.00, 'Success'),
(10, 2, '2025-06-07 12:40:00', 'Purchase', 1600.00, 'Success');

SELECT * FROM Transactions;

INSERT INTO Fraud_Alerts
(transaction_id, fraud_status, reason, alert_date)
VALUES
(3, 'Fraud', 'High transaction amount', '2025-06-01'),
(5, 'Suspicious', 'Failed high value transaction', '2025-06-01'),
(10, 'Suspicious', 'Failed transaction', '2025-06-01'),
(11, 'Fraud', 'Unusually high transaction', '2025-06-02'),
(13, 'Fraud', 'High risk merchant transaction', '2025-06-02'),
(19, 'Suspicious', 'High value failed transaction', '2025-06-04'),
(21, 'Fraud', 'High risk merchant transaction', '2025-06-05'),
(23, 'Fraud', 'Large transaction amount', '2025-06-05'),
(25, 'Fraud', 'High risk merchant transaction', '2025-06-06'),
(27, 'Suspicious', 'Failed high value transaction', '2025-06-06'),
(29, 'Fraud', 'Very high transfer amount', '2025-06-07');

SELECT * FROM Fraud_Alerts;

INSERT INTO Login_Activity
(customer_id, login_date, login_status, device_type, city)
VALUES
(1, '2025-06-01 08:30:00', 'Success', 'Mobile', 'Mumbai'),
(2, '2025-06-01 09:00:00', 'Success', 'Laptop', 'Pune'),
(3, '2025-06-01 09:15:00', 'Success', 'Mobile', 'Thane'),
(4, '2025-06-01 10:00:00', 'Success', 'Mobile', 'Nashik'),
(5, '2025-06-01 10:30:00', 'Failed', 'Laptop', 'Mumbai'),
(6, '2025-06-02 08:45:00', 'Success', 'Mobile', 'Pune'),
(7, '2025-06-02 09:30:00', 'Success', 'Laptop', 'Thane'),
(8, '2025-06-02 11:00:00', 'Failed', 'Mobile', 'Mumbai'),
(9, '2025-06-03 10:15:00', 'Success', 'Laptop', 'Nashik'),
(10, '2025-06-03 12:00:00', 'Failed', 'Mobile', 'Pune'),
(1, '2025-06-04 09:00:00', 'Success', 'Laptop', 'Mumbai'),
(3, '2025-06-04 09:45:00', 'Failed', 'Mobile', 'Thane'),
(5, '2025-06-05 10:30:00', 'Success', 'Mobile', 'Mumbai'),
(7, '2025-06-05 11:15:00', 'Success', 'Laptop', 'Thane'),
(9, '2025-06-06 14:00:00', 'Failed', 'Mobile', 'Nashik');

SELECT * FROM Login_Activity;

#Q1. Find the total number of customers
SELECT COUNT(customer_id) AS total_customers
FROM Customers;

#Q2. Find the total transaction amount
SELECT SUM(amount) AS total_transaction_amount
FROM Transactions;

#Q3. Find the average transaction amount
SELECT AVG(amount) AS average_transaction_amount
FROM Transactions;

#Q4. Find the highest and lowest transaction amount
SELECT
    MAX(amount) AS highest_transaction,
    MIN(amount) AS lowest_transaction
FROM Transactions;

#Q5. Find all failed transactions
SELECT *
FROM Transactions
WHERE transaction_status = 'Failed';

#Q6. Find the number of transactions for each transaction type
SELECT
    transaction_type,
    COUNT(transaction_id) AS total_transactions
FROM Transactions
GROUP BY transaction_type;

#Q7. Find the total transaction amount for each transaction type
SELECT
    transaction_type,
    SUM(amount) AS total_amount
FROM Transactions
GROUP BY transaction_type;

#Q8. Display customer name, account type and account balance
SELECT
    c.customer_name,
    a.account_type,
    a.balance
FROM Customers c
INNER JOIN Accounts a
    ON c.customer_id = a.customer_id;
    
#Q9. Display all customers and their account information
SELECT
    c.customer_name,
    a.account_id,
    a.account_type,
    a.balance
FROM Customers c
LEFT JOIN Accounts a
    ON c.customer_id = a.customer_id;
    
#Q10. Display all accounts and their customer information
SELECT
    c.customer_name,
    a.account_id,
    a.account_type,
    a.balance
FROM Customers c
RIGHT JOIN Accounts a
    ON c.customer_id = a.customer_id;
    
#Q11. Find the total transaction amount for each customer
SELECT
    c.customer_name,
    SUM(t.amount) AS total_transaction_amount
FROM Customers c
INNER JOIN Accounts a
    ON c.customer_id = a.customer_id
INNER JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.customer_name;

#Q12. Find the number of transactions made by each customer
SELECT
    c.customer_name,
    COUNT(t.transaction_id) AS total_transactions
FROM Customers c
INNER JOIN Accounts a
    ON c.customer_id = a.customer_id
INNER JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.customer_name;

#Q13. Find customers whose total transaction amount is greater than ₹50,000
SELECT
    c.customer_name,
    SUM(t.amount) AS total_transaction_amount
FROM Customers c
INNER JOIN Accounts a
    ON c.customer_id = a.customer_id
INNER JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(t.amount) > 50000;

#Q14. Find all transactions marked as Fraud
SELECT
    t.transaction_id,
    t.account_id,
    t.amount,
    f.fraud_status,
    f.reason
FROM Transactions t
INNER JOIN Fraud_Alerts f
    ON t.transaction_id = f.transaction_id
WHERE f.fraud_status = 'Fraud';

#Q15. Find transactions made at high-risk merchants
SELECT
    t.transaction_id,
    m.merchant_name,
    m.risk_level,
    t.amount,
    t.transaction_status
FROM Transactions t
INNER JOIN Merchants m
    ON t.merchant_id = m.merchant_id
WHERE m.risk_level = 'High';

#Q16. Find failed transactions where amount is greater than ₹10,000
SELECT
    transaction_id,
    account_id,
    amount,
    transaction_status
FROM Transactions
WHERE transaction_status = 'Failed'
AND amount > 10000;

#Q17. Find transactions whose amount is greater than the average transaction amount
SELECT
    transaction_id,
    account_id,
    amount
FROM Transactions
WHERE amount > (
    SELECT AVG(amount)
    FROM Transactions
);

#Q18. Categorize transactions as Low, Medium or High
SELECT
    transaction_id,
    amount,
    CASE
        WHEN amount < 5000 THEN 'Low'
        WHEN amount BETWEEN 5000 AND 20000 THEN 'Medium'
        ELSE 'High'
    END AS transaction_category
FROM Transactions;

#Q19. Calculate total transaction amount for each customer using CTE
WITH CustomerTransactions AS (
    SELECT
        c.customer_name,
        SUM(t.amount) AS total_amount
    FROM Customers c
    INNER JOIN Accounts a
        ON c.customer_id = a.customer_id
    INNER JOIN Transactions t
        ON a.account_id = t.account_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT *
FROM CustomerTransactions;

#Q20. Rank customers based on total transaction amount
WITH CustomerTotals AS (
    SELECT
        c.customer_name,
        SUM(t.amount) AS total_amount
    FROM Customers c
    INNER JOIN Accounts a
        ON c.customer_id = a.customer_id
    INNER JOIN Transactions t
        ON a.account_id = t.account_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    total_amount,
    RANK() OVER (ORDER BY total_amount DESC) AS customer_rank
FROM CustomerTotals;
