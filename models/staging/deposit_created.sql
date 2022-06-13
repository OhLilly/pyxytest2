select 
dc.deposit_id,
dc.user_id,
dc.location,
dp.products,
dc.sent_at
from {{ ref('raw_dev_prodbackend_depositcreated') }} as dc
left join {{ ref('raw_dev_prodbackendcreated_depositpaired') }} as dp
on dc.deposit_id=dp.deposit_id
order by dc.timestamp desc
