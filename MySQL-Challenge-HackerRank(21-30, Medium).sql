/* 21. Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table,
but did not realize her keyboard's  key was broken until after completing the calculation.
She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed),
and the actual average salary.
Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.*/
SELECT CEILING(AVG(Salary) - AVG(REPLACE(Salary, '0', ''))) FROM EMPLOYEES;

/* 22. We define an employee's total earnings to be their monthly  worked, and the maximum total earnings
to be the maximum total earnings for any employee in the Employee table.
Write a query to find the maximum total earnings for all employees as well as the total number of employees
 who have maximum total earnings. Then print these values as  space-separated integers.*/
SELECT months*salary AS total_earning, COUNT(employee_id)
FROM Employee
GROUP BY 1
ORDER BY 1 DESC
LIMIT 1;

/* 23. Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of  decimal places.
The sum of all values in LONG_W rounded to a scale of  decimal places. */
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2) FROM Station;

/* 24. Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and
less than 137.2345. Truncate your answer to  decimal places.*/
SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

/* 25. Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 138.2345
Truncate your answer to  decimal places.*/
SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

/* 26. Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345.
Round your answer to  decimal places.*/
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

/* 27. Enter your Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 39.7780.
Round your answer to  decimal places.*/
SELECT ROUND(MIN(LAT_N), 4) FROM station
WHERE LAT_N > 38.7780
LIMIT 1;

/* 28. Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780.
Round your answer to  decimal places.*/
SELECT ROUND(LONG_W, 4) FROM station
WHERE LAT_N > 38.7780
ORDER BY LAT_N
LIMIT 1;

/* 29. Consider P_1(a,b) and P_2(c,d) to be two points on a 2D plane.
a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.*/
SELECT ROUND(ABS(MAX(LAT_N)-MIN(LAT_N)) + ABS(MAX(LONG_W)-MIN(LONG_W)), 4)
FROM station;

/* 30. Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of
Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.*/
SELECT ROUND(SQRT(POWER(MAX(LAT_N)-MIN(LAT_N),2) + POWER(MAX(LONG_W)-MIN(LONG_W),2)),4)
FROM station;

/* 31. P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* * * * *
* * * *
* * *
* *
*
Write a query to print the pattern P(20).*/

SET @number = 21;
SELECT REPEAT('* ', @number := @number - 1) FROM information_schema.tables
WHERE @number > 0;

* * * * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * *
* * * * * * * * * * * * * *
* * * * * * * * * * * * *
* * * * * * * * * * * *
* * * * * * * * * * *
* * * * * * * * * *
* * * * * * * * *
* * * * * * * *
* * * * * * *
* * * * * *
* * * * *
* * * *
* * *
* *
*

/* 32. P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
*
* *
* * *
* * * *
* * * * *
Write a query to print the pattern P(20).*/

SET @number = 0;
SELECT REPEAT('* ', @number := @number + 1) FROM information_schema.tables
WHERE @number < 20

*
* *
* * *
* * * *
* * * * *
* * * * * *
* * * * * * *
* * * * * * * *
* * * * * * * * *
* * * * * * * * * *
* * * * * * * * * * *
* * * * * * * * * * * *
* * * * * * * * * * * * *
* * * * * * * * * * * * * *
* * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * * * * *
