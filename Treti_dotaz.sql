-- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

WITH Annual_Summary AS (
    SELECT 
        food_name,
        year,
        average_food_price,
        LAG(average_food_price) OVER (PARTITION BY food_name ORDER BY year ASC) AS previous_price
    FROM 
        t_robert_zunt_project_sql_primary_final
)
SELECT 
    food_name,
    year,
    average_food_price,
    previous_price,
    CASE 
        WHEN previous_price IS NOT NULL THEN ROUND(((average_food_price - previous_price) / previous_price) * 100, 2)
        ELSE NULL
    END AS percentage_difference
FROM 
    Annual_Summary
WHERE 
    year > 2006
GROUP BY
    food_name,
    year
ORDER BY 
    percentage_difference ASC;

   
 -- part of script that can be used to see food thats price was descreasing 
 WITH Annual_Summary AS (
    SELECT 
        food_name,
        year,
        average_food_price,
        LAG(average_food_price) OVER (PARTITION BY food_name ORDER BY year ASC) AS previous_price
    FROM 
        t_robert_zunt_project_sql_primary_final
)
SELECT 
    food_name,
    year,
    average_food_price,
    previous_price,
    CASE 
        WHEN previous_price IS NOT NULL THEN ROUND(((average_food_price - previous_price) / previous_price) * 100, 2)
        ELSE NULL
    END AS percentage_difference
FROM 
    Annual_Summary
WHERE 
    year > 2006
    AND CASE 
        WHEN previous_price IS NOT NULL THEN ROUND(((average_food_price - previous_price) / previous_price) * 100, 2)
        ELSE NULL
    END < 0
GROUP BY
    food_name,
    year,
    average_food_price,
    previous_price
ORDER BY 
    food_name DESC;


