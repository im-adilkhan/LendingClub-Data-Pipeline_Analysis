SELECT

    grade,

    COUNT(*) AS total_loans,

    SUM(loan_amnt) AS total_amount,

    AVG(int_rate) AS avg_interest

FROM {{ ref('stg_loan_data') }}

GROUP BY grade;