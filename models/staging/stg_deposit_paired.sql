select 
deposit_id,
products,
sent_at,
location 
from {{ ref('raw_dev_prodbackendcreated_depositpaired') }}
order by sent_at desc
/*WITH exploded_array AS (
    SELECT 
      deposit_id
      sent_at,
      location,
      json_extract_path_text( JSON_EXTRACT_ARRAY_ELEMENT_TEXT(products, seq.i) , 'product_id' ) AS product_id
      --json_extract_path_text( JSON_EXTRACT_ARRAY_ELEMENT_TEXT(products, seq.i) , 'products_id' ) AS name
    FROM {{ ref('raw_dev_prodbackendcreated_depositpaired') }},seq_0_to_100 AS seq
    WHERE seq.i < JSON_ARRAY_LENGTH(products)
    order by sent_at desc
  )
  
SELECT *
FROM exploded_array*/