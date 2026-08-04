SELECT

    purpose,

    COUNT(*) AS total_loans,

    SUM(loan_amnt) AS total_amount,

    AVG(loan_amnt) AS avg_loan

FROM {{ ref('stg_loan_data') }}

GROUP BY purpose;