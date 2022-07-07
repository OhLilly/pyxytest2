select * from
{{ source('prod', 'deposit_expired') }}
where deposit_id is not null
order by sent_at desc