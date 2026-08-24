CREATE DATABASE Banking_Fraud_Detection;

USE Banking_Fraud_Detection;

SELECT DATABASE();

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    registration_date DATE
);

SELECT * FROM Customers;
DESCRIBE Customers;

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(30),
    balance DECIMAL(15,2),
    account_status VARCHAR(20),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

SELECT * FROM Accounts;
DESCRIBE Accounts;

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATETIME,
    transaction_type VARCHAR(30),
    amount DECIMAL(15,2),
    location VARCHAR(50),
    status VARCHAR(20),
    payment_method VARCHAR(30),
    FOREIGN KEY (account_id)
        REFERENCES Accounts(account_id)
);

SELECT * FROM Transactions;
DESCRIBE Transactions;

CREATE TABLE Cards (
    card_id INT PRIMARY KEY,
    account_id INT,
    card_type VARCHAR(20),
    card_status VARCHAR(20),
    issue_date DATE,
    FOREIGN KEY (account_id)
        REFERENCES Accounts(account_id)
);

SELECT * FROM Cards;
DESCRIBE Cards;

CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

SELECT * FROM Branches;
DESCRIBE Branches;

INSERT INTO Customers
(customer_id, customer_name, gender, age, city, registration_date)
VALUES
(1, 'Aarav Sharma', 'Male', 28, 'Mumbai', '2023-01-15'),
(2, 'Priya Patil', 'Female', 32, 'Pune', '2023-02-20'),
(3, 'Rahul Deshmukh', 'Male', 41, 'Nashik', '2023-03-10'),
(4, 'Sneha Joshi', 'Female', 26, 'Thane', '2023-04-05'),
(5, 'Rohan Kulkarni', 'Male', 35, 'Mumbai', '2023-05-18'),
(6, 'Neha More', 'Female', 29, 'Pune', '2023-06-12'),
(7, 'Vikram Jadhav', 'Male', 45, 'Nagpur', '2023-07-25'),
(8, 'Ananya Shah', 'Female', 31, 'Mumbai', '2023-08-14'),
(9, 'Kunal Pawar', 'Male', 38, 'Nashik', '2023-09-01'),
(10, 'Pooja Chavan', 'Female', 27, 'Thane', '2023-10-11');

SELECT * FROM Customers;

INSERT INTO Accounts
(account_id, customer_id, account_type, balance, account_status)
VALUES
(101, 1, 'Savings', 85000.00, 'Active'),
(102, 2, 'Savings', 120000.00, 'Active'),
(103, 3, 'Current', 250000.00, 'Active'),
(104, 4, 'Savings', 65000.00, 'Active'),
(105, 5, 'Current', 180000.00, 'Active'),
(106, 6, 'Savings', 95000.00, 'Active'),
(107, 7, 'Savings', 300000.00, 'Active'),
(108, 8, 'Savings', 150000.00, 'Active'),
(109, 9, 'Current', 210000.00, 'Active'),
(110, 10, 'Savings', 75000.00, 'Active');

SELECT * FROM Accounts;

INSERT INTO Transactions
(transaction_id, account_id, transaction_date, transaction_type,
 amount, location, status, payment_method)
VALUES

(1001, 101, '2026-08-01 10:15:00', 'Purchase', 2500, 'Mumbai', 'Success', 'Debit Card'),
(1002, 101, '2026-08-01 12:30:00', 'Purchase', 1800, 'Mumbai', 'Success', 'Debit Card'),
(1003, 101, '2026-08-02 14:20:00', 'Withdrawal', 5000, 'Mumbai', 'Success', 'ATM'),
(1004, 101, '2026-08-03 11:10:00', 'Purchase', 2200, 'Mumbai', 'Success', 'Debit Card'),

(1005, 101, '2026-08-05 09:00:00', 'Purchase', 1000, 'Mumbai', 'Success', 'Debit Card'),
(1006, 101, '2026-08-05 09:15:00', 'Purchase', 1500, 'Mumbai', 'Success', 'Debit Card'),
(1007, 101, '2026-08-05 10:00:00', 'Purchase', 2000, 'Mumbai', 'Success', 'Debit Card'),
(1008, 101, '2026-08-05 11:30:00', 'Purchase', 1200, 'Mumbai', 'Success', 'Debit Card'),
(1009, 101, '2026-08-05 13:00:00', 'Purchase', 1800, 'Mumbai', 'Success', 'Debit Card'),
(1010, 101, '2026-08-05 15:00:00', 'Purchase', 2500, 'Mumbai', 'Success', 'Debit Card'),

