-- Use the database that you have imported the table into
USE your_database_name;

-- Query to list bands with Glam Rock as their main style, ranked by longevity
SELECT
    band_name,
    CASE
        -- If the band hasn't split yet (split is NULL), calculate lifespan as 2022 - formed
        WHEN split IS NULL THEN 2022 - formed
        -- If the band has split, calculate lifespan as split - formed
        ELSE split - formed
    END AS lifespan
FROM
    metal_bands
WHERE
    main_style = 'Glam rock'
ORDER BY
    lifespan DESC;
