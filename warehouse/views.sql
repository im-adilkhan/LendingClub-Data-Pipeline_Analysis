-- 1) Loan Status Summary
-- Purpose

-- Loan Status wise

-- Total Loans
-- Total Amount
-- Average Interest
-- Average Income

CREATE VIEW loan_status_summary AS

SELECT

    loan_status,

    COUNT(*) AS total_loans,

    SUM(loan_amnt) AS total_loan_amount,

    AVG(loan_amnt) AS avg_loan_amount,

    AVG(int_rate) AS avg_interest_rate,

    AVG(annual_inc) AS avg_annual_income

FROM loan_data

GROUP BY loan_status;



-- 2 : Grade Summary
-- Purpose

-- Grade wise performance

CREATE VIEW grade_summary AS

SELECT

    grade,

    COUNT(*) AS total_loans,

    SUM(loan_amnt) AS total_amount,

    AVG(int_rate) AS avg_interest,

    AVG(total_pymnt) AS avg_payment

FROM loan_data

GROUP BY grade;


-- 3 : State Summary

-- Purpose

-- State wise loan analysis

CREATE VIEW state_summary AS

SELECT

    addr_state,

    COUNT(*) AS total_loans,

    SUM(loan_amnt) AS total_loan,

    AVG(annual_inc) AS avg_income

FROM loan_data

GROUP BY addr_state;




-- Purpose Summary

-- Purpose

-- Customer loan kis purpose ke liye le raha hai.

CREATE VIEW purpose_summary AS

SELECT

    purpose,

    COUNT(*) AS total_loans,

    AVG(loan_amnt) AS avg_loan,

    AVG(int_rate) AS avg_interest

FROM loan_data

GROUP BY purpose;


-- 5 : Monthly Loan Summary

-- Purpose

-- Month wise trend


CREATE VIEW monthly_loan_summary AS

SELECT

    issue_year,

    issue_month,

    COUNT(*) AS total_loans,

    SUM(loan_amnt) AS total_amount

FROM loan_data

GROUP BY

    issue_year,issue_month;


-- 6 : Income Category Summary

-- Purpose

-- Income category analysis


CREATE VIEW income_category_summary AS

SELECT

    income_category,

    COUNT(*) AS total_customers,

    AVG(loan_amnt) AS avg_loan,

    AVG(int_rate) AS avg_interest

FROM loan_data

GROUP BY income_category;



-- 7 : Loan Category Summary

CREATE VIEW loan_category_summary AS

SELECT

    loan_category,

    COUNT(*) AS total_loans,

    AVG(loan_amnt) AS avg_amount

FROM loan_data

GROUP BY loan_category;



-- 8 : Revolving Utilization Summary

CREATE VIEW revol_util_summary AS

SELECT

    revol_util_category,

    COUNT(*) AS total_customers,

    AVG(revol_util) AS avg_utilization

FROM loan_data

GROUP BY revol_util_category;



-- views.sql
- │
-- ├── loan_status_summary
-- ├── grade_summary
-- ├── state_summary
-- ├── purpose_summary
-- ├── monthly_loan_summary
-- ├── income_category_summary
-- ├── loan_category_summary
-- └── revol_util_summary