CREATE DATABASE IF NOT EXISTS loan_analytics;
USE loan_analytics;

CREATE TABLE loan_data(
    loan_id BIGINT PRIMARY KEY AUTO_INCREMENT,
     loan_amnt NUMERIC(12,2),
    funded_amnt NUMERIC(12,2),
    funded_amnt_inv NUMERIC(12,2),

    term INT,
    int_rate NUMERIC(5,2),
    installment NUMERIC(12,2),

    grade VARCHAR(2),
    sub_grade VARCHAR(3),

    emp_length INT,
    home_ownership VARCHAR(20),

    annual_inc NUMERIC(15,2),
    verification_status VARCHAR(30),

    issue_d DATE,
    loan_status VARCHAR(30),
    purpose VARCHAR(50),

    dti NUMERIC(6,2),
    open_acc INT,
    revol_bal NUMERIC(15,2),
    revol_util NUMERIC(6,2),
    total_acc INT,

    total_pymnt NUMERIC(15,2),
    last_pymnt_amnt NUMERIC(15,2),

    issue_year INT,
    issue_month INT,
    issue_quarter INT,

    monthly_income NUMERIC(15,2),

    loan_income_ratio NUMERIC(10,4),

    installment_income_ratio NUMERIC(10,4),

    credit_age INT,

    income_category VARCHAR(20),

    loan_category VARCHAR(20),

    revol_util_category VARCHAR(20)
)

