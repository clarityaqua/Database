-- 05. Movies Database
-- 실제와 비슷한 DB환경을 통해 데이터베이스의 힘을 느껴봐야 한다.
-- DB 예제 파일: sqlite_sequence를 확인 했을때 약 260000 데이터를 가지고 있는 DB

-- 06. WHERE Clause
SELECT 
	* 
FROM
	movies
WHERE
-- conditions: 특정데이터를 필터링하거나 선택하는 기준 Or predicates: 데이터가 조건을 만족하는지 여부를 판단하는 표현식
-- Predicate는 논리적 표현식 자체: TRUE, FALSE, NULL을 반환 / Condition은 쿼리가 데이터를 필터링할 때 사용하는 기준 앞의 개념을 포함
  director = 'Guy Ritchie';

-- 영어가 아닌 언어를 가져오는 쿼리
SELECT 
	* 
FROM
	movies
WHERE
	original_language <> 'en';

-- 2023년 이후 개봉한 영화를 가져오는 쿼리
SELECT
	* 
FROM
	movies
WHERE
	release_date > 2023;

-- 2025년 이후 개봉한 영화를 가져오는 쿼리
SELECT 
	* 
FROM
	movies
WHERE
	release_date = 2025;

-- NULL 쿼리 연습
SELECT 
	* 
FROM
	movies
WHERE
	revenue IS NOT NULL; -- 하나의 NULL은 다른 NULL과 동일하지 않다. NULL을 검색할때는 =가 아닌 IS

-- budget이 0이 아니고 NULL이 아닌 행을 찾는 쿼리
SELECT 
	* 
FROM
	movies
WHERE
	status = 'Planned' -- 대/소문자 유의!!
  AND budget <> 0 -- <>: 같지 않다. 다르다를 의미
  AND budget IS NOT NULL; -- NULL이 같이 검색되어 해당 구문을 추가
-- budget <> 0 AND budget IS NOT NULL이라는 두 조건을 사용하여 budget이 0이 아니고, 동시에 NULL이 아닌 행만 선택 

-- budget 값에 대해 설정한 조건이 사실상 동일한 의미
SELECT 
	* 
FROM
	movies
WHERE
	status = 'Planned' -- status가 'Planned'인 행만 선택
  AND budget > 0; -- budget이 0보다 큰 행만 선택
-- budget > 0만으로도 0이 아니고 NULL이 아닌 행을 선택 / NULL값은 비교 연산에서 제외되기 때문에 budget > 0 조건에서는 NULL값이 자동으로 걸러짐

-- 평점이 9를 넘거나 개봉년도가 2024 이후인 영화를 가져오는 쿼리
SELECT 
	* 
FROM
	movies
WHERE
	rating > 9
  OR release_date > 2024;

-- 평점이 NULL이거나, 장르가 다큐인 영화를 가져오는 쿼리
SELECT 
	* 
FROM
	movies
WHERE
	rating > 9 
  OR (rating IS NULL AND genres = 'Documentary');