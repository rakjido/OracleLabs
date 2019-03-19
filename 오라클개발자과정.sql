/*
[1일차 수업}

1. 오라클 소프트웨어 다운로드

2. Orcale Database 11g 무료설치

3. Oracle 설치

4. sqlplus제공 : command환경이어서 사용하기 불편

5. 별도의 tool 설치 무료 (sqldeveloper), 유료 (토드, 오렌지, SqlGate)

6. SqlDeveloper 툴을 통해서 Oracle Server접속
>> HR 계정  : unlock
>> bituser 계정생성

7. 현재 접속 계정확인
show user;


CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;


CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;


*/


-- 1. 사원 테이블에서 모든 테이블을 출력하세요
select * from emp;
SELECT * FROM EMP; -- 쿼리 문장은 대소문자를 구분하지 않습니다.

SELECT * FROM SALGRADE;

-- 2. 특정 컬럼 데이터 출력하기
SELECT EMPNO, ENAME, SAL FROM EMP;

-- 3. 컬럼에 가명칭(별칭 : ALIAS) 부여하기
SELECT EMPNO AS "사 번", ENAME AS "이 름", SAL AS "월 급" FROM EMP;

-- Oracle 데이터 문자열(문자열 데이터)는 대소문자를 엄격하게 구분
-- 문자열표기 '문자열'
SELECT EMPNO, ENAME FROM EMP WHERE ENAME=UPPER('king');

-- Oracle SQL : 연산자(결합연산자||와 산술연산자(+)를 구분)
SELECT '사원의 이름은 '||ENAME ||'입니다' AS "사원정보" 
FROM EMP;

-- 테이블의 기본정보 조회
DESC EMP;

SELECT EMPNO || ENAME -- NUMBER || VARCHAR2 내부적으로 형변환을 해서 VARHCAR2로 바꿈
FROM EMP;

-- SELECT EMPNO + ENAME -- 안됨
-- FROM EMP;

-- 사장님 우리회사에 직종이 몇개나 있니?
-- DISTINCT : 중복 데이터 제거\
-- DISTINCT원리 GROUPING
SELECT DISTINCT JOB FROM EMP;

SELECT DISTINCT JOB, DEPTNO FROM EMP ORDER BY JOB;

SELECT DISTINCT DEPTNO, JOB FROM EMP ORDER BY DEPTNO;

----------------------------------------------------------------------
-- Oracle (SQL언어)
-- JAVA와 연산자가 거의 동일 (+,-,*,/)
-- 나머지구하기만 다름 : MOD

-- 사원테이블ㅇ에서 사원의 급여를 100달러 인상한 결과를 출력하세요
DESC EMP;
SELECT EMPNO, ENAME, SAL, SAL+100 AS "인상급여" FROM EMP;

SELECT 100+100 FROM DAUL;     -- 200
SELECT 100||100 FROM DUAL;    --100100
SELECT '100'+100 FROM DUAL;   -- 200
SELECT 'A100'+100 FROM DUAL;  -- 에러


-- 비교연산자 
-- >, <, >=, <=
-- Java의 같다 == /할당 =
-- Oracle 같다 = / 같지 않다 !=

-- 논리연산자
-- AND, OR, NOT

-- 조건절 (원하는 row만 가져오겠다)
SELECT *
FROM EMP
WHERE SAL>=3000;

-- 사번이 7788인 사원의 사번, 이름, 직종, 입사일을 출력하시오
-- 실행순서 : 1) FROM, 2) WHERE, 3) SELECT
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
WHERE EMPNO=7788;

-- 사원의 이름이 KING인 사원의 사번, 이름, 급여정보를 출력하세요
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME=UPPER('KING');

-- 급여가 2000달러 이상이면서 직종이 MANAGER인 사원의 모든 정보를 출력하세요
SELECT *
FROM EMP
WHERE SAL>2000 AND JOB='MANAGER';

-- 급여가 2000달러 이상이거나 직종이 MANAGER인 사원의 모든 정보를 출력하세요
SELECT *
FROM EMP
WHERE SAL>2000 OR JOB='MANAGER';

-----------------------------------------------------------------
-- 오라클 날짜
SELECT SYSDATE FROM DUAL;
SELECT TO_DATE('20190319', 'yyyymmdd') FROM DUAL;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';


