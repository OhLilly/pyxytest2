select
    deposit_id,
    product_id,
    max(sent_at) as derniere_date_appairage,
    location
from {{ ref('reporting_products_paired') }}
where deposit_id not in (select deposit_id from {{ ref('products_returned') }})
group by
    deposit_id,
    product_id,
    location
order by derniere_date_appairage desc
