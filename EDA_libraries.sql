/* EDA (libraries.pls_fy2018_libraries)*/

/*Counting Rows*/

SELECT COUNT(*),COUNT(phone),COUNT(Distinct libname)
FROM libraries.pls_fy2018_libraries

/*Counting Rows by State*/

SELECT stabr,COUNT(Distinct libname) as libraries
FROM libraries.pls_fy2018_libraries
GROUP BY stabr

SELECT COUNT(*) 
FROM pls_fy2018_libraries 
WHERE libname IS NULL;

/*Finding Maximun and Minimun,AVG,SUM by State*/

SELECT stabr,
       FORMAT(MAX(visits), 0) AS max_visits, 
       FORMAT(MIN(visits), 0) AS min_visits,
       FORMAT(AVG(visits),0) AS avg_visits,
       FORMAT(SUM(visits),0) AS sum_visits
FROM libraries.pls_fy2018_libraries
WHERE visits>=0
GROUP BY stabr
ORDER BY stabr

/* In this case, negative values in number columns indicate the following:
A value of -1 indicates a “nonresponse” to that question.
A value of -3 indicates “not applicable” and is used when a library agency
has closed either temporarily or permanently.*/

/* In this query, the WHERE visits >= 0 
clause ensures that only visits values that are 0 or greater are considered*/


/*Missing Values*/

SELECT COUNT(*) 
FROM pls_fy2018_libraries
WHERE visits IS NULL;

/* identifying and ranking visits by city and state*/

SELECT 
    stabr, 
    city,
    visits,
    RANK() OVER (PARTITION BY stabr ORDER BY visits DESC ) AS 'rank'
FROM 
    pls_fy2018_libraries
WHERE 
	visits>=0

/* Observing the cities with the highest visits*/

SELECT 
    stabr, 
    city,
    visits,
    rank2
FROM 
    (SELECT 
        stabr, 
        city,
        visits,
        RANK() OVER (PARTITION BY stabr ORDER BY visits DESC) AS rank2
     FROM 
        pls_fy2018_libraries
     WHERE 
        visits >= 0
    ) AS ranked_data
WHERE 
    rank2 = 1;

    /* Examining library activity using joins */

SELECT 
    FORMAT(SUM(pls18.visits),0) AS sum_visits_2018,
    FORMAT(SUM(pls17.visits),0) AS sum_visits_2017,
    FORMAT(SUM(pls16.visits),0) AS sum_visits_2016
FROM 
    pls_fy2018_libraries pls18
    JOIN pls_fy2017_libraries pls17 ON pls18.fscskey = pls17.fscskey
    JOIN pls_fy2016_libraries pls16 ON pls18.fscskey = pls16.fscskey

WHERE 
    pls18.visits>=0 AND pls17.visits>=0 AND pls16.visits >=0

/* Percent Change by state*/

SELECT pls18.stabr,
    FORMAT(SUM(pls18.visits), 0) AS visits_2018,
    FORMAT(SUM(pls17.visits), 0) AS visits_2017,
    FORMAT(SUM(pls16.visits), 0) AS visits_2016,
    ROUND((SUM(pls18.visits) - SUM(pls17.visits)) / SUM(pls17.visits) * 100, 2) AS percent_change_2017_2018,
    ROUND((SUM(pls17.visits) - SUM(pls16.visits)) / SUM(pls16.visits) * 100, 2) AS percent_change_2017_2016
FROM 
    pls_fy2018_libraries pls18
    JOIN pls_fy2017_libraries pls17 ON pls18.fscskey = pls17.fscskey
    JOIN pls_fy2016_libraries pls16 ON pls18.fscskey = pls16.fscskey
WHERE 
    pls18.visits >= 0 AND pls17.visits >= 0 AND pls16.visits >= 0
GROUP BY pls18.stabr
ORDER BY percent_change_2017_2018 DESC

/* Using Having */


SELECT pls18.stabr,
    FORMAT(SUM(pls18.visits), 0) AS visits_2018,
    FORMAT(SUM(pls17.visits), 0) AS visits_2017,
    FORMAT(SUM(pls16.visits), 0) AS visits_2016,
    ROUND((SUM(pls18.visits) - SUM(pls17.visits)) / SUM(pls17.visits) * 100, 2) AS percent_change_2017_2018,
    ROUND((SUM(pls17.visits) - SUM(pls16.visits)) / SUM(pls16.visits) * 100, 2) AS percent_change_2017_2016
FROM 
    pls_fy2018_libraries pls18
    JOIN pls_fy2017_libraries pls17 ON pls18.fscskey = pls17.fscskey
    JOIN pls_fy2016_libraries pls16 ON pls18.fscskey = pls16.fscskey
WHERE 
    pls18.visits >= 0 AND pls17.visits >= 0 AND pls16.visits >= 0
GROUP BY pls18.stabr
HAVING SUM(pls18.visits) > 50000000
ORDER BY percent_change_2017_2018 DESC


