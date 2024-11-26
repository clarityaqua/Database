-- 24.11.26 - HAVING Clause Practice
SELECT
	release_date,
  round(AVG(rating), 2) AS avg_rating
FROM
	movies
WHERE
	rating IS NOT NULL AND release_date IS NOT NULL
GROUP BY
	release_date
ORDER BY
	avg_rating DESC;
  
SELECT
	budget,
	AVG(runtime) AS avg_runtime
FROM
	movies
WHERE 
	budget IS NOT NULL
GROUP BY
	budget
HAVING avg_runtime > 100
ORDER BY
	avg_runtime DESC;