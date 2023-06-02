use [Question 3 ]
---Query 1 
SELECT CONCAT(Operating_Airline_IATA_Code,' ', Published_Airline_IATA_Code ) AS IATA_Code ,Published_Airline_IATA_Code, Operating_Airline_IATA_Code
FROM dbo.Air_Traffic_Passenger_Statistics 
WHERE GEO_Summary = 'International' 

---Query 2
SELECT SUM( convert (int,Passenger_Count) ) AS Sum_Of_Passengers
FROM dbo.Air_Traffic_Passenger_Statistics
WHERE GEO_Region = 'Canada' 

--- Query 3 
SELECT * FROM dbo.Air_Traffic_Passenger_Statistics 
WHERE convert (int,Passenger_Count) >= 8000 and convert (int,Passenger_Count) <= 9000 

--- Query 4 
SELECT DISTINCT Operating_Airline FROM dbo.Air_Traffic_Passenger_Statistics
WHERE Operating_Airline LIKE '%Airline%'

--- Query 5
SELECT (SELECT  SUM( convert (int,Passenger_Count) ) AS s1 FROM dbo.Air_Traffic_Passenger_Statistics
WHERE Price_Category_Code = 'Other') - (SELECT SUM( convert (int,Passenger_Count) ) AS s2 FROM dbo.Air_Traffic_Passenger_Statistics
WHERE Price_Category_Code = 'Low Fare')  AS Final  

---Query 6 
SELECT * 
FROM dbo.Air_Traffic_Passenger_Statistics
WHERE convert (int,Passenger_Count) < (SELECT AVG(convert (int,Passenger_Count)) FROM dbo.Air_Traffic_Passenger_Statistics)