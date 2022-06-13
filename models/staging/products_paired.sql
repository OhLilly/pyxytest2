select 
deposit_id,
product_id,
product_name,
user_id,
location,
timestamp
from {{ ref('raw_dev_prodbackend_productpaired') }} as pp
order by timestamp desc