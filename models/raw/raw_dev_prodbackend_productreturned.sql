select * from
{{ source('dev', 'product_returned') }}
where deposit_id is not null