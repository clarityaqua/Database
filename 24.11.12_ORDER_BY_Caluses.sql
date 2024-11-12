-- ORDER BY Caluse
-- SELECT 명령은 적은순서 대로 실행 되지 않는다.
SELECT -- 3
	*
FROM -- 1
	movies
WHERE -- 2
	director = 'Darren Aronofsky'
ORDER BY -- 4
	release_date DESC, -- 모두 같은 값으로 동일한 값을 가져서 정렬할 수 없을때 2번째 revenue를 기준으로 정렬
  revenue ASC(기본)/DESC -- 기본적으로는 오름차순(작은 것부터 큰 것) 정렬