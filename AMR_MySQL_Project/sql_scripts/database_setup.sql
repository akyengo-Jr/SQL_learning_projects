CREATE TABLE amr_data (  
  report_id INT PRIMARY KEY,  
  country VARCHAR(50),  
  region VARCHAR(50),  
  bacterial_species VARCHAR(100),  
  antibiotic VARCHAR(50),  
  year INT,  
  resistance_rate FLOAT,  
  mortality_rate FLOAT,  
  infection_type ENUM('hospital', 'community'),  
  sample_size INT  
);  