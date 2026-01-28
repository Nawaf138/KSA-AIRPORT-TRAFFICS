# Saudi Aviation Traffic Analysis

## Executive Summary

This project provides a comprehensive analysis of aviation traffic across Saudi Arabia's airports using SQL and Power BI technologies. The dashboard background was designed using Figma to ensure an integrated and user-friendly visual experience. The project focused on cleaning and standardizing raw flight data, enriching it with country codes, and designing key performance indicators that support accurate and effective operational decision-making. The final dashboard displays flight volumes, passenger trends, airport rankings, and international connectivity.

## Business Problem

Saudi Ground Services and the General Authority of Civil Aviation faced challenges in obtaining unified and clean data to monitor flight operations across 29 airports and 867 destinations. The raw data included inconsistencies in airport codes, missing passenger values, and unclear destination labels, negatively impacting the reliability of operational insights.

<img width="674" height="378" alt="image" src="https://github.com/user-attachments/assets/0469e6d8-2b4c-4c49-872d-3a6d35f4a29a" />


## Methodology

### SQL: Used for data cleaning, standardization, and enrichment through:

Removing duplicates using window functions like ROW_NUMBER()

Standardizing destination codes using CASE logic and IATA references

Classifying missing or invalid passenger values

Deleting unresolved or ambiguous records

Enriching data by adding country codes from external reference tables

### Power BI: For building the dashboard with:

Visualizing monthly flight trends through interactive line charts

Ranking top airports and countries by flight volume

Displaying local versus international distribution using pie charts

Calculating KPIs such as total flights, passenger counts, number of airports, and destinations

## Skills Demonstrated

SQL: CASE logic, window functions, data quality checks, enrichment

Power BI: ETL processes, advanced DAX measures, KPI design, dashboard layout and design

Data Analysis: Aviation traffic classification, anomaly detection, accurate code mapping

## Why CASE and Reference Joins Were Used

CASE logic was essential to unify ICAO codes and airport names into accurate and reliable IATA destinations.

Reference joins with the CODE_REF table ensured retention of only valid airport codes and enriched them with country data, enhancing analysis accuracy.


## Key Dashboard Results:

- Total Flights: 2 million ▲10.9%

- Total Passengers: 239 million ▲15.0%

- Top Airports: Jeddah (550K), Riyadh (508K)

- Top Countries: Saudi Arabia (848K), UAE (146K), Egypt (145K)

- Local vs. International Distribution: 49% vs. 51%


## Next Steps

- Add airport capacity and delay metrics for more precise operational performance analysis.

- Segment aviation traffic by aircraft type and airlines to identify improvement opportunities.

- Incorporate weather and seasonal factors into trend analysis models to enhance forecast accuracy.

- Explore AI capabilities for data analysis and smart operational recommendations.
