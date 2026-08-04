{% snapshot loan_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='loan_amnt',
        strategy='check',
        check_cols=['loan_status']
    )
}}

SELECT *

FROM {{ ref('stg_loan_data') }}

{% endsnapshot %}