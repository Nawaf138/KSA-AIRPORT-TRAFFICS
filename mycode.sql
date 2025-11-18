/* 

THIS DATA CLEANING WILL BE IN THREE STEPS

	1- Remove the Duplicates.
	2- Standardize the data.
	3- Handel the null and blank values.
	4- ADDING EXTRA CUL AS NEEDED.

*/

-- first i will create a backup table just in case.
CREATE TABLE airport_traffics_v04
AS
SELECT *
FROM airport_traffics
WHERE 1 = 0;

select 
	count(*)
from
	airport_traffics_v04


-- STEP 1. CHECKING THE Duplicates...

select *
from (
	select 
		*,
		Row_number() over ( PARTITION By "Year", "Month", "Airport", "Destinations" ,
		"Arrival/Departure", "Domestic/International" , "Flights", "Passengers" ) as RN
	from airport_traffics_v04 ) as RN_SUP 
WHERE RN > 1 ;

-- THE IS NO Duplicates IN THIS DATA SET :) 

-- STEP 2. STANDARDIZE THE DATA...
	-- cleaning the Destinations CUL
SELECT 
	"Destinations",
	SUM("Flights") AS total_flights
FROM 
	airport_traffics_v04
WHERE 
	LENGTH("Destinations") >= 4 -- FOR ICAO CODES AND MORE .
GROUP BY 
	"Destinations"
ORDER BY 
	total_flights DESC;

-- WE HAVE 39 DEF_CUL

UPDATE airport_traffics_v04
SET "Destinations" = CASE
	WHEN "Destinations" IN ('OBBI') THEN 'BAH'
	WHEN "Destinations" IN ('OBKH') THEN 'KHB'
	WHEN "Destinations" IN ('OEAO', 'RCU HELIPAD') THEN 'ULH'
	WHEN "Destinations" IN ('OEDR') THEN 'DHA'
	WHEN "Destinations" IN ('OEJN') THEN 'JED'
	WHEN "Destinations" IN ('OEPA') THEN 'AQI'
	WHEN "Destinations" IN ('OERK', 'OETH') THEN 'RUH'
	WHEN "Destinations" IN ('OKKK') THEN 'KWI'
	WHEN "Destinations" IN ('OMAL') THEN 'AAN'
	WHEN "Destinations" IN ('OMDW') THEN 'DWC'
	WHEN "Destinations" IN ('OPIS') THEN 'ISB'
	WHEN "Destinations" IN ('OTBD') THEN 'DIA'
	WHEN "Destinations" IN (
	'WAJIH', 'UMMAHAT', 'Umluj', 'SOUTHEN DUNES N', 'SOUTHEN DUNES',
	'SHEYBARAH HELIPAD', 'SHEYBARAH', 'SHEBARAH','Ummahat Helipad',  'SHEBARH', 'SHEBARAH Helipad',
	'RED SEA COM Helipad'
	) THEN 'RSI'
	ELSE "Destinations"
END;

-- 13 CUL LEFT THAT ARE HOTEL IN MORE THEN ONE CITY SO I WILL DELETE IT .

DELETE FROM airport_traffics_v04
WHERE "Destinations" IS NULL
	OR LENGTH("Destinations") > 3
	OR "Destinations" = '998';
	
--

SELECT 
	DISTINCT "Destinations"
FROM
	airport_traffics_v04
-- 856 CUL
	
SELECT 
	DISTINCT "Destinations"
FROM 
	airport_traffics_v04
WHERE 
	"Destinations" IN (
		SELECT code FROM "CODE_REF"
);
-- 831 CUL.. I'VE 25 DEF_CUL THAT ARE NOT IN IATA CODE LIST OR ANY OF MY REF SO I'LL DELETE IT .

DELETE 
FROM 
	airport_traffics_v04
WHERE 
	"Destinations" NOT IN (
SELECT 
	CODE FROM "CODE_REF"
)


