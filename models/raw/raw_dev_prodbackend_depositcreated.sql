select * from
{{ source('prod', 'deposit_created') }}
where deposit_id is not NULL
order by sent_at desc