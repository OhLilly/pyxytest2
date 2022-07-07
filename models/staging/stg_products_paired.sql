/*CREATE TEMP TABLE seq_0_to_100 AS (
    SELECT 0 AS i UNION ALL
    SELECT 1 UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5
    -- I am stopping here, you could easily generate this as a VIEW with 100+ real rows...
);*/
WITH exploded_array AS (
    SELECT 
      deposit_id,
      sent_at,
      location,
      json_extract_path_text( JSON_EXTRACT_ARRAY_ELEMENT_TEXT(products, seq.i) , 'product_id' ) AS product_id
      --json_extract_path_text( JSON_EXTRACT_ARRAY_ELEMENT_TEXT(products, seq.i) , 'products_id' ) AS name
    FROM {{ ref('raw_dev_prodbackendcreated_depositpaired') }}, {{ ref('stg_seq_0_to_100') }} AS seq
    WHERE seq.i < JSON_ARRAY_LENGTH(products)
    order by sent_at desc
  )
  
SELECT *
FROM exploded_array