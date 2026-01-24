Dashboard for KSA Airport Traffic - Saudi Ground Services (SGS)


Business Problem
SGS handles millions of flights and passengers annually, but inconsistencies in raw data (e.g., duplicate destinations, invalid airport codes, missing passenger counts) made it difficult to analyze trends and performance. The goal was to clean the data, validate destinations using IATA codes, and build a dashboard that supports operational decisions and strategic planning.

"UPDATE 18/11/2025 -> THIS IS ONLY ONE PAGE REPORT" 
<img width="674" height="378" alt="image" src="https://github.com/user-attachments/assets/f29c0f61-4cdf-43e5-8e5f-e517df692d2c" />


Methodology
- The data source was from GACA ( https://gaca.gov.sa/Open-Data/OpenDataLibrary )
- SQL: Cleaned and transformed aviation data in three steps:
- Removed duplicates using ROW_NUMBER()
- Standardized destinations using reference opennav.com & flightaware.com & github.com/lxndrblz/Airports.
- Handled nulls and added status flags for missing/invalid passengers
- Mapped destination codes to country codes using a github reference dataset
- Power BI:
- Built a multi-page dashboard with KPIs, time trends, airport rankings, and destination analysis
- Used DAX to calculate flight growth, percentage changes, and directional indicators (▲ ▼ ▬)
- Designed layout with tabs: Overview, Time Trends, Flights & Destinations

Skills
SQL: CASE statements, window functions, data validation.

Power BI: DAX measures, calculated columns, ETL modeling, multi-page layout, KPI cards.

Data Design: Reference-based cleaning, schema-aware transformations, dashboard UX planning.

Results:
The dashboard provides SGS with a clear view of flight traffic.
- 1.7M flights and 239M passengers tracked
- 29 airports and 867 destinations analyzed
- Top airports: JED, RUH, DMM
- Top countries: SA, AE, EG



Next Steps
- Complete the other two pages.
- Document data quality issues and create alerts for future imports.


To see the interactive Dashboard use this link :

https://app.powerbi.com/view?r=eyJrIjoiYWEwM2UyYTctNjQ3Yy00ODI3LWJhYTQtMmIyNzIyODE5MTE0IiwidCI6ImI0NTNkOTFiLTZhYzEtNGI2MS1iOGI4LTVlNjVlNDIyMjMzZiIsImMiOjl9

NAWAF ALJADAANI.
15041436.
