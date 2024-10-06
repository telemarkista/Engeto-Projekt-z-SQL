-- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
-- Pro zjištění, která kategorie potravin zdražuje nejpomaleji jsme nejprce vypočítal meziroční rozdíl ceny pomocí LAG a dopočetl procenta. 
-- Pro odpovězení na otázku jsem výsledky seřadil podle procentuálního rozdílu. Na otázku nelze odpověď, že nějaká kategorie " meziročně zdražuje nejpomaleji", protože v datovém setu se nachází i kategorie, které měli pokles ceny. Datový set neobsahuje
-- informace o ceně Jakostního bílého vína pro celé období 2006-2018 ale pouze 2015-1018
WITH Rocni_souhrn AS (
    SELECT 
        potraviny_kategorie,
        rok,
        prumerna_cena,
        LAG(prumerna_cena) OVER (PARTITION BY potraviny_kategorie ORDER BY rok ASC) AS predchozi_cena
    FROM 
        t_robert_zunt_project_sql_primary_final
)
SELECT 
    potraviny_kategorie,
    rok,
    prumerna_cena,
    predchozi_cena,
    CASE 
        WHEN predchozi_cena IS NOT NULL THEN ROUND(((prumerna_cena - predchozi_cena) / predchozi_cena) * 100, 2)
        ELSE NULL
    END AS procentualni_rozdil
FROM 
    Rocni_souhrn
WHERE 
rok > 2006
GROUP BY
	potraviny_kategorie,
	rok
ORDER BY 
   	procentualni_rozdil DESC
   	
   	

