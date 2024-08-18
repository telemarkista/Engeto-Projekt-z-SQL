-- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
-- Pokud bude porovnávat trend mezd (růst/Klesání/beze změny  mezi průmeřnou roční mzdou v jednotlivých letech a pro každé odvětví, tak dojdeme k zjištění, že v některých odvětvích došlo i k meziročnímu poklesu.
WITH TrendMezd AS (
    SELECT
        rok,
        odvetvi,
        prumerna_mzda,
        LAG(prumerna_mzda) OVER (PARTITION BY odvetvi ORDER BY rok) AS predchozi_mzda
    FROM 
        t_robert_zunt_project_SQL_primary_final
)
SELECT 
    rok,
    odvetvi,
    prumerna_mzda,
    predchozi_mzda,
    CASE 
        WHEN prumerna_mzda > predchozi_mzda THEN 'Rust'
        WHEN prumerna_mzda < predchozi_mzda THEN 'Klesani'
        ELSE 'Beze změny'
    END AS trend
FROM 
    TrendMezd
ORDER BY 
    trend DESC;
   
-- Pokud budeme porovnávat mzdy mezi prvním a posledním rokem ze sledovaného období, tak dojdeme k zjištění, že u všech odvětví došlo k nárůstu.
WITH TrendMezd AS (
    SELECT 
        rok, 
        odvetvi, 
        prumerna_mzda,
        FIRST_VALUE(prumerna_mzda) OVER (PARTITION BY odvetvi ORDER BY rok ASC) AS prvni_mzda,
        LAST_VALUE(prumerna_mzda) OVER (PARTITION BY odvetvi ORDER BY rok ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS posledni_mzda,
        FIRST_VALUE(rok) OVER (PARTITION BY odvetvi ORDER BY rok ASC) AS prvni_rok,
        LAST_VALUE(rok) OVER (PARTITION BY odvetvi ORDER BY rok ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS posledni_rok
    FROM 
        t_robert_zunt_project_sql_primary_final
)
SELECT 
    odvetvi,
    prvni_mzda,
    posledni_mzda,
    CASE 
        WHEN posledni_mzda > prvni_mzda THEN 'Rust'
        WHEN posledni_mzda < prvni_mzda THEN 'Klesani'
        ELSE 'Beze změny'
    END AS trend
FROM 
    TrendMezd
GROUP BY 
    odvetvi, prvni_rok, posledni_rok, prvni_mzda, posledni_mzda
ORDER BY 
    odvetvi;

