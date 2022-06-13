select 
deposit_id,
product_id,
product_name,
user_id,
location,
sent_at
from {{ ref('raw_dev_prodbackend_productpaired') }} as pp
order by timestamp desc