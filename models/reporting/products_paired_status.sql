select
    pp.deposit_id as identifiant_deposit,
    pp.product_id as identifiant_produit,
    pp.product_name as nom_produit,
    pp.sent_at as date_appairage,
    pr.sent_at as date_retour,
    pp.location as lieu_appairage,
    pp.user_id as identifiant_utilisateur,
    CASE
WHEN getdate()<= dateadd(day,6,pp.sent_at) and date_retour is null then 'appairé'
WHEN getdate()> dateadd(day,6,pp.sent_at) and date_retour is null then 'expired'
ELSE 'retourné'
END AS statuts
from {{ ref('products_paired') }} as pp
left join {{ ref('products_returned') }} as pr
on pp.deposit_id=pr.deposit_id
order by date_appairage desc

