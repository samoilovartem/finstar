CREATE TABLE client (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    second_name VARCHAR(255)
);

CREATE TABLE account (
    id INT PRIMARY KEY,
    client_id INT,
    account_type VARCHAR(50),
    operations_limit INT,
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE payments (
    id INT PRIMARY KEY,
    account_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10, 2),
    description VARCHAR(255),
    payment_type VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES account(id)
);
