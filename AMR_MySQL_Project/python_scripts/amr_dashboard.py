import mysql.connector  
import pandas as pd  
import plotly.express as px  

db = mysql.connector.connect(  
  host="localhost",  
  user="root",  
  password="database",  
  database="amr_db"  
)  

query = "SELECT * FROM amr_data;"  
df = pd.read_sql(query, db)  


# Resistance trends by country (2020-2023)  
fig = px.line(  
  df[df['year'].between(2020, 2023)],  
  x='year',  
  y='resistance_rate',  
  color='country',  
  title='AMR Trends by Country (2020-2023)'  
)  
fig.show()  

# Hospital vs. community mortality  
hospital_df = df.groupby('infection_type').mean().reset_index()  
fig = px.bar(  
  hospital_df,  
  x='infection_type',  
  y='mortality_rate',  
  title='Mortality Rate by Infection Type'  
)  
fig.show()  
