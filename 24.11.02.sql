-- 0. DDL : Data Definition Language (DDL) : 데이터 정의 언어
-- 쿼리 앞에 --를 붙이면 주석으로 진행 된다.

SELECT 1+1; -- 명령어 작성은 소문자나 대문자나 상관이 없다. 다만 쿼리를 끝낼때는 ;이 필요
-- ;없이 작성은 가능하지만 작동을 하지 않는다.


-- 1. TABLE : 관계형 데이터 베이스 = 엑셀 = 스프레스 시트
-- 하나의 시트가 아닌 여러 종류의 시트를 가질 수 있다 = 테이블이라 부른다.

-- 2. CREATE TABLE : 만들 테이블의 이름, 테이블에 어떤열이 있을지 알아야 한다.

CREATE TABLE movies (
	title,
  released, -- year는 일부 데이터베이스에서(파란색) 명령어로 인식될수 있음 
  overview,
  rating,
  director
); -- 실행하면 movies라는 테이블이 생성 : 테이블 생성의 아주 기초적인 버전(SQLite)

-- 3. INSERT INTO VALUES 
DROP TABLE movies; -- 테이블 삭제 명령어

-- DML 명령어인 INSERT : 테이블에 값을 삽입
INSERT INTO movies VALUES (
	'The Godfather',
  1980,
  'The best movie in the world',
  10,
  'F.F.C'
);

-- 처음은 기초부터 시작해서 점점 발전하는 코드로 진행

-- 4. INSERT INTO VALUES part Two
INSERT INTO movies VALUES -- 한번에 2행을 추가 하는 방법 : 해당 방법을 추천하지는 않음
	('The Godfather', 1980, 'The best movie in the world', 10, 'F.F.C'),
	('1984', 1983, 'super good', 10, 'dont know');
  
-- 해당 방법을 추천하지 않는 이유 : 항상 열의 순서를 기억해야 하고 각 열의 모든 값을 알아야 함 ex. 열은 5개인데 4개의 값만 넣으면 에러가 발생

INSERT INTO movies (title, rating, released) -- 데이터의 다른 값을 넣는 방법
	VALUES ('TLOTR IIII', 10, 1999), ('The godfather II', 9, 1999);

-- 5. Data Types : DDL
DROP TABLE movies;

CREATE TABLE movies (
	title TEXT,
  released INTEGER, -- 1, 2, 3, ... 
  overview TEXT,
  rating REAL, -- 1.2, 9.6 ...
  director TEXT,
  for_kids INTEGER -- 0 or 1
  -- poster BLOB -- 데이터베이스에 이미지를 넣는건 좋은 방법이 아님 : 경로입력을 추천함
) STRICT; -- STRICT : 데이터 종류를 엄격하게 제한 하는 함수
-- 데이터 타입을 데이터베이스에 설명하는 방법은 모든 데이터베이스에서 공통적, 단 데이터 타입(TEXT, INTEGER...)은 데이터베이스마다 다르다.


INSERT INTO movies
	(title, rating)
VALUES
	('The Lord of The Rings', 10),
  ('Dune: Part One', 10),
  (9.8, 'Dune: Part Two'), -- 9.8은? 알아서 ''붙여서 text로 변환해서 넘겨줌 (SQLite)
  (NULL, NULL);
  
 -- 6. Constraints : 제약조건 > column에 입력될 데이터의 통제를 도움 (UNIQUE, DEFAULT)
 DROP TABLE movies;
 
 CREATE TABLE movies (
	title TEXT UNIQUE NOT NULL, -- UNIQUE : 이미 해당 데이터가 있는지 확인을 하게 됨 NOT NULL : NULL이 되면 안됨
  released INTEGER NOT NULL, -- 1, 2, 3, ... 
  overview TEXT NOT NULL,
  rating REAL NOT NULL, -- 1.2, 9.6 ...
  director TEXT,
  for_kids INTEGER NOT NULL DEFAULT 0 -- DEFAULT 0 : 아무 값도 넣지 않으면 DEFAULT로 설정
  -- poster BLOB 
) STRICT; 

