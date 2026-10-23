SELECT package_row_id, test_id, impressions, clicks
FROM {{ref('stg_packages')}}
WHERE clicks > impressions OR
       clicks < 0 OR
       impressions < 0

