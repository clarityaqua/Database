-- ORDER BY Practice : SELECT 명령을 더욱 유용하게 만들 수 있음
-- 명령어 실행 순서는 조건이 변동되면 변경될 수 있음
SELECT -- 3rd
	*
FROM -- 1st
	movies
WHERE -- 2nd
	director = 'Darren Aronofsky'
ORDER BY -- 4th
	revenue DESC;
  
SELECT
	*
FROM 
	movies
ORDER BY 
	release_date DESC,
	revenue DESC;

SELECT
	*
FROM 
	movies
ORDER BY
	runtime DESC;
  
SELECT
	*
FROM
	movies
WHERE
	rating IS NOT NULL
ORDER BY
	rating;
  
SELECT
	*
FROM 
	movies
ORDER BY
	rating DESC,
  runtime;