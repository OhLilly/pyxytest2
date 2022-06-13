select * from
{{ source('dev', 'deposit_paired') }}
where deposit_id is not null