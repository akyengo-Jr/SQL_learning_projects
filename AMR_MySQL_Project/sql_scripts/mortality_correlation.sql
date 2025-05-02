SELECT  
  bacterial_species,  
  antibiotic,  
  (SUM((resistance_rate - avg_res) * (mortality_rate - avg_mort)) /  
   (COUNT(*) * STDDEV_POP(resistance_rate) * STDDEV_POP(mortality_rate)))  
   AS pearson_correlation  
FROM amr_data  
CROSS JOIN (  
  SELECT  
    AVG(resistance_rate) AS avg_res,  
    AVG(mortality_rate) AS avg_mort  
  FROM amr_data  
) AS avg_values  
GROUP BY bacterial_species, antibiotic;  