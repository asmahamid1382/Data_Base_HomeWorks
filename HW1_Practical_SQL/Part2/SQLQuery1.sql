use [Question 2 ]
--SELECT *  FROM dbo.chatgpt
---QUERY 1 
SELECT language,COUNT(language) AS cnt  FROM dbo.chatgpt GROUP BY language

--- Query 2 
SELECT TOP(10)
Username AS username ,replycount AS replysum ,retweetcount AS retweetsum ,likecount AS likesum ,quotecount AS quotesum ,
(convert (int,replycount)+convert (int,retweetcount)+convert (int,likecount)+convert (int,quotecount)) AS Total
FROM dbo.chatgpt ORDER BY Total DESC 

 --- Query 3 
 SELECT DISTINCT username, COUNT(language) AS cnt FROM dbo.chatgpt
GROUP BY username HAVING COUNT(language) > 1 ORDER BY cnt DESC

--- Query 4
SELECT 
LEFT(RIGHT(Source, LEN(Source) - CHARINDEX('>', Source)), CHARINDEX('<', RIGHT(Source, LEN(Source) - CHARINDEX('>', Source) - 1))) AS Source,
COUNT(Tweet_Id) AS cnt
FROM dbo.chatgpt GROUP BY Source ORDER BY cnt DESC;
--- Query 5 
SELECT TRIM(value) AS h, COUNT(Tweet_Id) AS cnt FROM dbo.chatgpt CROSS APPLY STRING_SPLIT(TRANSLATE(hashtag, '[]''', '   '), ',')
GROUP BY value HAVING value != '' ORDER BY cnt DESC;

