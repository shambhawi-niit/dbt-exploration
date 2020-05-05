{{ config(materialized='view') }}

with final_table as (
    select * from {{ ref('atmdata_raw') }}
),
amount_wise_atm as 
( 
    select ATMDEVICEID,sum(AMOUNTDISPENSED) as amount_per_atm 
    from final_table group by ATMDEVICEID ORDER BY amount_per_atm DESC
)

select * from amount_wise_atm
