Aviation Traffic Dashboard for Saudi Ground Services (SGS)

Executive Summary
Saudi Ground Services (SGS) needed a reliable dashboard to monitor flight traffic across Saudi airports and destinations. Using SQL and Power BI, I cleaned and standardized aviation data from 2021–2024, built a multi-page dashboard, and visualized key metrics such as flights, passengers, airports, and destinations. The dashboard highlights seasonal patterns, top-performing airports, and geographic distribution of flights. It also includes data quality checks and reference-based corrections to ensure analytical credibility.
Key recommendations for future enhancements:
- Merge airport and destination analysis for better user experience
- Add filters for year, flight type, and airport
- Include data quality indicators for missing or invalid records

Business Problem
SGS handles millions of flights and passengers annually, but inconsistencies in raw data (e.g., duplicate destinations, invalid airport codes, missing passenger counts) made it difficult to analyze trends and performance. The goal was to clean the data, validate destinations using IATA codes, and build a dashboard that supports operational decisions and strategic planning.

Methodology
- SQL: Cleaned and transformed aviation data in three steps:
- Removed duplicates using ROW_NUMBER()
- Standardized destinations using reference tables (IATA, OpenNav, FlightAware)
- Handled nulls and added status flags for missing/invalid passengers
- Mapped destination codes to country codes using a reference join
- Power BI:
- Built a multi-page dashboard with KPIs, time trends, airport rankings, and destination analysis
- Used DAX to calculate flight growth, percentage changes, and directional indicators (▲ ▼ ▬)
- Designed layout with tabs: Overview, Time Trends, Flights & Destinations

Skills
SQL: Joins, CTEs, CASE statements, window functions, data validation
Power BI: DAX measures, calculated columns, ETL modeling, multi-page layout, KPI cards
Data Design: Reference-based cleaning, schema-aware transformations, dashboard UX planning

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
