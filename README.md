# COVID-19 Data Analytics
*A SQL-powered analytics project with interactive Power BI visualizations.*  
Exploring global COVID-19 trends, mortality rates, and regional comparisons using PostgreSQL.

## 📌 Overview  
This project analyzes global COVID-19 data using **PostgreSQL** for advanced queries and **Power BI** for dynamic dashboards. Key features:  
- **15+ SQL queries** covering trends, mortality rates, and regional comparisons.  
- **Interactive Power BI dashboard** with filters (date, country, WHO region).  
- **KPIs**: Fatality rates, testing coverage, and moving averages.  

## 🛠️ Technologies  
- **SQL**: PostgreSQL (Window functions, CTEs, aggregations).  
- **Visualization**: Power BI (Drill-downs, slicers, tooltips).  
- **Data Sources**: [covid.csv](https://media.geeksforgeeks.org/wp-content/cdn-uploads/20210903231151/covid.csv),
                    [covid_grouped.csv](https://media.geeksforgeeks.org/wp-content/cdn-uploads/20210903231231/covid_grouped.csv)  

## 📂 **Dataset Schema**
### Table 1: `covid`
```sql
CREATE TABLE covid (
    country_region TEXT,
    continent TEXT,
    population DOUBLE PRECISION,
    -- ... (other columns)
);
```
### Table 2: `covid_grouped`
```sql
CREATE TABLE covid_grouped (
    date DATE,
    country_region VARCHAR(50),
    confirmed INT,
    -- ... (other columns)
);
```
