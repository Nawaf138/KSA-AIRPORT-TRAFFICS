Aviation Traffic Dashboard for Saudi Ground Services (SGS)


Business Problem
SGS handles millions of flights and passengers annually, but inconsistencies in raw data (e.g., duplicate destinations, invalid airport codes, missing passenger counts) made it difficult to analyze trends and performance. The goal was to clean the data, validate destinations using IATA codes, and build a dashboard that supports operational decisions and strategic planning.

<img width="1660" height="935" alt="image" src="https://github.com/user-attachments/assets/2b3adb14-f4ee-40d5-91d6-25d13bdace73" />


Methodology
- The data source was from GACA ( https://gaca.gov.sa/Open-Data/OpenDataLibrary )
- SQL: Cleaned and transformed aviation data in three steps:
- Removed duplicates using ROW_NUMBER()
- Standardized destinations using reference opennav.com & flightaware.com & github.com/lxndrblz/Airports.
- Handled nulls and added status flags for missing/invalid passengers
- Mapped destination codes to country codes using a reference join
- Power BI:
- Built a multi-page dashboard with KPIs, time trends, airport rankings, and destination analysis
- Used DAX to calculate flight growth, percentage changes, and directional indicators (▲ ▼ ▬)
- Designed layout with tabs: Overview, Time Trends, Flights & Destinations

Skills
SQL: CASE statements, window functions, data validation.

Power BI: DAX measures, calculated columns, ETL modeling, multi-page layout, KPI cards.

Data Design: Reference-based cleaning, schema-aware transformations, dashboard UX planning.

Results & Business Recommendation
The dashboard provides SGS with a clear view of flight traffic across time and geography.
- 2M flights and 239M passengers tracked
- 29 airports and 867 destinations analyzed
- Top airports: JED, RUH, DMM
- Top countries: SA, AE, EG
Cleaning the data reduced ambiguity in destination codes and improved join accuracy.
The dashboard now supports strategic decisions and reduces manual reporting time.

Next Steps
- Add slicers for year, flight type, and airport
- Automate data refresh and validation
- Expand dashboard to include airline-level analysis
- Document data quality issues and create alerts for future imports


To see the interactive dashboard use this link :

https://app.powerbi.com/view?r=eyJrIjoiYWEwM2UyYTctNjQ3Yy00ODI3LWJhYTQtMmIyNzIyODE5MTE0IiwidCI6ImI0NTNkOTFiLTZhYzEtNGI2MS1iOGI4LTVlNjVlNDIyMjMzZiIsImMiOjl9
