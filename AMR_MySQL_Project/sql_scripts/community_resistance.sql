SELECT  
  infection_type,  
  ROUND(AVG(resistance_rate), 2) AS avg_resistance,  
  ROUND(AVG(mortality_rate), 2) AS avg_mortality  
FROM amr_data  
GROUP BY infection_type;  