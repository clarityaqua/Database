-- HAVING Clause : GROUP BY를 사용할때 많이 사용하게 될 것
-- 구문인데 WHERE와 매우 비슷, row를 필터 할수 있다. (WHERE와 다른 점은 실행하는 순간)

-- 평균 6점 이상인 연도만 가져오는 쿼리
SELECT -- 4th
	release_date,
  round(AVG(rating), 2) AS avg_rating
FROM -- 1st
	movies
WHERE -- 2nd : 데이터베이스 값을 기반으로 row를 필터링 : WHERE구문은 avg(rating) row를 볼수 없음
	rating IS NOT NULL AND release_date IS NOT NULL
  AND avg_rating -- 해당 필터는 HAVING으로 들어가야 함
GROUP BY -- 3rd
	release_date
ORDER BY -- 5th
	avg_rating DESC;


-- 변경 된 쿼리 : HAVING 추가
SELECT -- 5th
	release_date,
  round(AVG(rating), 2) AS avg_rating
FROM -- 1st
	movies
WHERE -- 2nd
	rating IS NOT NULL AND release_date IS NOT NULL
GROUP BY -- 3rd
	release_date
HAVING -- 4th : GROUP BY를 사용하여 생성된 column, 집계 함수(AVG, SUM등)를 통해 생성된 column을 볼수 있다.
	avg_rating > 6
ORDER BY -- 6th
	avg_rating DESC;