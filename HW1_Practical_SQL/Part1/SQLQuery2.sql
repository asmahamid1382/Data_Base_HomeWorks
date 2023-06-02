use [Movies ]
SELECT * FROM dbo.Movies
--Query 1 :
SELECT rank,name  ,tagline, writers ,directors  FROM dbo.Movies 
WHERE directors = 'Christopher Nolan' or 'Christopher Nolan' IN (SELECT value FROM STRING_SPLIT(writers , ','))

----Query 2 :
SELECT name , rating ,directors,year   FROM dbo.Movies WHERE year>='2010' and year<='2017'   ORDER BY rating DESC

--- Query 3 :
SELECT ROUND(SUM(rating)/COUNT(rating),2) AS Average  FROM dbo.Movies 
WHERE 'Leonardo DiCaprio' IN (SELECT value FROM STRING_SPLIT(casts , ',')) 

--- Query 4 :
SELECT TOP(10) rank,name,rating,directors  FROM dbo.Movies
WHERE  year <= 1999 and year >= 1990 
ORDER BY box_office DESC 

--- Query 5 :
SELECT name, rating, directors, run_time 
FROM (SELECT * FROM dbo.Movies WHERE casts like '%Robert De Niro%') AS M WHERE M.casts like  '%Al Pacino%'
--- Query 6 :
SELECT name, directors FROM dbo.Movies WHERE   year <= 2010 and 2000 <= year and genre like  '%Drama%'
INTERSECT
SELECT name, directors FROM dbo.Movies WHERE   year <= 2005 and 1995 <= year and genre like  '%Crime%'

--- Query 7 :
SELECT name, budget FROM dbo.Movies
WHERE name NOT IN (SELECT TOP 50 name FROM dbo.Movies ORDER BY TRY_CAST(box_office AS BIGINT) DESC) ORDER BY TRY_CAST(budget AS BIGINT) DESC;

