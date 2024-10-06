# Projekt z SQL: Výzkumný Projekt / SQL Project: Research Project

Tento repozitář obsahuje soubory, které odpovídají na klíčové výzkumné otázky pro Engeto Datovou akademii. Projekt je zaměřen na analýzu trendů v mzdách, cenách základních potravin a jejich vztahu k ekonomickým ukazatelům v České republice.

This repository contains files that answer key research questions for the Engeto Data Academy. The project focuses on analyzing trends in wages, prices of essential goods, and their relationship to economic indicators in the Czech Republic.

## Výzkumné Otázky / Research Questions

1. **Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?**
   **Do wages increase across all sectors over the years, or do some sectors experience a decline?**

2. **Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?**
   **How many liters of milk and kilograms of bread can be purchased in the first and last comparable periods based on the available wage and price data?**

3. **Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?**
   **Which category of food has the slowest price increase (i.e., the lowest percentage of year-on-year growth)?**

4. **Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?**
   **Is there a year where the year-on-year increase in food prices significantly exceeded the growth in wages (by more than 10%)?**

5. **Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?**
   **Does GDP influence wage and food price changes? In other words, if GDP rises significantly in a year, is there a noticeable corresponding increase in wages or food prices in the same or following year?**

## Datové Sady / Data Sources

### Primární Tabulky / Primary Tables
- **czechia_payroll**: Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.  
  **Information on wages in various sectors over multiple years. Data sourced from the Open Data Portal of the Czech Republic.**

- **czechia_payroll_calculation**: Číselník kalkulací v tabulce mezd.  
  **Lookup table for payroll calculations.**

- **czechia_payroll_industry_branch**: Číselník odvětví v tabulce mezd.  
  **Lookup table for industries in the payroll dataset.**

- **czechia_payroll_unit**: Číselník jednotek hodnot v tabulce mezd.  
  **Lookup table for unit values in the payroll dataset.**

- **czechia_payroll_value_type**: Číselník typů hodnot v tabulce mezd.  
  **Lookup table for value types in the payroll dataset.**

- **czechia_price**: Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.  
  **Information on the prices of selected foods over multiple years. Data sourced from the Open Data Portal of the Czech Republic.**

- **czechia_price_category**: Číselník kategorií potravin, které se vyskytují v našem přehledu.  
  **Lookup table for food categories included in our overview.**

### Číselníky Sdílených Informací o ČR / Reference Tables for Czech Republic Data
- **czechia_region**: Číselník krajů České republiky dle normy CZ-NUTS 2.  
  **Lookup table for regions of the Czech Republic according to the CZ-NUTS 2 standard.**

- **czechia_district**: Číselník okresů České republiky dle normy LAU.  
  **Lookup table for districts of the Czech Republic according to the LAU standard.**

### Dodatečné Tabulky / Additional Tables
- **countries**: Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.  
  **Information about countries worldwide, such as capital cities, currencies, national dishes, or average population heights.**

- **economies**: HDP, GINI, daňová zátěž, atd. pro daný stát a rok.  
  **GDP, GINI index, tax burden, etc., for various countries and years.**

---

Prozkoumejte data a kód v tomto repozitáři, abyste odpověděli na tyto otázky a získali přehled o ekonomických trendech v České republice.  
Feel free to explore the data and code in this repository to answer these questions and gain insights into the economic trends in the Czech Republic.
