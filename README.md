# Projekt z SQL: Výzkumný Projekt

Tento repozitář obsahuje soubory, které odpovídají na klíčové výzkumné otázky pro Engeto Datovou akademii. Projekt je zaměřen na analýzu trendů v mzdách, cenách základních potravin a jejich vztahu k ekonomickým ukazatelům v České republice.

## Výzkumné Otázky

1. **Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?**
2. **Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?**
3. **Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?**
4. **Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?**
5. **Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?**

## Datové Sady

### Primární Tabulky
- **czechia_payroll**: Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
- **czechia_payroll_calculation**: Číselník kalkulací v tabulce mezd.
- **czechia_payroll_industry_branch**: Číselník odvětví v tabulce mezd.
- **czechia_payroll_unit**: Číselník jednotek hodnot v tabulce mezd.
- **czechia_payroll_value_type**: Číselník typů hodnot v tabulce mezd.
- **czechia_price**: Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
- **czechia_price_category**: Číselník kategorií potravin, které se vyskytují v našem přehledu.

### Číselníky Sdílených Informací o ČR
- **czechia_region**: Číselník krajů České republiky dle normy CZ-NUTS 2.
- **czechia_district**: Číselník okresů České republiky dle normy LAU.

### Dodatečné Tabulky
- **countries**: Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
- **economies**: HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

---

# SQL Project: Research Project

This repository contains files that answer key research questions for the Engeto Data Academy. The project focuses on analyzing trends in wages, prices of essential goods, and their relationship to economic indicators in the Czech Republic.

## Research Questions

1. **Do wages increase across all sectors over the years, or do some sectors experience a decline?**
2. **How many liters of milk and kilograms of bread can be purchased in the first and last comparable periods based on the available wage and price data?**
3. **Which category of food has the slowest price increase (i.e., the lowest percentage of year-on-year growth)?**
4. **Is there a year where the year-on-year increase in food prices significantly exceeded the growth in wages (by more than 10%)?**
5. **Does GDP influence wage and food price changes? In other words, if GDP rises significantly in a year, is there a noticeable corresponding increase in wages or food prices in the same or following year?**

## Data Sources

### Primary Tables
- **czechia_payroll**: Information on wages in various sectors over multiple years. Data sourced from the Open Data Portal of the Czech Republic.
- **czechia_payroll_calculation**: Lookup table for payroll calculations.
- **czechia_payroll_industry_branch**: Lookup table for industries in the payroll dataset.
- **czechia_payroll_unit**: Lookup table for unit values in the payroll dataset.
- **czechia_payroll_value_type**: Lookup table for value types in the payroll dataset.
- **czechia_price**: Information on the prices of selected foods over multiple years. Data sourced from the Open Data Portal of the Czech Republic.
- **czechia_price_category**: Lookup table for food categories included in our overview.

### Reference Tables for Czech Republic Data
- **czechia_region**: Lookup table for regions of the Czech Republic according to the CZ-NUTS 2 standard.
- **czechia_district**: Lookup table for districts of the Czech Republic according to the LAU standard.

### Additional Tables
- **countries**: Information about countries worldwide, such as capital cities, currencies, national dishes, or average population heights.
- **economies**: GDP, GINI index, tax burden, etc., for various countries and years.

