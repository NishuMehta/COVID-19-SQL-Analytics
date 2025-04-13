-- ANALYSIS QUERIES

-- 1. Global totals (cases, deaths, recoveries)
SELECT 
	SUM(total_cases) AS Total_Cases,
	SUM(total_deaths) AS Total_Deaths,
	SUM(total_recovered) AS Total_Recoveries
FROM covid;

-- 2. Countries with highest active cases
SELECT 
	country_region, 
	SUM(active_cases) AS Active_Cases
FROM covid
WHERE Active_Cases > 0
GROUP BY country_region
ORDER BY Active_Cases DESC;

-- 3. Case Fatality Rate (CFR) by country
SELECT
	country_region,
	(total_deaths/ total_cases)*100 AS Fatality_Rate
From covid
WHERE total_cases > 0
ORDER BY 2 DESC;

-- 4. Recovery rate vs. death rate
SELECT 
	country_region,
	(total_recovered/ total_cases)*100 AS "Recovery Rates",
	(total_deaths/ total_cases)*100 AS "Death Rates"
FROM covid
WHERE total_cases > 0;
	
-- 5. Daily new cases globally
SELECT
	date,
	SUM(new_cases)
FROM covid_grouped
GROUP BY date
ORDER BY date;

-- 6. Weekly avg. deaths by WHO region
SELECT
	who_region,
	date_trunc('week', date) AS week,
	AVG(new_deaths) AS avg_weekly_deaths
FROM covid_grouped
GROUP BY 1, 2
ORDER BY week;

-- 7. Total cases per WHO region
SELECT 
	who_region,
	sum(total_cases) AS total_cases
FROM covid
GROUP BY who_region;

-- 8. Top 5 countries with highest cases per million
SELECT
	country_region,
	sum(tot_cases_per_million) AS "Cases"
FROM covid
WHERE tot_cases_per_million > 0
GROUP BY country_region
ORDER BY "Cases" DESC
LIMIT 5;

-- 9. Testing rates vs. death rates
SELECT 
	country_region,
	tests_per_million,
	deaths_per_million
From covid
WHERE tests_per_million > 0
ORDER BY 3 DESC;

-- 10. Countries with critical cases > 5% of active cases

SELECT
	country_region,
	serious_critical,
	active_cases,
	(serious_critical/active_cases) * 100 as critical_rate
FROM covid
WHERE active_cases > 0 
	AND (serious_critical/active_cases) > 0.05;

-- 11. 7-day moving avg of new cases (for a country)
SELECT 
	date,
	country_region,
	new_cases,
	AVG(new_cases) OVER (PARTITION BY country_region ORDER BY date ROWS 6 PRECEDING) AS moving_avg_7day
FROM covid_grouped
WHERE country_region = 'Brazil';

-- 12. Month-over-month growth rate
WITH monthly_cases AS (
	SELECT
		DATE_TRUNC('month', date) AS month,
		SUM(new_cases) AS cases
	FROM covid_grouped
	GROUP BY 1
)
SELECT 
	month, cases,
	(cases / LAG(cases) OVER (ORDER BY month) - 1) * 100 AS growth
FROM monthly_cases;
	
-- 13. Countries with missing ISO codes
SELECT country_region
FROM covid
WHERE iso_alpha IS NULL;

-- 14. Days with zero reported data
SELECT 
	date
FROM covid_grouped
WHERE confirmed = 0
	AND deaths = 0;

-- 15. show % of population infected:  
SELECT  
    country_region,  
    total_cases,  
    (total_cases / population) * 100 AS infection_rate  
FROM covid; 


