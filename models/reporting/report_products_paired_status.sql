select
    pp.deposit_id,
    pp.product_id,
    pp.product_name,
    pp.sent_at,
    --rename to avoide duplicate colmumn
    pr.sent_at as return_date,
    pp.location,
    pp.user_id,
    CASE
WHEN getdate()<= dateadd(day,6,pp.sent_at) and pr.sent_at is null then 'paired'
WHEN getdate()> dateadd(day,6,pp.sent_at) and pr.sent_at is null then 'expired'
ELSE 'returned'
END AS statuts
from {{ ref('stg_products_paired') }} as pp
left join {{ ref('stg_products_returned') }} as pr
on pp.deposit_id=pr.deposit_id
order by pp.sent_at desc

