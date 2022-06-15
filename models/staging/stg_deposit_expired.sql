select
deposit_id,
user_id,
sent_at,
location,
amount_collected
from {{ ref('raw_dev_prodbackend_depositexpired') }}
order by sent_at desc