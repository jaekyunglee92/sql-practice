/* 1. Query the two cities in station with the shortest and longest city names,
as well as their respective lengths (i.e.: number of characters in the name).
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.*/
SELECT city, LENGTH(city)
FROM station
WHERE LENGTH(city) = (
    SELECT  MAX(LENGTH(city))
    FROM station)
ORDER BY city
LIMIT 1;

SELECT city, LENGTH(city)
FROM station
WHERE LENGTH(city) = (
    SELECT  MIN(LENGTH(city))
    FROM station)
ORDER BY city
LIMIT 1;

/* 2. Query the list of city names starting with vowels (i.e., a, e, i, o, or u) from station.
Your result cannot contain duplicates.*/
SELECT DISTINCT(city) FROM station
WHERE SUBSTRING(city, 1, 1) IN ('A', 'E', 'I', 'O', 'U');

/* 3. Query the list of city names ending with vowels (a, e, i, o, u) from station.
Your result cannot contain duplicates.*/
SELECT DISTINCT(city) FROM station
WHERE SUBSTRING(city, -1, 1) IN ('A', 'E', 'I', 'O', 'U');

/* 4. Query the list of city names from station which have vowels (i.e., a, e, i, o, and u)
as both their first and last characters. Your result cannot contain duplicates.*/
SELECT DISTINCT city FROM station
WHERE left(city,1) IN ('a','e','i','o','u')
AND right(city, 1) IN ('a','e','i','o','u')

/* 5. Query the list of city names from station that do not start with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT city
FROM station WHERE
SUBSTRING(city, 1, 1) NOT IN ('a','e','i','o','u');

/* 6. Query the list of city names from station that do not end with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT city
FROM station
WHERE SUBSTRING(city,-1,1) NOT IN ('a','e','i','o','u');

/* 7. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
Your result cannot contain duplicates.*/
SELECT DISTINCT city
FROM station
WHERE SUBSTRING(city,1,1) NOT IN ('a','e','i','o','u') OR
      SUBSTRING(city,-1,1) NOT IN ('a','e','i','o','u');

/* 8.Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
Your result cannot contain duplicates.*/
SELECT DISTINCT city
FROM station
WHERE SUBSTRING(city,1,1) NOT IN ('a','e','i','o','u') AND
      SUBSTRING(city,-1,1) NOT IN ('a','e','i','o','u');

/* 9. Query the Name of any student in STUDENTS who scored higher than  Marks.
Order your output by the last three characters of each name.
If two or more students both have names ending in the same last three characters
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/

SELECT name
FROM students
WHERE marks > 75
ORDER BY SUBSTRING(name,-3,3), ID;

SELECT name
FROM students
WHERE marks > 75
ORDER BY RIGHT(name,3), ID;

/* 10. Write a query that prints a list of employee names (i.e.: the name attribute)
from the Employee table in alphabetical order.*/
SELECT name FROM employee ORDER BY name;

/* 11. Write a query that prints a list of employee names (i.e.: the name attribute)
for employees in Employee having a salary greater than  per month who have been employees for less than  months.
Sort your result by ascending employee_id.*/
SELECT name FROM employee
WHERE (months < 10) AND (salary > 2000)
ORDER BY employee_id

/* 12. Query the names of all American cities in CITY with populations larger than 120000.
The CountryCode for America is USA.*/
SELECT name FROM city
WHERE population > 120000 AND countrycode = 'USA';

/* 13. Query a count of the number of cities in CITY having a Population larger than .*/
SELECT COUNT(id) FROM CITY
WHERE population > 100000;

/* 14. Query the total population of all cities in CITY where District is California.*/
SELECT SUM(population) FROM city
WHERE district = 'California';

/* 15. Query the average population of all cities in CITY where District is California.*/
SELECT AVG(population) FROM city
WHERE district = 'California';

/* 16. Query the average population for all cities in CITY, rounded down to the nearest integer.*/
SELECT ROUND(AVG(population)) FROM city;

/* 17. Query the sum of the populations for all Japanese cities in CITY.
The COUNTRYCODE for Japan is JPN.*/
SELECT SUM(population) FROM CITY
WHERE countrycode = 'JPN';

/* 18.Given the CITY and COUNTRY tables, query the sum of the populations of all cities where
the CONTINENT is 'Asia'. Note: CITY.CountryCode and COUNTRY.Code are matching key columns.*/
SELECT SUM(c.population) FROM CITY AS c
JOIN COUNTRY AS o ON c.CountryCode = o.Code
WHERE o.Continent = 'Asia';

/* 19. Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.*/
SELECT C.NAME FROM CITY AS c
JOIN COUNTRY AS o ON c.CountryCode = o.Code
WHERE o.Continent = 'Africa';

/* 20. Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent)
and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.*/
SELECT o.Continent, FLOOR(AVG(c.population))
FROM CITY AS c
JOIN COUNTRY AS o ON c.CountryCode = o.Code
GROUP BY 1;
