INSERT INTO client (id, first_name, second_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Alice', 'Johnson'),
(4, 'Bob', 'Williams'),
(5, 'Charlie', 'Brown'),
(6, 'Dave', 'Jones'),
(7, 'Eve', 'Davis'),
(8, 'Frank', 'Wilson'),
(9, 'Grace', 'Miller'),
(10, 'Hank', 'Taylor'),
(11, 'Irene', 'Anderson'),
(12, 'Jack', 'Thomas'),
(13, 'Kelly', 'Jackson'),
(14, 'Larry', 'White'),
(15, 'Mona', 'Harris');

INSERT INTO account (id, client_id, account_type, operations_limit) VALUES
(1, 1, 'Saving', 10000),
(2, 1, 'Checking', 5000),
(3, 2, 'Saving', 8000),
(4, 2, 'Checking', 4000),
(5, 3, 'Saving', 7000),
(6, 4, 'Checking', 2000),
(7, 5, 'Saving', 9000),
(8, 6, 'Checking', 3000),
(9, 7, 'Saving', 7500),
(10, 8, 'Checking', 4500),
(11, 9, 'Saving', 6500),
(12, 10, 'Checking', 5500),
(13, 11, 'Saving', 8500),
(14, 12, 'Checking', 2500),
(15, 13, 'Saving', 9500);

INSERT INTO payments (id, account_id, payment_date, payment_amount, description, payment_type) VALUES
(1, 1, '2023-01-15', 5000, 'Payment for service', 'payment'),
(2, 2, '2023-01-20', 2000, 'Online purchase', 'payment'),
(3, 3, '2023-01-25', 1500, 'Groceries', 'payment'),
(4, 4, '2023-01-30', 3500, 'Utility Bill', 'payment'),
(5, 5, '2023-02-01', 4500, 'Rent', 'payment'),
(6, 6, '2023-02-05', 1000, 'Cafe', 'payment'),
(7, 7, '2023-02-10', 6500, 'Electronics', 'payment'),
(8, 8, '2023-02-15', 2300, 'Payment for service', 'cancel'),
(9, 9, '2023-02-20', 7800, 'Furniture', 'payment'),
(10, 10, '2023-02-25', 3000, 'Utility Bill', 'payment'),
(11, 11, '2023-03-01', 4200, 'Rent', 'payment'),
(12, 12, '2023-03-05', 1700, 'Online purchase', 'cancel'),
(13, 13, '2023-03-10', 2900, 'Cafe', 'payment'),
(14, 14, '2023-03-15', 5500, 'Payment for service', 'payment'),
(15, 15, '2023-03-20', 3700, 'Groceries', 'payment');

INSERT INTO payments (id, account_id, payment_date, payment_amount, description, payment_type) VALUES
(16, 1, '2023-04-01', 4000, 'Rent', 'payment'),
(17, 1, '2023-04-05', 3000, 'Groceries', 'payment'),
(18, 1, '2023-04-10', 3500, 'Utility Bill', 'payment'),
(19, 1, '2023-04-15', 4000, 'Electronics', 'payment'),
(20, 1, '2023-04-20', 4500, 'Online purchase', 'payment');

INSERT INTO payments (id, account_id, payment_date, payment_amount, description, payment_type) VALUES
(21, 2, CURRENT_DATE, 6000, 'Large Payment 1', 'payment'),
(22, 3, CURRENT_DATE, 7000, 'Large Payment 2', 'payment'),
(23, 2, CURRENT_DATE - INTERVAL '10 days', 8000, 'Large Payment 3', 'payment'),
(24, 4, CURRENT_DATE - INTERVAL '20 days', 5500, 'Large Cancel 1', 'cancel');
