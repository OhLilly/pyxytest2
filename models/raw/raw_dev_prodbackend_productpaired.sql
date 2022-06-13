select * from
{{ source('dev', 'product_paired') }}
where deposit_id is not null