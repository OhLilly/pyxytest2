select deposit_id,
product_id,
sent_at,
location
from {{ ref('stg_products_paired') }}
order by sent_at desc

