-- SCHEMA CREATION

DROP TABLE IF EXISTS covid;
CREATE TABLE covid (
    country_region TEXT,
    continent TEXT,
    population DOUBLE PRECISION,
    total_cases INTEGER,
    new_cases DOUBLE PRECISION,
    total_deaths DOUBLE PRECISION,
    new_deaths DOUBLE PRECISION,
    total_recovered DOUBLE PRECISION,
    new_recovered DOUBLE PRECISION,
    active_cases DOUBLE PRECISION,
    serious_critical DOUBLE PRECISION,
    tot_cases_per_million DOUBLE PRECISION,
    deaths_per_million DOUBLE PRECISION,
    total_tests DOUBLE PRECISION,
    tests_per_million DOUBLE PRECISION,
    who_region TEXT,
    iso_alpha TEXT
);



-- CREATE TABLE covid_grouped(
-- 	date date,
--   	country_region VARCHAR(50),
--     confirmed INT,
--     deaths INT, 
--     recovered INT, 
--     active INT, 
--     new_cases  INT, 
--     new_deaths  INT,
--     new_recovered INT,
--     who_Region  VARCHAR(50),
--     iso_alpha  VARCHAR(10)
-- )