-- MY REF ARE opennav.com & flightaware.com & github.com/lxndrblz/Airports.
-- THE GITHUB DATASET IS  "CODE_REF" THAT HAVE A LIST OF IATA AIRPORT CODE TO COMPARE .
-- IF THE AIRPORT CODE OR CITY NAME HAS PROBLEM I WILL CHANGE IT TO THE CLOSEST AIRPORT .
-- I'LL DELETE EVERY Destinations THAT IS NOT A CITY OR AIRPORT UNLESS THE LOCATION OF IT IS CLEAR .

SELECT 
	DISTINCT "Destinations"
from
	airport_traffics_v04
-- CLEANING Destinations CUL IS DONE .

SELECT
	DISTINCT "Arrival/Departure"
FROM
	airport_traffics_v04

UPDATE airport_traffics_v04
SET "Arrival/Departure" = CASE
	WHEN "Arrival/Departure" IN (' A', 'A', 'ARRIVAL' ) THEN 'Arrival'
	WHEN "Arrival/Departure" IN ('D', 'DEPARTURE') THEN 'Departure'
	ELSE "Arrival/Departure"
END;
-- CLEANING Arrival/Departure CUL IS DONE .


-- STEP 3. Handel the null and blank values.
	-- Count the blank & null values
SELECT
	SUM(CASE WHEN "Year" IS NULL THEN 1 ELSE 0 END) AS blank_Year,
	SUM(CASE WHEN "Month" IS NULL OR "Month" = '' THEN 1 ELSE 0 END) AS blank_Month,
	SUM(CASE WHEN "Airport" IS NULL OR "Airport" = '' THEN 1 ELSE 0 END) AS blank_Airport,
	SUM(CASE WHEN "Destinations" IS NULL OR "Destinations" = '' THEN 1 ELSE 0 END) AS blank_Destinations,
	SUM(CASE WHEN "Arrival/Departure" IS NULL OR "Arrival/Departure" = '' THEN 1 ELSE 0 END) AS blank_arrival_departure,
	SUM(CASE WHEN "Domestic/International" IS NULL OR "Domestic/International" = '' THEN 1 ELSE 0 END) AS blank_domestic_international,
	SUM(CASE WHEN "Flights" IS NULL THEN 1 ELSE 0 END) AS blank_Flights,
	SUM(CASE WHEN "Passengers" IS NULL THEN 1 ELSE 0 END) AS blank_Passengers
FROM airport_traffics_v04;

-- THERE IS 3 NULL Passengers...
-- I'll create new cul with this rols..
--  Passengers is null -> Missing
--  Passengers = 0  ----> Zero
--  Passengers < 0  ----> Invalid

ALTER TABLE airport_traffics_v04 ADD COLUMN passenger_status TEXT;

UPDATE airport_traffics_v04
SET passenger_status = CASE
	WHEN "Passengers" IS NULL THEN 'Missing'
	WHEN "Passengers" = 0 THEN 'Zero'
	WHEN "Passengers" < 0 THEN 'Invalid'
	ELSE 'Valid'
END;

--

select
	*
from
	airport_traffics_v04
where 
	"Airport" = "Destinations"
	-- EX. FLIGHT GO FROM JED TO JED !
-- THERE IS 599 ROW AND CUZ I CAN'T CONNTECT WITH ANY OF THE DATA ENG TO FIX IT I WILL DELETE IT .

DELETE
	FROM
		airport_traffics_v04
	WHERE
		"Airport" = "Destinations";

-- EXTRA STEP.. CREATE NEW CUL FOR THE COUNTRY,
-- I WILL COPY THE COUNTRY CODE FROM CODE_REF TABLE BASED ON Destinations CUL ON MY DATASET.
ALTER 
	TABLE 
		airport_traffics_v04
	ADD COLUMN 
		country_code TEXT;

UPDATE 
	airport_traffics_v04 AS traffic
	SET 
		country_code = iata_code.country
	FROM 
		"CODE_REF" AS iata_code
	WHERE 
		traffic."Destinations" = iata_code.code;

-- THE DATA CLEANING IS DONE ON SQL 
-- NOW I WILL MOVE THE DATA INTO POWER BI   