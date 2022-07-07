select
{{ dbt_utils.surrogate_key(['product_id','user_id']) }} as returned_sk,
deposit_id,
sent_at,
product_id,
product_name,
user_id,
location
from {{ ref('raw_dev_prodbackend_productreturned') }}
order by sent_at desc
