# "Finstar" Test Assignment

This repository contains solutions for three distinct tasks related to database management, data processing, and development workflow.

## Task 1: Database Queries

Based on the database structure which consists of 3 tables: `client`, `account`, and `payments`, the following SQL queries have been formulated:

1. **Clients with High Transactions**: Retrieve a list of clients having 5 or more operations and a total payment amount exceeding 15,000. The resulting report will have:
   - client first name
   - client second name
   - payment amount sum
   - payment quantity

2. **Clients with Minimal or No Payments**: Fetch a list of unique clients who have either made only one payment or haven't made any payments at all. The output report includes:
   - client id
   - client first name
   - client second name

3. **Clients with Recent High Transactions**: Get a list of clients who have made at least one transaction of 5,000 or more in the last 30 days. Each row corresponds to one client. Transactions of type 'payment' and 'cancel' can be distinguished by the `payment_type` field. The resulting report showcases:
   - client id
   - number of accounts
   - sum of payment transactions for the current year
   - sum of cancel transactions for the current year

## Task 2: Data Processing Module

In the `test_data` directory, there is information related to various requests organized such that one folder corresponds to one request, e.g., t1, t2, ..., tN. Each of these folders contains results of scoring and data fetched from databases in the form of JSON files.

The task involves creating a module to compute the following parameters and save them in a separate JSON similar to the existing structure:

| Field             | Description                                           | Source              |
|-------------------|-------------------------------------------------------|---------------------|
| id                | User Identifier                                       | web-app-data        |
| type              | Acquisition Channel                                   | web-app-data        |
| salary            | Salary                                                | web-app-data        |
| score             | Value of the linear part of logistic regression       | scoring             |
| pd                | Default Probability (calculated using score)          | Calculated from score |
| result            | Application Decision                                  | scoring             |
| result_adj        | Adjusted Application Decision                         | Conditional Check   |
| max_loan_amount   | Maximum Approved Amount                               | scoring             |
| important_emotions| Most probable emotions of the borrower                | web-app-data        |

## Task 3: Development and Testing Workflow

This task aims to devise a development and testing strategy to minimize the probability of introducing bugs or breaking existing functionality.

---

**Note**: Solutions and further explanations for each task can be found in their respective directories or files in this repository.
