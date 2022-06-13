select * from
{{ source('dev', 'deposit_expired') }}
where deposit_id is not null