INSERT INTO movies
	(title, rating, released, overview)
VALUES
	('The Lord of The Rings', -10, -100, 'Ring and hobbits'),
  ('Dune: Part One', -10, -100, 'Sand');
  
-- 7. CHECK Constraint : 매우 강력한 제약 조건
DROP TABLE movies;

--- 어떤 명령어가 순서에 민감하고 어떤 명령어가 순서에 민감하지 않은지 CHECK (실수를 통해 배우자)
CREATE TABLE movies (
	title TEXT NOT NULL UNIQUE,
  released INTEGER NOT NULL CHECK (released > 0), -- 1, 2, 3, ... 
  overview TEXT NOT NULL,
  rating REAL NOT NULL CHECK (rating BETWEEN 0 AND 10), -- 1.2, 9.6 ...
  director TEXT,
  for_kids INTEGER NOT NULL DEFAULT 0 CHECK (for_kids BETWEEN 0 AND 1) -- CHECK 로직문 추가 CHECK (for_kids = 0 OR for_kids = 1)
  -- poster BLOB 
) STRICT; 

INSERT INTO movies
	(title, rating, released, overview)
VALUES
	('The Lord of The Rings', 0.5, 1, 'Ring and hobbits'),
  ('Dune: Part One', 10, 1, 'Sand');
  
-- 8. Recap : https://www.sqlite.org/lang_corefunc.html > LENGTH 함수 사용
DROP TABLE movies;

CREATE TABLE movies (
	title TEXT NOT NULL UNIQUE,
  released INTEGER NOT NULL CHECK (released > 0), -- 1, 2, 3, ... 
  overview TEXT NOT NULL CHECK (LENGTH(overview) <= 100),
  rating REAL NOT NULL CHECK (rating BETWEEN 0 AND 10), -- 1.2, 9.6 ...
  director TEXT,
  for_kids INTEGER NOT NULL DEFAULT 0 CHECK (for_kids BETWEEN 0 AND 1)
  -- poster BLOB 
) STRICT; 

INSERT INTO movies
	(title, rating, released, overview)
VALUES
	('The Lord of The Rings', 0.5, 1, 'Ring and hobbits'),
  ('Dune: Part One', 10, 1, 'Sand');
  
-- 9. Primary Keys : 해당 개념을 정말 중요
DROP TABLE movies;

-- 데이터베이스의 테이블은 두가지 유형의 기본키를 가질 수 있음 : 기본키는 고유하고 불변해야 함
-- natural primary key(자연기본키), surrogate primary key(대체 기본키) : 대체 기본키를 사용하는 것이 좋음
CREATE TABLE movies (
  movie_id INTEGER PRIMARY KEY AUTOINCREMENT, -- surrogate primary key: 다른 열과 논리적 관계가 없음, 인위적인 열 : 고유식별자가 필요해서 만듬
  -- AUTOINCREMENT : 항상 새롭고 고유한 movie ID를 기본키로 갖게 될 것을 보장 받음 : SQLite에 특화된 기능
	title TEXT PRIMARY KEY NOT NULL UNIQUE, -- natural primary key: 다른 열과 논리적 관계가 있음, 테이블에서 파생 : 고유하게 유지하기 어려움
  released INTEGER NOT NULL CHECK (released > 0), -- 1, 2, 3, ... 
  overview TEXT NOT NULL CHECK (LENGTH(overview) <= 100),
  rating REAL NOT NULL CHECK (rating BETWEEN 0 AND 10), -- 1.2, 9.6 ...
  director TEXT,
  for_kids INTEGER NOT NULL DEFAULT 0 CHECK (for_kids BETWEEN 0 AND 1) -- 0 or 1
  -- poster BLOB 
) STRICT;

INSERT INTO movies (title, rating, released, overview)
	VALUES('The Lord of The Rings', 0.5, 1, 'Ring and hobbits'), ('Dune: Part One', 10, 1, 'Sand');