-- 24.11.04 Update Commands

INSERT INTO movies
	(title, rating, released, overview)
VALUES
	('The Lord of The Rings', 0.5, 1, 'Rings and hobbits'),
  ('Dune: Part One', 10, 1, 'Sand');

-- UPDATE
UPDATE movies SET rating = 2;
UPDATE movies SET rating = 2 WHERE title = 'The Lord of The Rings';
UPDATE movies SET rating = rating + 2 WHERE title = 'The Lord of The Rings';
UPDATE movies SET director = 'Unkown' WHERE director IS NULL AND rating = 10;

-- DELETE
DELETE FROM movies WHERE movie_id = 2;

-- 24.11.04 SELECT Command
SELECT 1+1, 2+2, 'hello';
SELECT 1+1, 2+2, UPPER('hello');

-- 24.11.05 FROM Caluse
SELECT * FROM movies;
SELECT title, rating FROM movies; -- From called first

-- 24.11.05 SELECT Expressions
SELECT
	REPLACE(title, ': Part One', ' I') AS title,
  rating * 2 AS double_rating,
  UPPER(overview) AS overview_upp
FROM
	movies;
  
-- 24.11.06 Movies Database
-- 26만개의 DB예제로 수업을 예고

-- 24.11.06 WHERE Clause
SELECT
	*
FROM
	movies
WHERE -- conditions Or predicates
	director = 'Guy Ritchie';
  original_language <> 'en';
  release_date > 2023;
  release_date < 2023;
  release_date = 2025;
  revenue IS NOT NULL; -- NOT revenue = NULL
  status = 'Planned' AND budget <> 0 AND budget IS NOT NULL;
  rating > 9 OR release_date > 2024;
  rating > 9 OR (rating IS NULL AND genres = 'Documentary');
  
 -- 24.11.07 WHERE Predicates
SELECT
	*
FROM
	movies
WHERE
	release_date > 2019 AND release_date < 2025;
  
  release_date BETWEEN 2020 AND 2024;
  release_date BETWEEN 2024 AND 2020; -- not working
  
  genres = 'Documentary' OR genres = 'Comedy';
  genres IN ('Documentary', 'Comedy');
  
  original_language NOT IN ('en', 'es', 'de');
  
  title LIKE 'The%';
  title LIKE '%Love';
  overview LIKE '%kimchi%';
  genres not LIKE '%Drama%';
  title LIKE 'The ___';
  director LIKE '_____ Roberts';
  director NOT LIKE '%Roberts';
  title LIKE 'The ___ %';
  