select
deposit_id,
sent_at,
product_id,
product_name,
location,
user_id
from {{ ref('raw_dev_prodbackend_productreturned') }}
order by sent_at desc
