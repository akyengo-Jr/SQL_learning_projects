-- COVID-19 Data Exploration (MySQL Compatible)
-- Skills Demonstrated: Joins, CTEs, Temp Tables, Window Functions, Aggregate Functions, Views, Data Type Conversion

-- Select Initial Data
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY location, date;


-- Calculate Death Percentage (Likelihood of Dying if Infected)
SELECT 
    location, 
    date, 
    total_cases, 
    total_deaths, 
    (CAST(total_deaths AS DECIMAL) / total_cases) * 100 AS DeathPercentage
FROM PortfolioProject.CovidDeaths
WHERE location LIKE '%States%'
AND continent IS NOT NULL
ORDER BY location, date;


-- Calculate Infection Rate (Percentage of Population Infected)
SELECT 
    location, 
    date, 
    population, 
    total_cases, 
    (CAST(total_cases AS DECIMAL) / population) * 100 AS PercentPopulationInfected
FROM PortfolioProject.CovidDeaths
ORDER BY location, date;


-- Countries with Highest Infection Rates
SELECT 
    location, 
    population, 
    MAX(total_cases) AS HighestInfectionCount, 
    MAX((CAST(total_cases AS DECIMAL) / population)) * 100 AS PercentPopulationInfected
FROM PortfolioProject.CovidDeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC;


-- Countries with Highest Death Counts
SELECT 
    location, 
    MAX(CAST(total_deaths AS UNSIGNED)) AS TotalDeathCount
FROM PortfolioProject.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC;


-- Continents with Highest Death Counts
SELECT 
    continent, 
    MAX(CAST(total_deaths AS UNSIGNED)) AS TotalDeathCount
FROM PortfolioProject.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;


-- Global Death Percentage
SELECT 
    SUM(new_cases) AS total_cases, 
    SUM(CAST(new_deaths AS UNSIGNED)) AS total_deaths, 
    (SUM(CAST(new_deaths AS DECIMAL)) / SUM(new_cases)) * 100 AS DeathPercentage
FROM PortfolioProject.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY total_cases, total_deaths;


-- Population vs Vaccinations (Using CTE)
WITH PopVsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated) AS (
    SELECT 
        dea.continent, 
        dea.location, 
        dea.date, 
        dea.population, 
        vac.new_vaccinations,
        SUM(CAST(vac.new_vaccinations AS UNSIGNED)) OVER (
            PARTITION BY dea.location 
            ORDER BY dea.location, dea.date
        ) AS RollingPeopleVaccinated
    FROM PortfolioProject.CovidDeaths dea
    JOIN PortfolioProject.CovidVaccinations vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
)
SELECT *, (RollingPeopleVaccinated / population) * 100 AS VaccinationPercentage
FROM PopVsVac;


-- Population vs Vaccinations (Using Temp Table)
DROP TEMPORARY TABLE IF EXISTS PercentPopulationVaccinated;
CREATE TEMPORARY TABLE PercentPopulationVaccinated (
    continent VARCHAR(255),
    location VARCHAR(255),
    date DATETIME,
    population DECIMAL,
    new_vaccinations DECIMAL,
    RollingPeopleVaccinated DECIMAL
);

INSERT INTO PercentPopulationVaccinated
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations AS UNSIGNED)) OVER (
        PARTITION BY dea.location 
        ORDER BY dea.location, dea.date
    ) AS RollingPeopleVaccinated
FROM PortfolioProject.CovidDeaths dea
JOIN PortfolioProject.CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date;

SELECT *, (RollingPeopleVaccinated / population) * 100 AS VaccinationPercentage
FROM PercentPopulationVaccinated;


-- Create View for Later Visualizations
CREATE VIEW PercentPopulationVaccinated AS
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations AS UNSIGNED)) OVER (
        PARTITION BY dea.location 
        ORDER BY dea.location, dea.date
    ) AS RollingPeopleVaccinated
FROM PortfolioProject.CovidDeaths dea
JOIN PortfolioProject.CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL;