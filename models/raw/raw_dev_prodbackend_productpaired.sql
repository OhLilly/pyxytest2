select * from
{{ source('dev', 'product_paired') }}
order by sent_at desc