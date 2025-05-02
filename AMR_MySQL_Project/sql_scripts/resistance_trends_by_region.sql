WITH resistance_by_region AS (  
  SELECT  
    region,  
    bacterial_species,  
    year,  
    AVG(resistance_rate) AS avg_resistance  
  FROM amr_data  
  WHERE year BETWEEN 2020 AND 2023  
  GROUP BY region, bacterial_species, year  
)  
SELECT * FROM resistance_by_region  
ORDER BY avg_resistance DESC;  