(1011, 101, '2026-08-06 10:00:00', 'Purchase', 5000, 'Mumbai', 'Success', 'Debit Card'),
(1012, 101, '2026-08-06 10:20:00', 'Purchase', 7000, 'Delhi', 'Success', 'Debit Card'),

(1013, 101, '2026-08-07 02:10:00', 'Transfer', 75000, 'Delhi', 'Success', 'Online Banking'),
(1014, 101, '2026-08-07 02:13:00', 'Transfer', 80000, 'Delhi', 'Success', 'Online Banking'),

(1015, 102, '2026-08-01 09:10:00', 'Purchase', 3200, 'Pune', 'Success', 'Credit Card'),
(1016, 102, '2026-08-02 11:45:00', 'Purchase', 4500, 'Pune', 'Success', 'Credit Card'),
(1017, 102, '2026-08-03 16:30:00', 'Transfer', 15000, 'Pune', 'Success', 'Online Banking'),
(1018, 102, '2026-08-04 03:00:00', 'Purchase', 90000, 'Bangalore', 'Success', 'Credit Card'),

(1019, 103, '2026-08-01 10:00:00', 'Transfer', 10000, 'Nashik', 'Success', 'Online Banking'),
(1020, 103, '2026-08-02 13:20:00', 'Withdrawal', 12000, 'Nashik', 'Success', 'ATM'),
(1021, 103, '2026-08-03 15:10:00', 'Transfer', 15000, 'Nashik', 'Success', 'Online Banking'),
(1022, 103, '2026-08-04 03:05:00', 'Transfer', 120000, 'Mumbai', 'Success', 'Online Banking'),

(1023, 104, '2026-08-01 11:15:00', 'Purchase', 1500, 'Thane', 'Success', 'Debit Card'),
(1024, 104, '2026-08-02 12:00:00', 'Purchase', 2200, 'Thane', 'Success', 'Debit Card'),
(1025, 104, '2026-08-03 14:00:00', 'Purchase', 1800, 'Thane', 'Success', 'Debit Card'),

(1026, 105, '2026-08-01 09:30:00', 'Transfer', 30000, 'Mumbai', 'Success', 'Online Banking'),
(1027, 105, '2026-08-02 10:15:00', 'Transfer', 28000, 'Mumbai', 'Success', 'Online Banking'),
(1028, 105, '2026-08-03 14:45:00', 'Purchase', 5000, 'Mumbai', 'Pending', 'Credit Card'),

(1029, 106, '2026-08-01 13:00:00', 'Purchase', 1200, 'Pune', 'Success', 'Debit Card'),
(1030, 106, '2026-08-02 17:30:00', 'Purchase', 1800, 'Pune', 'Success', 'Debit Card'),
(1031, 106, '2026-08-04 04:00:00', 'Purchase', 60000, 'Delhi', 'Failed', 'Credit Card'),
(1041, 106, '2026-08-04 04:20:00', 'Purchase', 500, 'Delhi', 'Failed', 'Credit Card'),

(1032, 107, '2026-08-01 10:30:00', 'Transfer', 50000, 'Nagpur', 'Success', 'Online Banking'),
(1033, 107, '2026-08-02 11:30:00', 'Withdrawal', 15000, 'Nagpur', 'Success', 'ATM'),

(1034, 108, '2026-08-01 09:45:00', 'Purchase', 2500, 'Mumbai', 'Success', 'Credit Card'),
(1035, 108, '2026-08-02 15:20:00', 'Purchase', 3500, 'Mumbai', 'Pending', 'Credit Card'),
(1036, 108, '2026-08-04 04:05:00', 'Transfer', 100000, 'Delhi', 'Failed', 'Online Banking'),

(1037, 109, '2026-08-01 12:10:00', 'Transfer', 25000, 'Nashik', 'Success', 'Online Banking'),
(1038, 109, '2026-08-02 14:30:00', 'Transfer', 30000, 'Nashik', 'Success', 'Online Banking'),

(1039, 110, '2026-08-01 10:00:00', 'Purchase', 1000, 'Thane', 'Success', 'Debit Card'),
(1040, 110, '2026-08-02 16:15:00', 'Purchase', 1500, 'Thane', 'Success', 'Debit Card');

SELECT * FROM Transactions;

INSERT INTO Cards
(card_id, account_id, card_type, card_status, issue_date)
VALUES
(201, 101, 'Debit', 'Active', '2023-01-20'),
(202, 102, 'Credit', 'Active', '2023-02-25'),
(203, 103, 'Debit', 'Active', '2023-03-15'),
(204, 104, 'Debit', 'Active', '2023-04-10'),
(205, 105, 'Credit', 'Active', '2023-05-25'),
(206, 106, 'Credit', 'Active', '2023-06-20'),
(207, 107, 'Debit', 'Active', '2023-07-30'),
(208, 108, 'Credit', 'Active', '2023-08-20'),
(209, 109, 'Debit', 'Active', '2023-09-10'),
(210, 110, 'Debit', 'Active', '2023-10-20');

SELECT * FROM Cards;

INSERT INTO Branches
(branch_id, branch_name, city, state)
VALUES
(1, 'Mumbai Central Branch', 'Mumbai', 'Maharashtra'),
(2, 'Pune Main Branch', 'Pune', 'Maharashtra'),
(3, 'Nashik Branch', 'Nashik', 'Maharashtra'),
(4, 'Thane Branch', 'Thane', 'Maharashtra'),
(5, 'Nagpur Branch', 'Nagpur', 'Maharashtra');

SELECT * FROM Branches;


#Q1. Total number of transactions
SELECT COUNT(*) AS total_transactions
FROM Transactions;

#Q2. Total successful transaction amount
SELECT SUM(amount) AS total_successful_amount
FROM Transactions
WHERE status = 'Success';

#Q3. Number of Successful, Failed and Pending transactions
SELECT status, COUNT(*) AS transaction_count
FROM Transactions
GROUP BY status
ORDER BY status;

#Q4. Top 10 customers by transaction amount
SELECT
    c.customer_id,
    c.customer_name,
    SUM(t.amount) AS total_transaction_amount
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_transaction_amount DESC
LIMIT 10;

#Q5. Customers with more than 5 transactions in one day
SELECT
    c.customer_id,
    c.customer_name,
    DATE(t.transaction_date) AS transaction_day,
    COUNT(t.transaction_id) AS total_transactions
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.customer_name,
    DATE(t.transaction_date)
HAVING COUNT(t.transaction_id) > 5;

#Q6. Transactions significantly higher than customer's average
WITH CustomerAverage AS (
    SELECT
        a.customer_id,
        AVG(t.amount) AS average_amount
    FROM Accounts a
    JOIN Transactions t
        ON a.account_id = t.account_id
    GROUP BY a.customer_id
)
SELECT
    c.customer_name,
    t.transaction_id,
    t.amount,
    ROUND(ca.average_amount, 2) AS average_amount
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
JOIN Transactions t
    ON a.account_id = t.account_id
JOIN CustomerAverage ca
    ON c.customer_id = ca.customer_id
WHERE t.amount > ca.average_amount * 2
ORDER BY t.amount DESC;

#Q7. Customers using multiple locations on the same day
SELECT
    c.customer_id,
    c.customer_name,
    DATE(t.transaction_date) AS transaction_day,
    COUNT(DISTINCT t.location) AS different_locations
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.customer_name,
    DATE(t.transaction_date)
HAVING COUNT(DISTINCT t.location) > 1;

#Q8. Top accounts with failed transactions
SELECT
    a.account_id,
    c.customer_name,
    COUNT(t.transaction_id) AS failed_transactions
FROM Accounts a
JOIN Customers c
    ON a.customer_id = c.customer_id
JOIN Transactions t
    ON a.account_id = t.account_id
WHERE t.status = 'Failed'
GROUP BY
    a.account_id,
    c.customer_name
ORDER BY failed_transactions DESC;

#Q9. Multiple transactions within 5 minutes
SELECT
    t1.account_id,
    t1.transaction_id AS transaction_1,
    t2.transaction_id AS transaction_2,
    t1.transaction_date AS time_1,
    t2.transaction_date AS time_2,
    t1.amount AS amount_1,
    t2.amount AS amount_2
FROM Transactions t1
JOIN Transactions t2
    ON t1.account_id = t2.account_id
    AND t1.transaction_id < t2.transaction_id
    AND TIMESTAMPDIFF(
        MINUTE,
        t1.transaction_date,
        t2.transaction_date
    ) BETWEEN 0 AND 5;
    
    #Q10. Customers making transactions in multiple cities on the same day
    SELECT
    c.customer_id,
    c.customer_name,
    DATE(t.transaction_date) AS transaction_day,
    GROUP_CONCAT(DISTINCT t.location) AS locations,
    COUNT(DISTINCT t.location) AS location_count
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.customer_name,
    DATE(t.transaction_date)
HAVING COUNT(DISTINCT t.location) > 1;

#Q11. Transactions above ₹50,000
SELECT
    t.transaction_id,
    c.customer_name,
    t.amount,
    t.location,
    t.transaction_date
FROM Transactions t
JOIN Accounts a
    ON t.account_id = a.account_id
