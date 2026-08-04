SELECT

    issue_year,

    issue_month,

    COUNT(*) AS total_loans,

    SUM(loan_amnt) AS total_amount

FROM {{ ref('stg_loan_data') }}

GROUP BY

    issue_year,

    issue_month;