-- 24.11.19_WHERE Practice

SELECT
	*
FROM
	movies
WHERE
	rating >= 7;
  
SELECT
	*
FROM
	movies
WHERE
	release_date < 2000;
  
SELECT
	*
FROM
	movies
WHERE
	release_date BETWEEN 1990 AND 2000;
  
SELECT
	*
FROM
	movies
WHERE
	title LIKE 'The%';
  
SELECT
	*
FROM
	movies
WHERE
	rating IS NULL;
  
SELECT
	*
FROM
	movies 
WHERE
	genres IS NOT NULL;
  
SELECT
	*
FROM
	movies
WHERE
	rating < 7 OR runtime < 60;
  
SELECT
	*
FROM
	movies
WHERE
	rating > 5 AND runtime > 30;
  
SELECT
	*
FROM
	movies
WHERE
	release_date = 1998;
  
SELECT
	*
FROM
	movies 
WHERE
	budget IS NOT NULL
  AND revenue IS NOT NULL
  AND homepage IS NOT NULL;
  
SELECT
	*
FROM
	movies
WHERE
	runtime BETWEEN 60 AND 120;
  
SELECT
	*
FROM	
	movies
WHERE
	title LIKE '%THE%';
  
SELECT
	*
FROM
	movies
 WHERE
 	title LIKE 'WAR _____';
  
SELECT
	*
FROM
	movies
WHERE
	original_language NOT IN ('en', 'fr');