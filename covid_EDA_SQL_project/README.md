# COVID-19 Data Analysis with SQL

![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue)
![Data Analysis](https://img.shields.io/badge/Data-Analysis-brightgreen)
![SQL](https://img.shields.io/badge/SQL-Advanced-orange)

A comprehensive SQL project analyzing COVID-19 data, demonstrating advanced query techniques and data exploration skills.

## 📊 Project Overview

This project explores global COVID-19 data through a series of analytical SQL queries, focusing on:
- Infection and death rates
- Vaccination progress
- Country and continent-level comparisons
- Time-series analysis

## 🛠️ Technical Skills Demonstrated

### SQL Techniques
| Skill | Example Queries |
|-------|-----------------|
| **Joins** | Combining death and vaccination data |
| **CTEs** | `WITH PopVsVac` for vaccination analysis |
| **Window Functions** | Rolling vaccination calculations |
| **Temp Tables** | PercentPopulationVaccinated table |
| **Aggregate Functions** | MAX, SUM, GROUP BY |
| **Views** | Creating reusable data perspectives |
| **Data Conversion** | CAST for accurate calculations |

### Analytical Methods
- Case fatality rate calculation
- Population-adjusted metrics
- Cumulative sum calculations
- Comparative analysis by geography

## 📂 Query Categories

1. **Basic Exploration**
   - Initial data selection
   - Sorting and filtering

2. **Mortality Analysis**
   - Death percentage calculations
   - Country/continent death comparisons

3. **Infection Patterns**
   - Population infection rates
   - Highest infection countries

4. **Vaccination Progress**
   - CTE-based vaccination analysis
   - Temporary table implementation
   - View creation for visualization

## 🚀 How to Use

1. **Database Setup**
   - Ensure MySQL 8.0+ is installed
   - Create the `PortfolioProject` database
   - Import CovidDeaths and CovidVaccinations tables

2. **Running Queries**
   ```sql
   -- Execute individual queries in MySQL Workbench
   -- Example: Run vaccination analysis
   SELECT * FROM PercentPopulationVaccinated;
   ```

3. **Visualization Preparation**
   - Use the created views as data sources
   - Export query results for dashboarding

## 🔍 Key Insights Generated

1. **Fatality Trends**
   ```sql
   -- Likelihood of dying if infected in specific countries
   SELECT location, date, DeathPercentage 
   FROM DeathRatesView
   WHERE location LIKE '%States%';
   ```

2. **Vaccination Progress**
   ```sql
   -- Daily vaccination rates with cumulative totals
   SELECT date, location, VaccinationPercentage
   FROM PercentPopulationVaccinated
   ORDER BY VaccinationPercentage DESC;
   ```

3. **Geographic Comparisons**
   ```sql
   -- Continent-level death counts
   SELECT continent, TotalDeathCount
   FROM ContinentDeathView;
   ```

## 🔮 Future Enhancements

### Planned Features
| Feature | Status | Technology |
|---------|--------|------------|
| Automated data refresh | Planned | Python + Cron |
| Parameterized reports | In Progress | Stored Procedures |
| Advanced forecasting | Backlog | Time-series SQL |

### Roadmap
1. **Data Pipeline**
   - Set up automated ETL process
   - Add data validation checks

2. **Advanced Analytics**
   - Implement growth rate calculations
   - Add vaccination efficacy metrics

3. **Visualization**
   - Connect to Tableau/Power BI
   - Build interactive dashboards

## 📊 Sample Output

```plaintext
| location       | date       | total_cases | total_deaths | DeathPercentage |
|----------------|------------|-------------|--------------|-----------------|
| United States  | 2023-01-01 | 50000       | 1200         | 2.40            |
| United States  | 2023-01-02 | 55000       | 1250         | 2.27            |
```

## 💡 Learning Outcomes

- Advanced SQL query construction
- Data analysis techniques for epidemiology
- Query optimization strategies
- Data preparation for visualization
- Temporary data storage methods

## 📄 License

MIT License - Free for educational and portfolio use

---

*"In God we trust, all others must bring data." - W. Edwards Deming*  
*This project transforms raw COVID data into actionable insights*
