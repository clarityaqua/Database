-- LIMIT and OFFSET Clauses (매우 중요 개념)
SELECT -- 3rd
	*
FROM -- 1st
	movies
WHERE -- 2nd
ORDER BY -- 4th
LIMIT 5 -- 6th : 5줄의 데이터만 요청
OFFSET 5; -- 5th : 5개의 row를 건너뛰고 요청
OFFSET 0 * 5; -- 첫번째 페이지의 영화 1~5를 요청

-- ORDER BY가 없을때는 다음과 같은 순서로 실행 : FROM > WHERE > SELECT > OFFSET > LIMIT