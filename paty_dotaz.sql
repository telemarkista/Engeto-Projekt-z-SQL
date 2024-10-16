-- Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
 WITH GDPChange AS (
    SELECT 
        e.`year` AS year,
        e.GDP AS gdp_value,
        LAG(e.GDP) OVER (ORDER BY e.`year`) AS previous_gdp,
        ROUND(((e.GDP - LAG(e.GDP) OVER (ORDER BY e.`year`)) / LAG(e.GDP) OVER (ORDER BY e.`year`)) * 100, 2) AS gdp_change_percentage
    FROM 
        economies e
    WHERE 
        e.country = 'Czech Republic'
), -- here I obtained the GDP information for the Czech Republic
SalariesAndWages AS (
    SELECT 
        trzpspf.year,
        ROUND(AVG(trzpspf.average_salary)) AS average_salary,
        ROUND(AVG(trzpspf.average_food_price)) AS average_price,
        LAG(AVG(trzpspf.average_salary)) OVER (ORDER BY trzpspf.year) AS previous_avg_salary,
        LAG(AVG(trzpspf.average_food_price)) OVER (ORDER BY trzpspf.year) AS previous_avg_price,
        ROUND(((AVG(trzpspf.average_salary) - LAG(AVG(trzpspf.average_salary)) OVER (ORDER BY trzpspf.year)) / LAG(AVG(trzpspf.average_salary)) OVER (ORDER BY trzpspf.year)) * 100, 2) AS salary_change_percentage,
        ROUND(((AVG(trzpspf.average_food_price) - LAG(AVG(trzpspf.average_food_price)) OVER (ORDER BY trzpspf.year)) / LAG(AVG(trzpspf.average_food_price)) OVER (ORDER BY trzpspf.year)) * 100, 2) AS price_change_percentage
    FROM 
        t_robert_zunt_project_sql_primary_final trzpspf
    GROUP BY 
        trzpspf.year
)
SELECT 
    p.year,
    h.gdp_value,
    p.average_salary,
    p.average_price,
    h.gdp_change_percentage,
    p.salary_change_percentage,
    p.price_change_percentage
FROM 
    GDPChange h
JOIN 
    SalariesAndWages p ON h.year = p.year
ORDER BY 
    p.year;
