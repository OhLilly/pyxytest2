with
amount as(
    select * from {{ ref('raw_dev_prodbackend_depositexpired') }}
)
select
    deposit_id,
    amount_collected
from amount
where amount_collected<=0