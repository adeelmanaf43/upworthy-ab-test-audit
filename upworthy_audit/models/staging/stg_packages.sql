-- Staging model: one row per package (version) in the exploratory file.
-- Clean names and text only. No calculations or filtering here
select
    -- identifiers
    int64_field_0          as package_row_id,
    clickability_test_id   as test_id,

    -- time
    created_at, 
    updated_at,
    test_week,

    -- what visitors saw
    trim(headline)        as headline,
    eyecatcher_id         as image_id,

    -- results
    impressions,
    clicks,

    -- Upworthy's own fields (not statistical results)
    winner               as editor_winner,
    first_place,
    significance,                              -- not a significance test; documented as unreliable

    -- stored, but not shown to visitors in test
    excerpt,
    lede,
    slug,
    share_text,
    square


from {{ source('upworthy_raw', 'exploratory_packages') }} as editor_winner_source