-- MS SQL : SELECT GETDATE()

SELECT * 
FROM EMP
WHERE HIREDATE>'1980-12-17';

SELECT * 
FROM EMP
WHERE HIREDATE=TO_DATE('19801217','YYYYMMDD');

-- 오라클 시스템 테이블 (오라클의 FORMAT설정)
SELECT * FROM SYS.NLS_SESSION_PARAMETERS;
-- NLS_DATE_FORMAT    YYYY-MM-DD HH24:MI:SS
-- NLS_DATE_LANGUAGE  KOREAN
-- NLS_TIME_FORMAT    HH24:MI:SSXFF


-- 오라클 날짜 조회 : '2019-12-12'
SELECT * 
FROM EMP
WHERE HIREDATE='1980-12-17';


SELECT * 
FROM EMP
WHERE HIREDATE='1980/12/17';

SELECT * 
FROM EMP
WHERE HIREDATE='80/12/17';
-- 형식을 바꾸기 전에는 RR-MM-DD

-- 사원의 급여가 2000이상이고 4000이하인 모든 사원의 정보를 출력하세요
SELECT *
FROM EMP
WHERE SAL>=2000 AND SAL<=4000;

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 4000;

-- 사원의 급여가 2000초과이고 4000미만인 모든 사원의 정보를 출력하세요

SELECT *
FROM EMP
WHERE SAL > 2000 AND SAL <4000;


-- 부서번호가 10번 또는 20번 또는 30번인 사원의 사번, 이름, 급여, 부서번호를 출력하세요
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN ('10', '20', '30');


-- 부서번호가 10번 또는 20번이 아닌 사원의 사번, 이름, 급여, 부서번호를 출력하세요
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO NOT IN ('10', '20');  -- DEPTNO !=10 AND DEPTNO!=20


-- POINT : Oracle값이 없다.(데이터 없다) >> null
-- null 필요악
CREATE TABLE MEMBER (
 USERID VARCHAR2(20) NOT NULL , -- 한글 10자, 영문 20자
 NAME VARCHAR2(20) NOT NULL,
 HOBBY VARCHAR2(50)             -- DEFAULT NULL : NULL값을 허용
);

DESC MEMBER;

INSERT INTO MEMBER(USERID, NAME, HOBBY) VALUES ('HONG', '홍길동', '농구');
COMMIT;

INSERT INTO MEMBER(USERID, NAME) VALUES ('KIM', '김유신');
COMMIT;
-- 실제반영은 COMMIT해야 (PC끄면 사라짐)

SELECT * FROM MEMBER;

-- 수당(COMM)을 받지않는 모든 사원의 정보를 출력하세요
-- 0도 데이터 취급(받는 조건 포함)
SELECT *
FROM EMP
WHERE COMM IS NULL;

-- 수당(COMM)을 받는 모든 사원의 정보를 출력하세요
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

-- 사원테이블에서 사번, 급여, 수당, 총급여를 출력하세요
-- 급여+수당

SELECT EMPNO, SAL, COMM, SAL + NVL(COMM,0) AS "총급여"
FROM EMP;

-- POINT NULL
--1. NULL과의 모든 연산은 그 결과가 NULL
--2. 위 문제를 해결 : NVL(), NVL2() >> MS-SQL : CONVERT(), MYSQL : IFNULL


--------------------------------------------------------------
-- DQL (data query language) : SELECT
-- DDL (데이터 정의서) : CREATE,  ALTER, DROP (객체 생성, 수정, 삭제)

CREATE TABLE BOARD (
  BOARDID NUMBER NOT NULL,
  TITLE VARCHAR2(20) NOT NULL,
  CONTENT VARCHAR2(2000) NOT NULL,
  HP VARCHAR2(20) 
);


DESC BOARD;

-- DML(데이터 조작어)반영 여부에서 결정 : 실반영(COMMIT), 취소(ROLLBACK) 반드시 수행
-- INSERT, UPDATE, DELETE 작업

INSERT INTO BOARD(BOARDID, TITLE, CONTENT) VALUES(100,'오라클', '할만하네');
SELECT * FROM BOARD;
-- 의사결정 : 실제 반영할거야 (COMMIT)
-- 의사결정 : 실제 반영안할거야 (ROLLBACK)

