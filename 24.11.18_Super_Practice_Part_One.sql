-- Super Practice Part One
-- https://www.sqlite.org/lang_aggfunc.html#avg : Aggregate Functions SQLite

-- Q1. What is the average rating of each director*? (각 감독의 평균 rating은 얼마인가?)
-- Practice
SELECT
	director,
  round(avg(rating)) AS rating_avg
FROM
	movies
GROUP BY 
	director;

-- Teacher
SELECT 
	director,
  avg(rating) AS avg_rating
FROM
	movies
WHERE director IS NOT NULL
			AND rating IS NOT NULL
GROUP BY
	director
ORDER BY avg_rating DESC;

-- Q2.* that has more than 5 movies (5편 이상의 영화를 가진 각 감독의 평균 평점)
-- Practice
SELECT 
	director,
  avg(rating) AS avg_rating,
  count(director) AS director_movies
FROM
	movies
WHERE director IS NOT NULL
			AND rating IS NOT NULL
GROUP BY
	director
ORDER BY avg_rating DESC;

-- Teacher
SELECT 
	director,
  round(AVG(rating), 3) AS avg_rating
FROM
	movies
WHERE director IS NOT NULL
			AND rating IS NOT NULL
GROUP BY
	director
HAVING COUNT(*) > 5
ORDER BY avg_rating DESC;

-- Q3. How many movies are in each genre? (각 장르에 몇편의 영화가 존재하는지?)
SELECT
	genres,
  COUNT(*) AS number_of_movies
FROM
	movies
WHERE genres IS NOT NULL
GROUP BY
	genres
ORDER BY number_of_movies DESC;

-- Teacher
SELECT
	genres,
  COUNT(*) AS total_movies
FROM
	movies
WHERE
	genres IS NOT NULL
GROUP BY
	genres
ORDER BY total_movies DESC;

-- Q4. How many movies have a rating greater than 6? (평점이 6보다 높은 영화는 몇편인지?)
-- Practice 
SELECT
	rating,
  COUNT(*)
FROM
	movies
WHERE rating IS NOT NULL
GROUP BY
	rating
HAVING rating > 6;

-- What is the most common? (가장 흔한 평점은 무엇인지?)
-- Practice
SELECT
	rating,
  COUNT(*) AS rating_numbers
FROM
	movies
WHERE rating IS NOT NULL
GROUP BY
	rating
HAVING rating > 6
ORDER BY rating_numbers DESC;

-- Teacher
SELECT
	rating,
  COUNT(*) total_movies -- AS는 필수가 아니기 때문에 안 적어도 된다 : 추천은 AS를 붙이는 걸 추천
FROM
	movies
WHERE
	rating > 6
GROUP BY rating
ORDER BY total_movies DESC;