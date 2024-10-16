-- Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd? 
WITH Annual_data_food AS (
    SELECT 
        food_name,
        year,
        AVG(average_food_price) AS average_food_price_per_year -- Aggregating the food price per year
    FROM 
        t_robert_zunt_project_SQL_primary_final
    WHERE 
        food_name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový') -- Filter data for the requested food items
        AND year IN (2006, 2018) -- Filter data for the requested years
    GROUP BY
        food_name,
        year 
),
Annual_data_salary AS (
    SELECT 
        year,
        AVG(average_salary) AS average_salary_per_year -- Aggregating the salary per year across industries
    FROM 
        t_robert_zunt_project_SQL_primary_final
    WHERE 
      	year IN (2006, 2018) -- Filter data for the requested years
    GROUP BY
        year 
)
SELECT 
    adf.food_name, -- Show food name in the result
    ROUND(SUM(CASE x ads.year = 2006 THEN ads.average_salary_per_year / adf.average_food_price_per_year ELSE 0 END)) AS quantity_for_2006, -- Calculating quantity for 2006
    ROUND(SUM(CASE WHEN ads.year = 2018 THEN ads.average_salary_per_year / adf.average_food_price_per_year ELSE 0 END)) AS quantity_for_2018 -- Calculating quantity for 2018
FROM 
    Annual_data_salary ads
JOIN 
    Annual_data_food adf
    ON ads.year = adf.year -- Join salary and food price data by year
GROUP BY 
    adf.food_name -- Grouping by food name to calculate quantities for each food item
ORDER BY 
	    adf.food_name;

	   
