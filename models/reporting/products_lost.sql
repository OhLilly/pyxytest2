select
    deposit_id as identifiant_deposit,
    product_id as identifiant_produit,
    product_name as nom_produit,
    max(sent_at) as derniere_date_appairage,
    user_id as identifiant_utilisateur,
    location as lieu_dernier_appairage
from {{ ref('products_paired') }}
where deposit_id in 
(select deposit_id from {{ ref('deposit_expired') }}) AND (deposit_id not in (select deposit_id from {{ ref('products_returned') }}))
group by
    identifiant_deposit,
    identifiant_produit,
    nom_produit,
    identifiant_utilisateur,
    lieu_dernier_appairage
