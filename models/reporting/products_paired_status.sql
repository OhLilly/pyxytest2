select
    dc.deposit_id as identifiant_deposit,
    pp.product_id as identifiant_produit,
    pp.product_name as nom_produit,
    dc.sent_at as date_appairage,
    pr.sent_at as date_retour,
    dc.location as lieu_appairage,
    dc.user_id as identifiant_utilisateur,
    CASE
WHEN getdate()<= dateadd(day,6,dc.sent_at) and date_retour is null then 'appairé'
WHEN getdate()> dateadd(day,6,dc.sent_at) and date_retour is null then 'expired'
ELSE 'retourné'
END AS statuts
from {{ ref('deposit_created') }} as dc
left join {{ ref('products_paired') }} as pp
on dc.deposit_id=pp.deposit_id
left join {{ ref('products_returned') }} as pr
on dc.deposit_id=pr.deposit_id
order by date_appairage desc

