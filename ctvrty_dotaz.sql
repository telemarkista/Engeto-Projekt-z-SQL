-- Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
-- Vytvořil jsem přehled zobrazující procentuální rozdíl průměrné ceny všech potravin pro sledované roky. Z dat lze vidět, že v žádném sledovaném roce nedošlo k nárůstu přes 10%.

WITH Rozdil_cen AS (
    SELECT 
        rok,
        AVG(prumerna_cena) AS souhrna_prumerna_cena,
        LAG(AVG(prumerna_cena)) OVER (ORDER BY rok) AS predchozi_prumerna_cena
    FROM 
        t_robert_zunt_project_sql_primary_final
    GROUP BY 
        rok
)
SELECT 
    rok,
    ROUND(((souhrna_prumerna_cena - predchozi_prumerna_cena) / predchozi_prumerna_cena) * 100, 2) AS procentualni_rozdil
FROM 
    Rozdil_cen
WHERE 
    predchozi_prumerna_cena IS NOT NULL
ORDER BY 
    rok;

   