ROLLBACK;
COMMIT;


INSERT INTO BOARD(BOARDID, TITLE, CONTENT) VALUES(200,'자바', '그립다');
INSERT INTO BOARD(BOARDID, TITLE, CONTENT) VALUES(300,'자바2', '그립다2');
COMMIT;

SELECT BOARDID, NVL(HP,'EMPTY') AS "HP" FROM BOARD;

-- 문자열 검색
-- 주소검색 : 검색어 '역삼' -> 역삼 단어가 있는 모든 문장  (LIKE 검색)
-- 문자열 패턴 검색 (LIKE 연산자)

SELECT * FROM EMP
WHERE ENAME LIKE '%A%'; -- ENAME 컬럼에 데이터 A들어있는 모은 이름

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%S';

SELECT * FROM EMP
WHERE ENAME LIKE '%A%A%'; -- A가 2개만 있으면 만족


SELECT *
FROM EMP
WHERE ENAME LIKE '_A%';  -- 2번째 글자가 'A'

SELECT *
FROM EMP
WHERE ENAME LIKE '__A%';  -- 2번째 글자가 'A'

-- 오라클 과제 (REQULAR EXPRESSION) 상세 검색
-- 정규표현 예제 5개 만들기

SELECT * FROM EMP WHERE REGEXP_LIKE(ENAME, '[A-C]');

-------------------------------------------------------------

-- 데이터 정렬하기
-- ORDER BY 컬럼명 : 문자, 숫자, 날짜
-- 오름차순 : ASC
-- 내림차순 : DESC
SELECT * 
FROM EMP 
ORDER BY SAL;

SELECT *
FROM EMP
ORDER BY SAL DESC;



-- 입사일이 가장 늦은 순으로 정렬해서 사번, 이름, 급여, 입사일 데이터를 출력하세요
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;


/*
SELECT   3)
FROM     1)
WHERE    2)
ORDER BY 4)   SORT가 가장 시간이 드는 작업이기때문에 마지막에 정렬
*/


-- 매니저의 사번, 이름, 급여, 직종, 입사일을 가장 입사일이 늦은 순으로 보여주시오
SELECT EMPNO, ENAME, SAL, JOB, HIREDATE
FROM EMP
WHERE JOB='MANAGER'
ORDER BY HIREDATE DESC;

-- ORDER BY 컬러명 DESC, 컬럼명 ASC, 컬럼명 DESC

-- JOB을 오름차순으로 하는 조건에서 다시 DEPTNO를 내림차순으로 정렬
SELECT JOB, DEPTNO
FROM EMP
ORDER BY JOB ASC, DEPTNO DESC;

------------------------------------------------------------------------------
-- 연산자
-- 교집합(UNION) : 테이블과 테이블의 데이터를 합치는 것(중복값 제외)
-- 합집합(UNION ALL) : 중복값 허용

CREATE TABLE UTA(NAME VARCHAR2(20));

INSERT INTO UTA(NAME) VALUES('AAA');
INSERT INTO UTA(NAME) VALUES('BBB');
INSERT INTO UTA(NAME) VALUES('CCC');
INSERT INTO UTA(NAME) VALUES('DDD');
COMMIT;

SELECT * FROM UTA;

CREATE TABLE UT(NAME VARCHAR2(20));

INSERT INTO UT(NAME) VALUES('AAA');
INSERT INTO UT(NAME) VALUES('BBB');
INSERT INTO UT(NAME) VALUES('BBB');
COMMIT;

SELECT * FROM UT;

-- UNION
SELECT * FROM UTA
UNION
SELECT * FROM UT;

-- UNION ALL
SELECT * FROM UTA
UNION ALL
SELECT * FROM UT;


-- UNION 규칙
--1. 대응되는 컬럼의 타입이 동일해야 한다
SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DEPTNO, DNAME FROM DEPT;

-- 실무 > SUBQERY (IN LINE VIEW)
SELECT *
FROM (
SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DEPTNO, DNAME FROM DEPT
) ORDER BY EMPNO DESC;




--2. 대응되는 컬럼의 갯수가 동일해야 한다 (NULL사용)
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC, NULL FROM DEPT;

-- 초보 기초과정 완료
-----------------------------------------------------------------------------