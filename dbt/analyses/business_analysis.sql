SELECT

    grade,

    AVG(int_rate) AS avg_interest,

    SUM(loan_amnt) AS total_amount

FROM {{ ref('stg_loan_data') }}

GROUP BY grade

ORDER BY avg_interest DESC;