-- GROUP BY Gotchas

-- GROUP BY에 대해서 몇가지 알아야 할 사항
-- 1. 집계 함수를 사용하지 않더라도 row는 여전히 병합된다
SELECT
	release_date
FROM
	movies
WHERE
	rating IS NOT NULL AND release_date IS NOT NULL
GROUP BY 
	release_date ;
  
-- 2. SELECT문에서는 그룹화의 기준이 되는 column만 사용해야 한다 (예제 : GROUP BY하지 않은 column을 SELECT)
SELECT 
	title, -- 각 그룹의 마지막 title을 가져온다
  director,
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
  
-- 3. GROUP BY를 사용하지 않지만 집계 함수를 사용하는 케이스
SELECT -- GROUP BY가 없으므로 데이터 전체가 그룹이 되어서 실행된다
	title,
  release_date,
	round(AVG(rating), 2) AS avg_rating
FROM
	movies
WHERE
	rating IS NOT NULL AND release_date IS NOT NULL 
ORDER BY
	avg_rating DESC;

-- 총 금액을 알고 싶다고 가정
SELECT -- GROUP BY가 없으므로 데이터 전체가 그룹이 되어서 실행된다
	round(sum(revenue), 2) AS avg_rating
FROM
	movies
WHERE
	rating IS NOT NULL AND release_date IS NOT NULL 
-- ORDER BY
-- 	avg_rating DESC;