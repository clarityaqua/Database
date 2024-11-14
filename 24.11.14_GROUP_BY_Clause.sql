-- GROUP BY Clause (정말 강력한 기능)
-- 두 단계로 나뉘어 수행 : 데이터 정렬 > 집계(aggregate) 함수

SELECT -- 4th
	director,
	SUM(revenue) AS total_revenue-- 집계 함수
FROM -- 1st
	movies
WHERE -- 2nd
	director IS NOT NULL
  AND revenue IS NOT NULL
GROUP BY -- 3rd
	director
ORDER BY -- 5th
	total_revenue DESC;

-- 평균 평점이 가장 높았던 연도 : 최고의 영화들이 많이 나온 해
SELECT
	release_date,
	round(AVG(rating), 2) AS avg_rating -- round를 사용하여 소수점 2자리로 설정
FROM
	movies
WHERE
	rating IS NOT NULL AND release_date IS NOT NULL
GROUP BY 
	release_date 
ORDER BY
	avg_rating DESC;