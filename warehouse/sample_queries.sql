SELECT COUNT(*) AS total_loans
FROM loan_data;


SELECT SUM(loan_amnt) AS total_loan_amount
FROM loan_data;



SELECT AVG(loan_amnt) AS avg_loan
FROM loan_data;



SELECT AVG(int_rate) AS avg_interest
FROM loan_data;


SELECT SUM(funded_amnt) AS total_funded
FROM loan_data;



SELECT
    loan_status,
    COUNT(*) AS total_loans
FROM loan_data
GROUP BY loan_status
ORDER BY total_loans DESC;



SELECT
    loan_status,
    AVG(loan_amnt) AS avg_loan
FROM loan_data
GROUP BY loan_status;



SELECT
    grade,
    SUM(loan_amnt) AS total_amount
FROM loan_data
GROUP BY grade
ORDER BY grade;



SELECT
    grade,
    AVG(int_rate) AS avg_interest
FROM loan_data
GROUP BY grade
ORDER BY avg_interest DESC;



SELECT
    income_category,
    COUNT(*) AS customers
FROM loan_data
GROUP BY income_category;



SELECT
    loan_status,
    AVG(annual_inc) AS avg_income
FROM loan_data
GROUP BY loan_status;



SELECT
    purpose,
    COUNT(*) AS total_loans
FROM loan_data
GROUP BY purpose
ORDER BY total_loans DESC;


SELECT
    purpose,
    AVG(loan_amnt) AS avg_loan
FROM loan_data
GROUP BY purpose;



SELECT
    issue_year,
    COUNT(*) AS total_loans
FROM loan_data
GROUP BY issue_year
ORDER BY issue_year;



SELECT
    issue_year,
    issue_month,
    SUM(loan_amnt) AS total_amount
FROM loan_data
GROUP BY issue_year, issue_month
ORDER BY issue_year, issue_month;


SELECT AVG(credit_age)
FROM loan_data;



SELECT
    revol_util_category,
    AVG(revol_util)
FROM loan_data
GROUP BY revol_util_category;


SELECT
    SUM(total_pymnt)
FROM loan_data;


SELECT
    AVG(last_pymnt_amnt)
FROM loan_data;