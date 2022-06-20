select
    deposit_id, --as identifiant_deposit
    product_id, --as identifiant_produit
    product_name, --as nom_produit
    max(sent_at), --as derniere_date_appairage
    user_id, --as identifiant_utilisateur
    location --as lieu_dernier_appairage
from {{ ref('stg_products_paired') }}
where deposit_id in 
(select deposit_id from {{ ref('stg_deposit_expired') }}) AND (deposit_id not in (select deposit_id from {{ ref('stg_products_returned') }}))
group by
  deposit_id,
  product_id,
  product_name,
  user_id,
  location
