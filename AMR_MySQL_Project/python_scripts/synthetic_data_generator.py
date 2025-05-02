import csv
import random
from faker import Faker
from datetime import datetime

fake = Faker()

# Define parameters
NUM_ROWS = 3000  # Adjust to 1000-5000 as needed
OUTPUT_FILE = "synthetic_amr_data.csv"

# Countries and regions (weighted for realism)
COUNTRIES = {
    "India": "Southeast Asia",
    "Nigeria": "Africa",
    "USA": "North America",
    "Germany": "Europe",
    "Brazil": "South America",
    "Japan": "East Asia",
    "Australia": "Oceania",
    "South Africa": "Africa",
    "France": "Europe",
    "China": "East Asia"
}

BACTERIA_SPECIES = [
    "Escherichia coli", 
    "Klebsiella pneumoniae", 
    "Staphylococcus aureus",
    "Pseudomonas aeruginosa",
    "Acinetobacter baumannii"
]

ANTIBIOTICS = [
    "Meropenem", 
    "Ceftriaxone", 
    "Ciprofloxacin", 
    "Vancomycin",
    "Amoxicillin"
]

# Resistance/mortality rate logic
def generate_rates(country, bacteria, antibiotic, year):
    # Base resistance rates (higher in regions with limited healthcare access)
    base_resistance = {
        "Southeast Asia": random.uniform(30, 70),
        "Africa": random.uniform(25, 65),
        "North America": random.uniform(5, 25),
        "Europe": random.uniform(10, 30),
        "South America": random.uniform(20, 50),
        "East Asia": random.uniform(15, 40),
        "Oceania": random.uniform(5, 20)
    }[COUNTRIES[country]]
    
    # Trend: Resistance increases 1-3% per year
    year_factor = (year - 2018) * random.uniform(1, 3)
    resistance = min(95, base_resistance + year_factor)  # Cap at 95%
    
    # Mortality rate (0.5% to 20%, loosely correlated with resistance)
    mortality = resistance * 0.2 + random.uniform(-5, 5)
    mortality = max(0.5, min(20, mortality))
    
    return round(resistance, 1), round(mortality, 1)

# Generate data
with open(OUTPUT_FILE, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow([
        "report_id", "country", "region", "bacterial_species", 
        "antibiotic", "year", "resistance_rate", "mortality_rate", 
        "infection_type", "sample_size"
    ])
    
    for report_id in range(1, NUM_ROWS + 1):
        country = random.choice(list(COUNTRIES.keys()))
        region = COUNTRIES[country]
        bacteria = random.choice(BACTERIA_SPECIES)
        antibiotic = random.choice(ANTIBIOTICS)
        year = random.randint(2018, 2023)
        resistance, mortality = generate_rates(country, bacteria, antibiotic, year)
        
        # Hospital-acquired infections are 60% of cases in developing regions
        if region in ["Southeast Asia", "Africa"]:
            infection_type = "hospital" if random.random() < 0.6 else "community"
        else:
            infection_type = "hospital" if random.random() < 0.4 else "community"
            
        sample_size = random.choice([100, 150, 200, 250, 300])
        
        writer.writerow([
            report_id, country, region, bacteria, antibiotic, year,
            resistance, mortality, infection_type, sample_size
        ])

print(f"Generated {NUM_ROWS} rows in {OUTPUT_FILE}")