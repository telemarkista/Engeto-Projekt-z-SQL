CREATE OR REPLACE TABLE t_robert_zunt_project_SQL_primary_final
SELECT
    cp.payroll_year AS year,
    cpib.name AS industry,
    avg(cp.value) AS average_salary,
    cpc.name AS food_name,
    round(avg(cp2.value), 1) AS average_food_price
FROM czechia_payroll cp
LEFT JOIN czechia_payroll_industry_branch cpib
    ON cp.industry_branch_code = cpib.code
    AND cp.industry_branch_code IS NOT NULL 
LEFT JOIN czechia_price cp2 
    ON cp.payroll_year = YEAR(cp2.date_from)
LEFT JOIN czechia_price_category cpc 
    ON cp2.category_code = cpc.code
WHERE cp.value IS NOT NULL
    AND cp.unit_code = 200
    AND cp.value_type_code = 5958
    AND cp2.region_code IS NOT NULL 
GROUP BY cp.payroll_year, cpib.name, cpc.name, cp.industry_branch_code;
