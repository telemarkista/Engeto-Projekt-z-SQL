-- Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
-- Během prvotni agregace dat jsem zjisil, že porovnatelné období pro které jsou dostupné data o mzdách i potravinách je 2006-2008. 
WITH Rocni_data AS (
    SELECT 
        odvetvi,
        potraviny_kategorie,
        rok,
        prumerna_mzda,
        prumerna_cena
    FROM 
        t_robert_zunt_project_sql_primary_final
    WHERE 
        potraviny_kategorie IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový') -- Vyfiltrovani dat pro požadované roky
        AND rok IN (2006, 2018)
)
SELECT 
    odvetvi,
    potraviny_kategorie,
    round(SUM(CASE WHEN rok = 2006 THEN prumerna_mzda / prumerna_cena ELSE 0 END)) AS mnozstvi_za_rok_2006, -- samotný výpočet množství 
    round(SUM(CASE WHEN rok = 2018 THEN prumerna_mzda / prumerna_cena ELSE 0 END)) AS mnozstvi_za_rok_2018
FROM 
    Rocni_data
GROUP BY 
    odvetvi, potraviny_kategorie
ORDER BY 
    odvetvi, potraviny_kategorie;
