CREATE OR REPLACE TABLE t_robert_zunt_project_SQL_primary_final
SELECT platy.rok,
platy.odvetvi,
platy.prumerna_mzda,
potraviny.potraviny_kategorie,
potraviny.potraviny_hodnota,
potraviny.jednotka,
potraviny.prumerna_cena
FROM
(SELECT
    cp.payroll_year AS rok,
    cpib.name AS odvetvi,
    AVG(cp.value) AS prumerna_mzda
FROM 
    czechia_payroll cp
JOIN 
    czechia_payroll_industry_branch cpib
    ON cp.industry_branch_code = cpib.code 
WHERE 
    cp.value_type_code = 5958
    AND
    cp.calculation_code = 200
GROUP BY 
    cp.payroll_year,
    cp.industry_branch_code 
ORDER BY 
	cp.payroll_year 
) platy
LEFT JOIN 
(SELECT 
	YEAR(cp.date_from) AS rok, -- rok z FROM data
    cpc.name AS potraviny_kategorie,
    cp.category_code,
    cpc.price_value AS potraviny_hodnota,
    cpc.price_unit AS jednotka,
    ROUND(AVG(cp.value), 2) AS prumerna_cena -- prumaerna rocni hodnota
FROM czechia_price cp
JOIN czechia_price_category cpc
    ON cp.category_code = cpc.code
 WHERE 
 cp.region_code IS NOT NULL
 GROUP BY
 	cpc.name,
 	YEAR(cp.date_from)
 ORDER BY 
 cp.date_from ) potraviny
 ON platy.rok = potraviny.rok
 	WHERE
 		platy.rok BETWEEN 2006 AND 2018
ORDER BY platy.rok ASC
 