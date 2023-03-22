SELECT * FROM titanic;
--  CLEANING THE TITANIC_DATA DATABASE

-- Task Nr.1
-- FIND IF THERE ARE ANY DUPLICATED VALUES IN THE PASSENGERID COLUMN
SELECT PassengerId,COUNT(PassengerId),Name, COUNT(Name)
FROM titanic
GROUP BY PassengerId, Name
HAVING COUNT(PassengerId)>1 and COUNT(Name)>1; -- There are no duplicated values in the PassengerId and Name columns

-- Task Nr.2
-- FINDING TOTAL NUMBER OF THE BLANK CELLS IN THE DATA SET
SELECT COUNT(*) 
FROM titanic
WHERE PassengerID=" " OR Survived=" "  OR Pclass=" "  OR Name=" "  OR Sex=" "  OR Age=" "  OR SibSp=" "  OR Parch=" "  OR Ticket=" "  OR Fare=" "   OR Embarked=" " ; -- There is at least one cell blank in 692 of the 714 rows in this dataset .Filling the blank cells of that column with some adequate values,dropping the column or not changing anything, are the three possible solutions.But dropping the column Cabin may be the best solution.

-- Task Nr.3
-- DROPPING THE COLUMN "Cabin"
ALTER TABLE titanic
DROP COLUMN Cabin;
-- After dropping the "Cabin" column, if there are any null/na values or blank spaces left, we can fill those cells with their adequate values based on different criteria



-- ANALYSIS OF THE TITANIC_DATA DATABASE
-- Task Nr.4
-- SHOW THE FIRST FIVE ROWS FROM TITANIC TABLE
-- Solution 1
SELECT * 
FROM titanic
LIMIT 5;
-- Solution 2
SELECT * 
FROM titanic
ORDER BY PassengerId asc
limit 5;

-- Task Nr.5
-- FIND THE NUMBER OF PASSENGERS WHO DIDN'T SURVIVE
SELECT COUNT(*) as "Passengers_who_didn't survive" 
FROM titanic 
WHERE Survived = 0;

-- Task Nr.6
-- FIND THE AGE OF THE OLDEST PASSENGER ON THE SHIP
SELECT MAX(Age) as age_oldest_passenger 
FROM titanic;

-- Task Nr.7
-- FIND THE AVERAGE AGE OF THE PASSENGERS FOR EACH CLASS
SELECT ROUND(AVG(Age),0) AS youngest_passenger_per_class, Pclass 
FROM titanic
GROUP BY Pclass
ORDER BY Pclass ASC;

-- Task Nr.8
-- FIND THE FIRST 20 ROWS OF THE DATASET SORTED BY PASSENGERID IN DESCENDING ORDER
SELECT * 
FROM titanic
ORDER BY PassengerId DESC
LIMIT 20;


-- Task Nr.9
-- FIND THE NUMBER OF PASSENGERS IN EACH CLASS SORTED BY NUMBER OF PASSENGERS IN DESCENDING ORDER
SELECT Pclass, COUNT(*) as "Total Nr. of Passengers"
FROM titanic
GROUP BY Pclass
ORDER BY "Total Nr. of Passengers" DESC;


-- Task Nr.10
-- FIND THE AVERAGE FARE PAID FOR EACH GENDER AND CLASS SORTED BY AVERAGE FARE PAID BY PASSENGERS IN DESCENDING ORDER
SELECT  Sex, ROUND(AVG(Fare),2) as average_fare_paid_by_passengers_in_usd
FROM titanic
GROUP BY  Sex
ORDER BY average_fare_paid_by_passengers_in_usd DESC;

-- Task Nr.11
-- FIND THE NAME AND THE CLASS OF THE FEMALE  WHO PAID HIGHEST FARE 
-- Solution 1
SELECT Name, Age,ROUND(Fare,2) AS fare_amount
FROM titanic
WHERE Sex='Female' AND Fare = (SELECT MAX(Fare) FROM titanic);
-- Solution 2
WITH cte1 AS
(SELECT round(MAX(Fare),2) AS maximum_fare,Name as passenger_name,Age FROM titanic WHERE Sex='Female' GROUP BY Name,Age )
SELECT maximum_fare,passenger_name,Age
FROM cte1
ORDER BY maximum_fare DESC
LIMIT 1;

-- Task Nr.12
-- FIND THE YOUNGEST PASSENGER WHO WAS FOUND DEAD
-- Solution  (with Subquery)
SELECT Name,Age
FROM titanic 
WHERE  Age = (SELECT MIN(Age) FROM titanic where Survived=0) AND Survived = 0; 
-- Solution (with Commont Table Expression)
WITH passenger_dead AS
(SELECT *  FROM titanic WHERE  Age = (SELECT Min(Age) FROM titanic where Survived = 0))
SELECT Name, Age from passenger_dead
WHERE Survived = 0;

-- Task Nr.13
-- DISPLAY THE AVERAGE FARE AMOUNT THAT THE PASSENGERS PAID FOR EACH AGE GROUP
SELECT 
CASE WHEN Age<18 THEN "Under 18"
WHEN Age BETWEEN 18 AND 40 THEN "18-40"
WHEN Age BETWEEN 41 AND 60 THEN "41-60"
ELSE "Above 60"
END AS age_group,
ROUND(AVG(Fare),2) AS average_fare_amount
FROM titanic
GROUP BY age_group
ORDER BY average_fare_amount DESC;

-- Task Nr.14
-- RETRIVE TOTAL FARE AMOUNT PAID BY EACH PASSENGER ALONG WITH THE AVERAGE FARE AMOUNT ACROSS ALL PASSENGERS
SELECT PassengerId,SUM(Fare) OVER (partition by PassengerID) AS total_fare_amount_per_passenger, ROUND(AVG(Fare) OVER(),2) AS average_fare_amount
FROM titanic
ORDER BY total_fare_amount_per_passenger DESC;

-- Task Nr.15
-- RETRIEVE ONLY PASSENGERS AND THEIR CLASSES THAT PAID HIGHER FARE AMOUNT THAN THE AVERAGE FARE AMOUNT ACROSS ALL PASSENGERS
SELECT Name,Pclass,Fare,avg_fare_amount FROM (SELECT *, ROUND(AVG(Fare) OVER (PARTITION BY Pclass),2) AS avg_fare_amount FROM titanic) AS subquery
WHERE Fare > avg_fare_amount;

-- Task Nr.16
-- FOR EACH CLASS, SHOW THE RANK OF THE PASSENGERS WHO SURVIVED, BY THEIR PAID FARE AMOUNT(IF THEY PAID THE SAME FARE AMOUNT THEY SHOULD HAVE SAME RANK)
SELECT Pclass,Name,ROUND(Fare,2) AS paid_fare_amount, DENSE_RANK() OVER (PARTITION BY Pclass ORDER BY Fare DESC) AS passengers_rank_fare_amount
FROM titanic 
WHERE Survived=1



-- 

-- 
