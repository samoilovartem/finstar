-- Query 1 (Straight one) --
SELECT
    c.first_name AS "first_name",
    c.second_name AS "second_name",
    SUM(p.payment_amount) AS "total_amount",
    COUNT(p.id) AS "payment_count"
FROM
    client c
INNER JOIN account a ON c.id = a.client_id
INNER JOIN payments p ON a.id = p.account_id
GROUP BY
    c.id, c.first_name, c.second_name
HAVING
    COUNT(p.id) >= 5
    AND SUM(p.payment_amount) > 15000;

-- Query 1 (CTE - Common Table Expression) --
WITH PaymentSummary AS (
    SELECT
        a.client_id,
        SUM(p.payment_amount) AS total_amount,
        COUNT(p.id) AS payment_count
    FROM
        account a
    JOIN
        payments p ON a.id = p.account_id
    GROUP BY
        a.client_id
    HAVING
        COUNT(p.id) >= 5 AND SUM(p.payment_amount) > 15000
)

SELECT
    c.first_name,
    c.second_name,
    ps.total_amount,
    ps.payment_count
FROM
    PaymentSummary ps
JOIN
    client c ON ps.client_id = c.id;


-- Query 2 (Straight one) --
SELECT
    c.id AS "client_id",
    c.first_name AS "first_name",
    c.second_name AS "second_name"
FROM
    client c
LEFT JOIN account a ON c.id = a.client_id
LEFT JOIN payments p ON a.id = p.account_id
GROUP BY
    c.id, c.first_name, c.second_name
HAVING
    COUNT(DISTINCT p.id) <= 1;

-- Query 2 (CTE - Common Table Expression) --
WITH PaymentCounts AS (
    SELECT
        a.client_id,
        COUNT(p.id) AS payment_count
    FROM
        client c
    LEFT JOIN account a ON c.id = a.client_id
    LEFT JOIN payments p ON a.id = p.account_id
    GROUP BY
        a.client_id
)

SELECT
    c.id AS "client_id",
    c.first_name AS "first_name",
    c.second_name AS "second_name"
FROM
    client c
LEFT JOIN PaymentCounts pc ON c.id = pc.client_id
WHERE
    pc.payment_count IS NULL OR pc.payment_count = 1
ORDER BY
    c.id;

-- Query 3 (Straight one) --
SELECT
    c.id AS "client_id",
    COUNT(DISTINCT a.id) AS "number_of_accounts",
    SUM(CASE WHEN p.payment_type = 'payment' AND EXTRACT(YEAR FROM p.payment_date) = EXTRACT(YEAR FROM CURRENT_DATE) THEN p.payment_amount ELSE 0 END) AS "payment_sum_for_current_year",
    SUM(CASE WHEN p.payment_type = 'cancel' AND EXTRACT(YEAR FROM p.payment_date) = EXTRACT(YEAR FROM CURRENT_DATE) THEN p.payment_amount ELSE 0 END) AS "cancel_sum_for_current_year"
FROM
    client c
LEFT JOIN account a ON c.id = a.client_id
LEFT JOIN payments p ON a.id = p.account_id AND p.payment_amount >= 5000 AND p.payment_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY
    c.id
HAVING
    MAX(p.payment_amount) >= 5000;



-- Query 3 (CTE - Common Table Expression) --
WITH RecentTransactions AS (
    SELECT
        a.client_id,
        COUNT(DISTINCT a.id) AS number_of_accounts,
        SUM(CASE WHEN p.payment_type = 'payment' AND EXTRACT(YEAR FROM p.payment_date) = EXTRACT(YEAR FROM CURRENT_DATE) THEN p.payment_amount ELSE 0 END) AS payment_sum_for_current_year,
        SUM(CASE WHEN p.payment_type = 'cancel' AND EXTRACT(YEAR FROM p.payment_date) = EXTRACT(YEAR FROM CURRENT_DATE) THEN p.payment_amount ELSE 0 END) AS cancel_sum_for_current_year
    FROM
        account a
    JOIN
        payments p ON a.id = p.account_id
    WHERE
        p.payment_date >= CURRENT_DATE - INTERVAL '30 days'
        AND p.payment_amount >= 5000
    GROUP BY
        a.client_id
)

SELECT
    c.id AS "client_id",
    rt.number_of_accounts,
    rt.payment_sum_for_current_year,
    rt.cancel_sum_for_current_year
FROM
    client c
JOIN
    RecentTransactions rt ON c.id = rt.client_id;
