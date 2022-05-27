/*1 How many rows are in the data_analyst_jobs table?*/
--1793
SELECT count(*)
FROM data_analyst_jobs;

/* 2 Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row? exxon mobile is 10*/
--exxon mobile
SELECT *
FROM data_analyst_jobs
LIMIT 10;

/* 3 there are 21 jobs in TN. 27 in TN or KY*/

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location='TN'OR location ='KY';

/* 4 How many postings in Tennessee have a star rating above 4? 3 */
--3
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location='TN'
AND star_rating >'4';

/* 5 How many postings in the dataset have a review count between 500 and 1000? 0*/
-- 150

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count > '500' AND review_count <'1000';

/*6 Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?*/

SELECT SUM(star_rating)/COUNT(star_rating)
FROM data_analyst_jobs
WHERE star_rating >'2';

/* 7.	Select unique job titles from the data_analyst_jobs table. How many are there? */
--881
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

/* 8.	How many unique job titles are there for California companies? */
--230
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location ='CA';

/* 9 Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations? */
-- 40

SELECT DISTINCT company, AVG(star_rating) 
FROM data_analyst_jobs
WHERE company IS NOT NULL AND star_rating IS NOT NULL AND review_count>'5000'
GROUP BY company ;

SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs
WHERE company IS NOT NULL AND star_rating IS NOT NULL AND review_count>'5000';


/* 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating? */

SELECT DISTINCT AVG(star_rating), company
FROM data_analyst_jobs
WHERE company IS NOT NULL AND star_rating IS NOT NULL AND review_count>'5000'
GROUP BY company, star_rating;





/* 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? */
-- 124
SELECT count(title)
FROM data_analyst_jobs
WHERE title NOT LIKE '%_nalyst%'
AND title NOT LIKE '%ANALYST%';


/* 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?*/
-- DATA VISUALIZATION WITH TABLEAU

SELECT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%'
AND title NOT LIKE '%Analytics%'
AND title NOT LIKE '%ANALYST%'
AND title NOT LIKE '%analyst%'
AND title NOT LIKE '%analytics%'
AND title NOT LIKE '%ANALYTICS%';





