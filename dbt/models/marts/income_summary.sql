SELECT

    income_category,

    COUNT(*) AS total_customers,

    AVG(annual_inc) AS avg_income,

    SUM(loan_amnt) AS total_loan

FROM {{ ref('stg_loan_data') }}

GROUP BY income_category;