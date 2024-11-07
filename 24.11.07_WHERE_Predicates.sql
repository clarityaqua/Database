-- 07. WHERE Predicates
-- 2019년~2024년까지 개봉한 영화를 가져오는 쿼리 (비교연산자 사용)
SELECT
	*
FROM
	movies
WHERE
	release_date > 2019 AND release_date < 2025;
  
-- BETWEEN을 사용해도 같은 결과 값을 보여준다. (BETWEEN을 쓰면 더 낮은 수가 앞으로 와야 한다/순서중요!)
SELECT
	*
FROM
	movies
WHERE
	release_date between 2020 AND 2024;

-- 항등 연산자와 논리 연산자를 사용하여 똑같이 만들어 보기
SELECT
	*
FROM
	movies
WHERE
	genres = 'Documentary' OR genres = 
  'Comedy';
  
-- IN을 사용해서 작성해도 같은 결과 값을 보여준다.
SELECT
	*
FROM
	movies
WHERE
	genres IN ('Documentary', 'Comedy');
  
-- 영어/스페인어/독일어를 포함하지 않은 영화 요청 쿼리: membership condition
SELECT
	*
FROM
	movies
WHERE
	Original_language NOT IN ('en', 'es', 'de');
  
-- WildCard & Like Condition: Pattern Matching
SELECT
	*
FROM
	movies
WHERE
	title LIKE 'The%'; -- 제목에 the라는 단어가 있거나 그것으로 시작하는 영화 요청 쿼리
  -- %: 와일드카드 > 나머지 뒷 부분은 신경쓰지 않음
  title LIKE '%Love'; -- 뒷 부분에 Love가 붙는 title 검색
	
  overview LIKE '%kimchi%'; -- overview에 kimchi 단어를 검색
	
  genres = 'Drama'; -- 이렇게 작성하면 딱 Drama 단어만 검색
  genres LIKE %Drama%; -- 와일드카드를 앞/뒤로 붙여 드라마나 다른 장르가 있는 영화를 검색 (해당 단어가 중간에 있어도 검색)
  genres NOT LIKE %Drama%; -- 드라마에 속하지 않는 영화를 검색

	title LIKE '___ing'; -- ing로 끝나는 6글자 단어가 포함된 영화를 검색 (ing 이전에 어떤 글자가 나오든 상관하지 않음)
 	title LIKE 'THE___'; -- THE 다음 3글자로 끝나는 title 검색
  title LIKE 'THE __'; -- THE 다음 공백, 2글자로 끝나는 title 검색
  
  title LIKE 'The ___ %'; -- THE로 시작하고 공백 다음에 3개의 글자 그리고 공백 뒤에는 상관없는 영화 검색
  
 -- 배운 것 : 조건에 범위를 추가하는 것, condition & membership, LIKE & NOT LIKE