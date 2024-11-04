-- 00. Data Manipulation Language : DML
-- 모든 언어 중 가장 중요하고 가장 많은 시간을 투자하게 될 예정
-- DML은 두 가지 범주로 나누는데, update와 query가 존재
-- query명령은 한가지 update명령은 3가지가 있고 특히 query 명령에 많은 시간을 보내게 될것!

-- 01. Update Commands
INSERT INTO movies
	(title, rating, released, overview)
VALUES
	('The Lord of The Rings', 0.5, 1, 'Rings and hobbits'),
  ('Dune: Part One', 10, 1, 'Sand');

-- UPDATE와 DELETE는 데이터를 갱신하는 명령
-- UPDATE
-- 단순한 UPDATE명령은 데이터 전체의 값을 변경 > WHERE절을 추가해서 범위를 조정

UPDATE movies SET rating = 10 WHERE title = 'The Lord of The Rings';
UPDATE movies SET rating = rating + 2 WHERE title = 'The Lord of The Rings';
UPDATE movies SET director = 'Unknown' WHERE director IS NULL;
-- NULL은 value가 아니기 때문에 =가 아닌 IS로 사용

-- DELETE
-- 단순한 DELETE명령은 데이터 전체의 값을 변경 > WHERE절을 추가해서 범위를 조정

DELETE FROM movies WHERE overview ='Sand';

-- 02. SELECT Command : 가장 강력하고 유용
-- table을 결과 값으로 제공하는 명령어 = table을 반환하는 명령어
SELECT 1+1, 2+2, UPPER('hello');
