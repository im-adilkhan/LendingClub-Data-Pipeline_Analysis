SELECT *

FROM {{ ref('stg_loan_data') }}

WHERE

    int_rate < 0

OR

    int_rate > 100;