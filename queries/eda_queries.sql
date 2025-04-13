-- BASIC EDA QUERIES

-- Total confirmed cases per country:
SELECT country_region, total_cases FROM covid;

-- Total confirmed cases per continent:
SELECT continent, sum(total_cases) as total_cases
FROM covid
GROUP BY continent
ORDER BY total_cases DESC;

-- Daily global new cases:
SELECT date, sum(new_cases)
FROM covid_grouped
GROUP BY date
ORDER BY date;

-- Top 5 countries with most deaths:
SELECT country_region, max(deaths)
FROM covid_grouped
GROUP BY country_region
ORDER BY max(deaths) DESC
LIMIT 5;

-- Peak new cases in a single day per country:
SELECT country_region, max(new_cases)
FROM covid_grouped
GROUP BY country_region
ORDER BY 2 DESC;

-- Countries with highest cases per million:
SELECT country_region, tot_cases_per_million
FROM covid
ORDER BY tot_cases_per_million DESC
LIMIT 5;


-- Death rate per country:
SELECT country_region,  
       (total_deaths / NULLIF(total_cases, 0)) * 100 AS death_rate
FROM covid
WHERE total_deaths IS NOT NULL AND total_cases > 0
ORDER BY death_rate DESC;

-- Testing rate per country:
SELECT country_region, tests_per_million
FROM covid
WHERE tests_per_million IS NOT NULL
ORDER BY tests_per_million DESC;





