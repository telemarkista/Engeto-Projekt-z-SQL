-- Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
-- Z dat nemůžeme jednoznačně říct, že změna HDP má vliv na změnu potravnin a mezd. Např. v roce 2007 můžeme vidět nárůst ve všech 3 kategoriríh, ale v roce 2015 už tento vzorec neplatí. 	
WITH HDPzmena AS (
    SELECT 
        e.`year` AS rok,
        e.GDP AS gdp_hodnota,
        LAG(e.GDP) OVER (ORDER BY e.`year`) AS predchozi_gdp,
        ROUND(((e.GDP - LAG(e.GDP) OVER (ORDER BY e.`year`)) / LAG(e.GDP) OVER (ORDER BY e.`year`)) * 100, 2) AS gdp_zmena_procenta
    FROM 
        economies e
    WHERE 
        e.country = 'Czech Republic'
), -- zde jsem získal informaci o HDP pro ČR
PlatyAMzdy AS (
    SELECT 
        trzpspf.rok,
        round(AVG(trzpspf.prumerna_mzda)) AS prumerna_mzda,
        round( AVG(trzpspf.prumerna_cena)) AS prumerna_cena,
        LAG(AVG(trzpspf.prumerna_mzda)) OVER (ORDER BY trzpspf.rok) AS predochozi_prum_mzda,
        LAG(AVG(trzpspf.prumerna_cena)) OVER (ORDER BY trzpspf.rok) AS predchozi_prum_cena,
        ROUND(((AVG(trzpspf.prumerna_mzda) - LAG(AVG(trzpspf.prumerna_mzda)) OVER (ORDER BY trzpspf.rok)) / LAG(AVG(trzpspf.prumerna_mzda)) OVER (ORDER BY trzpspf.rok)) * 100, 2) AS mzda_zmena_procenta,
        ROUND(((AVG(trzpspf.prumerna_cena) - LAG(AVG(trzpspf.prumerna_cena)) OVER (ORDER BY trzpspf.rok)) / LAG(AVG(trzpspf.prumerna_cena)) OVER (ORDER BY trzpspf.rok)) * 100, 2) AS cena_zmena_procenta
    FROM 
        t_robert_zunt_project_sql_primary_final trzpspf
    GROUP BY 
        trzpspf.rok
)
SELECT 
    p.rok,
    h.gdp_hodnota,
    p.prumerna_mzda,
    p.prumerna_cena,
    h.gdp_zmena_procenta,
    p.mzda_zmena_procenta,
    p.cena_zmena_procenta
FROM 
    HDPzmena h
JOIN 
    PlatyAMzdy p ON h.rok = p.rok
ORDER BY 
    p.rok;

  