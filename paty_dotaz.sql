WITH HDPzmena AS (
    SELECT 
        e.`year` AS rok,
        e.GDP AS gdp_value,
        LAG(e.GDP) OVER (ORDER BY e.`year`) AS previous_gdp,
        ROUND(((e.GDP - LAG(e.GDP) OVER (ORDER BY e.`year`)) / LAG(e.GDP) OVER (ORDER BY e.`year`)) * 100, 2) AS gdp_change_percent
    FROM 
        economies e
    WHERE 
        e.country = 'Czech Republic'
),
PlatyAMzdy AS (
    SELECT 
        trzpspf.rok,
        AVG(trzpspf.prumerna_mzda) AS prumerna_mzda,
        AVG(trzpspf.prumerna_cena) AS prumerna_cena,
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
    h.gdp_value,
    h.gdp_change_percent,
    p.prumerna_mzda,
    p.mzda_zmena_procenta,
    p.prumerna_cena,
    p.cena_zmena_procenta
FROM 
    HDPzmena h
JOIN 
    PlatyAMzdy p ON h.rok = p.rok
ORDER BY 
    p.rok;

  