select * from
{{ source('dev', 'deposit_created') }}
where deposit_id is not NULL