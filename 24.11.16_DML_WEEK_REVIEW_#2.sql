-- 24.11.11 SELECT CASE
SELECT
	title,
  CASE WHEN rating >= 8 THEN
  	'↑'
  WHEN rating <= 6 THEN
  	'↓'
  ELSE
  	'⇆'
  END AS good_or_not
FROM
	movies;
  
-- 24.11.12 ORDER BY Clause
-- 아래 순서는 현재 이 조합에서 실행 되는 순서
SELECT -- 3rd
	*
FROM -- 1st
	movies
--WHERE -- 2nd
	--director = 'Darren Aronofsky'
ORDER BY -- 4th : 특정 column을 기준으로 정렬 : 기본적으로 오름차순(ASC)으로 정렬 : 반대는 DESC
	release_date DESC,
  revenue DESC; -- 이전 정렬을 하고 나서도 같은 값을 가지고 있을때 적용 

-- 24.11.13 LIMIT and OFFSET Clauses (매우 중요하고 매우 유용)
-- 명령어 실행 순서(WHERE절에 조건이 있을 경우) : FROM > WHERE > SELECT > OFFSET > LIMIT
-- ORDER BY 추가 시 : FROM > WHERE > SELECT > ORDER BY > OFFSET > LIMIT
SELECT
	*
FROM
	movies
LIMIT 5 -- 5개의 row를 요청하여 결과를 표시
OFFSET 10; -- 5개의 row를 건너뛰어 요청하여 결과를 표시
OFFSET  2 * 5; -- 페이지를 설정하여 요청 및 결과를 표시

-- 24.11.14 GROUP BY Clause
-- 1. 데이터 정렬(특정 Column) > 2. 집계(Aggregate) 함수 사용
-- 명령어 실행 순서 : FROM > WHERE > GROUP BY > SELECT > ORDER BY
SELECT
	director,
	SUM(revenue) AS total_revenue -- 집계 함수
FROM
	movies
WHERE
	director IS NOT NULL
  AND revenue IS NOT NULL
GROUP BY 
	director
ORDER BY
	total_revenue DESC;

-- 어느 년도에 영화 평점이 제일 높았는지 요청하는 쿼리 작성
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
  
-- 24.11.15 GROUP BY Gotchas
-- 1. 집계 함수를 사용하지 않아도, row는 여전히 병합된다
SELECT
	release_date
FROM
	movies
WHERE
	rating IS NOT NULL AND release_date IS NOT NULL
GROUP BY 
	release_date;
  
-- 2. SELECT문에서는 그룹화의 기준이 되는 Column만 사용해야 한다
SELECT
	title, -- 오류가 나지 않고, 그룹 내 마지막 영화를 가져온다
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
  
-- 3. GROUP BY를 쓰지 않으면서 AVG와 같은 집계 함수를 사용하면? : 모든 row가 하나의 그룹처럼 병합 
SELECT
	round(sum(revenue), 2) -- 데이터베이스에 있는 모든 영화가 벌어들인 총 revenue를 계산
FROM
	movies
WHERE
	rating IS NOT NULL AND release_date IS NOT NULL;
-- GROUP BY : 그룹 자체가 존재 하지 않아 데이터 베이스 전체가 그룹이 된다
-- release_date
-- ORDER BY
-- avg_rating DESC;

-- 24.11.15 HAVING Clause
-- 구문인데 WHERE와 비슷하다 : row를 필터 할 수 있음 : WHERE와 다른점은 실행하는 순간

-- 평균 평점이 6점 이상인 년도만 가져오고 싶다면?
SELECT
	release_date,
	round(AVG(rating), 2) AS avg_rating
FROM
	movies
WHERE
	rating IS NOT NULL AND release_date IS NOT NULL 
-- AND avg_rating > 6 -- WHERE 구문은 AVG를 볼수 없기 떄문에 에러가 난다
GROUP BY 
	release_date
HAVING -- HAVING 구문을 추가 : GROUP BY를 사용하여 생성된 column과 집계 함수를 사용해 생성된 column을 볼수 있다
	avg_rating > 6
ORDER BY
	avg_rating DESC;
  
-- 실행 순서 : FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY