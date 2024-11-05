-- 03. FROM Clause
SELECT * FROM movies;
SELECT title, rating FROM movies;

-- 보통은 써 있는 구문대로(SELECT) 실행 되는 줄 알지만, 실제로는 FROM이 먼저 호출 된다.
-- FROM이 먼저 실행 되면서 테이블을 불러오고 이 후, SELECT는 결과물을 구성한다.
-- FROM movies -> SELECT 

SELECT title, rating, 1+1 FROM movies;

-- 04. SELECT Expressions
-- column 결과 형태를 바꾸기 위해 replace나 upper 같은 function을 사용
SELECT
		REPLACE(title, ': Part One', ' I') AS title,
    rating * 2 AS double_rating,
    UPPER(overview) AS overview_upp
FROM
		movies;
-- SELECT는 테이블을 반환한다. 그리고 이 테이블은 movies나 다른 곳에서 온 data를 가질 수 있음
-- SELECT를 잘 다루면 내 마음대로 데이터를 커스터마이징해서 볼수 있다.