JOIN Customers c
    ON a.customer_id = c.customer_id
WHERE t.amount > 50000
ORDER BY t.amount DESC;

#Q12. Transactions more than 3× customer's average
WITH CustomerAverage AS (
    SELECT
        a.customer_id,
        AVG(t.amount) AS average_amount
    FROM Accounts a
    JOIN Transactions t
        ON a.account_id = t.account_id
    GROUP BY a.customer_id
)
SELECT
    c.customer_id,
    c.customer_name,
    t.transaction_id,
    t.amount,
    ROUND(ca.average_amount, 2) AS average_amount
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
JOIN Transactions t
    ON a.account_id = t.account_id
JOIN CustomerAverage ca
    ON c.customer_id = ca.customer_id
WHERE t.amount > ca.average_amount * 3
ORDER BY t.amount DESC;

#Q13. Rank customers by total transaction amount
SELECT
    c.customer_id,
    c.customer_name,
    SUM(t.amount) AS total_transaction_amount,
    RANK() OVER (
        ORDER BY SUM(t.amount) DESC
    ) AS customer_rank
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.customer_name;
    
    #Q14. Highest-value transaction for each customer
    WITH RankedTransactions AS (
    SELECT
        c.customer_id,
        c.customer_name,
        t.transaction_id,
        t.amount,
        t.transaction_date,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY t.amount DESC
        ) AS transaction_rank
    FROM Customers c
    JOIN Accounts a
        ON c.customer_id = a.customer_id
    JOIN Transactions t
        ON a.account_id = t.account_id
)
SELECT
    customer_id,
    customer_name,
    transaction_id,
    amount,
    transaction_date
FROM RankedTransactions
WHERE transaction_rank = 1
ORDER BY customer_id;

#Q15. Compare daily transaction amount with previous day
WITH DailyTransactions AS (
    SELECT
        DATE(transaction_date) AS transaction_day,
        SUM(amount) AS daily_amount
    FROM Transactions
    WHERE status = 'Success'
    GROUP BY DATE(transaction_date)
)
SELECT
    transaction_day,
    daily_amount,
    LAG(daily_amount) OVER (
        ORDER BY transaction_day
    ) AS previous_day_amount,
    daily_amount -
    LAG(daily_amount) OVER (
        ORDER BY transaction_day
    ) AS difference
FROM DailyTransactions
ORDER BY transaction_day;

#Q16. Create Fraud Risk Score
WITH CustomerAverage AS (
    SELECT
        a.customer_id,
        AVG(t.amount) AS average_amount
    FROM Accounts a
    JOIN Transactions t
        ON a.account_id = t.account_id
    GROUP BY a.customer_id
),

RapidTransactions AS (
    SELECT DISTINCT
        t1.transaction_id
    FROM Transactions t1
    JOIN Transactions t2
        ON t1.account_id = t2.account_id
        AND t1.transaction_id <> t2.transaction_id
        AND ABS(
            TIMESTAMPDIFF(
                MINUTE,
                t1.transaction_date,
                t2.transaction_date
            )
        ) <= 5
),

RiskCalculation AS (
    SELECT
        t.transaction_id,
        c.customer_name,
        t.amount,
        t.status,
        t.location,

        CASE
            WHEN t.amount > 50000 THEN 2
            ELSE 0
        END
        +
        CASE
            WHEN t.status = 'Failed' THEN 1
            ELSE 0
        END
        +
        CASE
            WHEN t.amount > ca.average_amount * 3 THEN 3
            ELSE 0
        END
        +
        CASE
            WHEN rt.transaction_id IS NOT NULL THEN 3
            ELSE 0
        END AS fraud_score

    FROM Transactions t

    JOIN Accounts a
        ON t.account_id = a.account_id

    JOIN Customers c
        ON a.customer_id = c.customer_id

    JOIN CustomerAverage ca
        ON c.customer_id = ca.customer_id

    LEFT JOIN RapidTransactions rt
        ON t.transaction_id = rt.transaction_id
)

SELECT
    transaction_id,
    customer_name,
    amount,
    status,
    location,
    fraud_score,

    CASE
        WHEN fraud_score >= 6 THEN 'High Risk'
        WHEN fraud_score >= 3 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level

FROM RiskCalculation
ORDER BY fraud_score DESC, amount DESC;

SHOW TABLES;
SELECT COUNT(*) AS customers
FROM Customers;

SELECT COUNT(*) AS accounts
FROM Accounts;

SELECT COUNT(*) AS transactions
FROM Transactions;

SELECT COUNT(*) AS cards
FROM Cards;

SELECT COUNT(*) AS branches
FROM Branches;







