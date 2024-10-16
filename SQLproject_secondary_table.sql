CREATE OR REPLACE TABLE t_robert_zunt_project_SQL_secondary_final
SELECT 
e.country,
e.`year`,
e.GDP,
e.gini,
e.population
FROM economies e
WHERE e.country IN (
    SELECT country
    FROM countries c
    WHERE c.continent = 'Europe')
    AND
    e.`year` BETWEEN 2006 AND 2018
 
