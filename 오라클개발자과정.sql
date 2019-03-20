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

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';


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


SELECT * FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER = 'NLS_CHARACTERSET'; 

--[2일차]
--오라클 함수

/*
단일행 함수의 종류 p.49
1) 문자형 함수 : 문자를 입력받고 문자와 숫자 값 모두를 return할 수 있다.
2) 숫자형 함수 : 숫자를 입력받고 
3) 날짜형 함수
4) 변환형 함수
5) 일반적인 함수
*/

-- 문자열 함수
SELECT INITCAP('the super man') from dual;
SELECT LOWER('AAA'), UPPER('aaaa') FROM DUAL;
SELECT LENGTH('abcd') FROM DUAL;

-- 결합연산자 ||
-- CONCAT()

SELECT 'A'||'B'||'C' as "DATA" FROM DUAL;
SELECT CONCAT('A','B') FROM DUAL;

SELECT CONCAT(ENAME, JOB) FROM EMP;
SELECT ENAME || '    '|| JOB FROM EMP;

-- 부분 문자열 추출
-- JAVA(SUBSTRING)
-- ORACLE (SUBSTR)
SELECT SUBSTR('ABCDE',2,3) FROM DUAL;
SELECT SUBSTR('ABCDE',3,1) FROM DUAL;
SELECT SUBSTR('ABCDE',3) FROM DUAL;     -- 3번째 뒤 다
SELECT SUBSTR('ABCDE',-2,1) FROM DUAL;  -- 뒤에서 2번째에서 1글자

/*
 사원테이블에서 ENAME 컬럼 데이터에 대해서 첫글자는 소문자로 나머지글자는 대문자로 출력하되
하나의 컬럼으로 출력하세요
-- 컬럼의 가명칭은 : FULLNAME
-- 첫글자와 나머지 문자사이에 공백하나를 넣으세요
*/
SELECT LOWER(SUBSTR(ENAME,1,1))||' '||UPPER(SUBSTR(ENAME,2)) as "FULLNAME" FROM EMP;

-- LPAD (왼쪽 채우기) , RPAD( 오른쪽 채우기)
SELECT LPAD('ABC',10,'*') FROM DUAL;
SELECT RPAD('ABC',10,'*') FROM DUAL;

-- QUIZ
-- 사용자비번 : hong1006
-- 화면 ho***** 
SELECT RPAD(SUBSTR('hong1006',1,2),LENGTH('hong1006'), '*') as "PASSOWRD" FROM DUAL;
SELECT RPAD(SUBSTR('1004',1,2),LENGTH('1004'), '*') as PASSWORD FROM DUAL;

-- EMP 테이블에서 ENAME컬럽의 데이터를 출력하는데 첫글자만 출력하고 나머지는 '*'로 표시하세요
SELECT RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME), '*')  FROM BITUSER.EMP;


CREATE TABLE MEMBER2 (
 ID NUMBER,
 JUMIN VARCHAR2(14)
);

INSERT INTO MEMBER2 (ID, JUMIN) VALUES(100, '123456-1234567');
INSERT INTO MEMBER2 (ID, JUMIN) VALUES(200, '234567-1234567');
COMMIT;

SELECT * FROM MEMBER2;

SELECT ID||':'||RPAD(SUBSTR(JUMIN,1,7),LENGTH(JUMIN), '*') AS JUMINNUMBER FROM MEMBER2;

-- RTRIM : 오른쪽 문자 지워라
SELECT RTRIM('MILLLER','ER') FROM DUAL;
SELECT LTRIM('MILLLER','MIL') FROM DUAL;
SELECT LTRIM('MILLLLLLLLLLLLER','MIL') FROM DUAL;

SELECT '>'||RTRIM('MILLER    ')||'<' FROM DUAL;

-- 치환함수(REPLACE)
SELECT REPLACE('MILLER', 'LL','OO') FROM DUAL;

-- 숫자함수
--ROUND(반올림함수)
--TRUNC(절삭함수)
--나머지 구하는 함수 (MOD())

SELECT ROUND(12.345,0) AS "R" FROM DUAL;  -- 12
SELECT ROUND(12.645,0) AS "R" FROM DUAL;  -- 13
SELECT ROUND(12.345,1) AS "R" FROM DUAL;  -- 12.3
SELECT ROUND(12.345,-1) AS "R" FROM DUAL;  -- 10
SELECT ROUND(15.345,-1) AS "R" FROM DUAL;  -- 20

SELECT TRUNC(12.345,0) AS "R" FROM DUAL;  -- 12
SELECT TRUNC(12.777,0) AS "R" FROM DUAL;  -- 12
SELECT TRUNC(12.345,1) AS "R" FROM DUAL;  -- 12.3
SELECT TRUNC(12.345,-1) AS "R" FROM DUAL;  -- 10
SELECT TRUNC(15.345,-1) AS "R" FROM DUAL;  -- 10
---------------------------------------------------------
SELECT ROUND(12.78965462452432342) FROM DUAL;
SELECT TRUNC(12.78965462452432342) FROM DUAL;

-- 나머지
SELECT MOD(10,3) FROM DUAL;
SELECT MOD(0,0) FROM DUAL;

-------------------------------------------------------
-- 날짜함수
SELECT SYSDATE FROM DUAL;

SELECT * FROM SYS.NLS_SESSION_PARAMETERS;

SELECT SYSDATE + 5 FROM DUAL;
SELECT SYSDATE - 5 FROM DUAL;
SELECT SYSDATE - TO_DATE('20190122','YYMMDD') FROM DUAL;

SELECT MONTHS_BETWEEN('2018-02-27', '2010-02-27') FROM DUAL;

SELECT ROUND(MONTHS_BETWEEN(SYSDATE, '2010-01-01'),1) FROM DUAL;

SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '2010-01-01'),1) FROM DUAL;

SELECT TO_DATE('2019-03-20','YYYY-MM-DD')+100 FROM DUAL;
SELECT SYSDATE + 1000 FROM DUAL;

-- QUIZ
--1. 사원테이블에서 사원들의 입사일에서 현재날짜까지의 근속월수를 구하세요
-- 단, 근속월수는 정수부분만 출력하세요
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) as "근속월수" FROM EMP;

--2. 한달이 31일 이라는 기준에서 근속월수를 구하세요
SELECT TRUNC((SYSDATE-HIREDATE)/31) AS "근속월수" FROM EMP;


-----------------------------------------------------------------
--[변환함수] Today's POINT
-- Oracle : 문자, 숫자, 날짜
-- TO_CHAR() : 숫자 -> 문자
  SELECT TO_CHAR(1235) FROM DUAL;

-- TO_NUMBER() : 문자 -> 숫자
  SELECT TO_NUMBER('1235') FROM DUAL;
  SELECT '100' + 100 FROM DUAL;
  SELECT TO_NUMBER('100')+100 FROM DUAL;
  
-- TO_DATE()
  
  /*
  오라클 기본 데이터 타입
  CREATE TABLE 테이블명(컬러명 타입)
  CREATE TABLE MEMBER(AGE NUMBER) >> 1건 INSERT.. 1000건
  
  JAVA : CLASS PERSON >> PERSON P=NEW PERSON(); 1건
        List<PERSON> personList =new ArrayList();
        personlist.add(new person);
  ORACLE : CREATE PERSON >>  INSERT TNTO PERSON VALUES ();
  
  문자 타입
  -- CHAR(20) : 20 BYTE >> 한글10자, 영문자 20자 : 고정길이 문자열
  -- VARCHAR2(20) : 20 BYTE >>  한글 10자, 영문자 20자 : 가변길이 문자열
  
  CHAR(20) >> '홍길동' >> 6BYTE >> '홍길동              ' >> 20BYTE에 저장
  VARCHAR(20) >> '홍길동' >> 6BYTE >> '홍길동' >> 6BYTE에 저장
  
  고정길이 데이터:  남, 여 >> CHAR(2)
  성능상 CHAR가 VARCHAR2보다 검색에서 우선순위임
  
  결국 문제는 한글
  UNICODE (2BYTE) : 한글, 영문자, 특수문자, 공백 모두 2BYTE로 통일
  
  NCHAR(20) : UNICODE 20글자
  NVARCHAR2(30) : UNICODE 30글자
  
  */
  
  -- 1. TO_NUMBER : 문자를 숫자로
  SELECT '1'+1 FROM DUAL;
  
  SELECT TO_NUMBER('1')+1 FROM DUAL;
  
  -- 2. TO_CHAR : 숫자를 형식문자로, 날짜를 형식문자로
  SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY')||'년' FROM DUAL;
  
  SELECT TO_CHAR(SYSDATE, 'YEAR'), 
   TO_CHAR(SYSDATE, 'MM'),
  TO_CHAR(SYSDATE, 'DAY'),
  TO_CHAR(SYSDATE, 'DY')
  FROM DUAL;
  
  SELECT TO_CHAR(SYSDATE, 'YYYY MM DD') FROM DUAL;
  SELECT TO_CHAR(SYSDATE, 'YYYY"년"MM"월"DD"일"') FROM DUAL;
  
  SELECT EMPNO, ENAME, HIREDATE, 
         TO_CHAR(HIREDATE,'YYYY') as "입사년도",
         TO_CHAR(HIREDATE,'MM') as "입사월"
  FROM EMP
  WHERE TO_CHAR(HIREDATE,'MM')='12';
  
  SELECT TO_CHAR(133354, '999,999') FROM DUAL;
  SELECT '>'||TO_CHAR(12345,'0999999')||'<' FROM DUAL;  
  SELECT '>'||TO_CHAR(12345,'0999,999')||'<' FROM DUAL;  
  SELECT '>'||TO_CHAR(12345,'0999,999.9')||'<' FROM DUAL; 
  SELECT '>'||TO_CHAR(12345,'$999,999')||'<' FROM DUAL;  
  
  ------------------------------------------------------------
  /*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 부여해서 출력하고
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 연봉의 10%(연봉 * 1.1)인상한 값을 
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
  
  
  SELECT LAST_NAME||' '||FIRST_NAME AS FULLNAME,
  TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') AS HIRE_DATE, TO_CHAR(SALARY*12,'$999,999') AS "연봉", TO_CHAR((SALARY*12)*1.1,'$999,999') AS "인상안"
  FROM HR.EMPLOYEES
  WHERE TO_CHAR(HIRE_DATE,'YYYY') > '2005'
  ORDER BY "연봉" DESC;  -- ORDER BY절에 별칭이 올 수 있다. (ORDER BY는 가장 마지막에 실행)
  
  --------------------------------------------------------------------------------
  
  -- 일반함수
  -- NVL
  -- DECODE : JAVA IF문
  -- CASE : JAVA CASE문
  
  SELECT COMM, NVL(COMM, 0) FROM EMP;
  
  CREATE TABLE T_EMP(
   ID NUMBER(6),
   JOB VARCHAR2(20)
  );
  
  SELECT * FROM T_EMP;
  
  INSERT INTO T_EMP (ID, JOB) VALUES(100, 'IT');
  INSERT INTO T_EMP (ID, JOB) VALUES(200, 'SALES');
  INSERT INTO T_EMP (ID, JOB) VALUES(300, 'MGR');
  INSERT INTO T_EMP (ID) VALUES(400);
  INSERT INTO T_EMP (ID, JOB) VALUES(500, 'MGR');
  COMMIT; 
  
  SELECT * FROM T_EMP;
  
  -- 1. NVL
  SELECT ID, JOB, NVL(JOB, 'EMPTY...') FROM T_EMP;
  
  -- 2. NVL2 >>  NULL이 아닌 경우, NULL인 경우
  SELECT ID, JOB, NVL2(JOB, JOB||'입니다', 'EMPTY') FROM T_EMP;
  
  SELECT ID, JOB, NVL2(JOB, 'AAA', 'BBB') FROM T_EMP;
  
  -- 3 DECODE : POINT (통계데이터 : IF, SWITCH)
  SELECT ID, DECODE(ID,  100, 'IT', 200, 'SALES', 300, 'MGR', 'ETC') FROM T_EMP;
  
  SELECT JOB, DECODE(JOB, 'IT',1) FROM T_EMP;
  
  SELECT COUNT(DECODE(JOB,'IT',1)) as "IT",
  COUNT(DECODE(JOB,'SALES',1)) as "SALES",
  COUNT(DECODE(JOB,'MGR',1)) as "MGR"
  FROM T_EMP;
  
  
  SELECT JOB, COUNT(JOB) FROM T_EMP
  GROUP BY JOB;
  
  /*
  EMP테이블에서 부서번호가 10이면 "인사부", 20이면 "관리부", 30이면 "회계부", 나머지는 "기타부서"
  */
 SELECT DECODE(DEPTNO,10,'인사부', 20, '관리부', 30, '회계부', '기타부서') FROM EMP;
 
 SELECT CASE WHEN DEPTNO =10 THEN '인사부'
             WHEN DEPTNO =20 THEN '관리부'
             WHEN DEPTNO =30 THEN '회계부'
             ELSE '기타부서'
        END as "부서"
  FROM EMP;
  
  -- QUIZ
  CREATE TABLE T_EMP2(
    ID NUMBER(2),
    JUMIN CHAR(7)
  );
  
  INSERT INTO T_EMP2 (ID, JUMIN) VALUES(1, '1234567');
  INSERT INTO T_EMP2 (ID, JUMIN) VALUES(2, '2234567');
  INSERT INTO T_EMP2 (ID, JUMIN) VALUES(3, '3234567');
  INSERT INTO T_EMP2 (ID, JUMIN) VALUES(4, '4234567');
  INSERT INTO T_EMP2 (ID, JUMIN) VALUES(5, '5234567');
  COMMIT;
  
  SELECT * FROM T_EMP2;
  
  SELECT ID, DECODE(SUBSTR(JUMIN,1,1), '1', '남성', '2', '여성', '기타') AS "성별"
  FROM T_EMP2;
  
  
  /*
  부서번호가 20번인 사원중에서 SMITH라는 이름을 가진 사원이라면 HELLO문자 출력하고
  부서번호가 20번인 사원중에서 SMITH라는 이름을 가진 사원이 아니라면 WORLD문자 출력하고
  부서번호가 20번인 사원이 아니라면 ETC문자 출력  
  */
  
  SELECT DECODE(ENAME, 'SMITH', 'HELLO', 'WORLD')   FROM EMP WHERE DEPTNO='20'
  UNION ALL
  SELECT 'ETC'   FROM EMP WHERE DEPTNO  != '20';
  
  SELECT DECODE(DEPTNO, 20, DECODE(ENAME,'SMITH', 'HELLO', 'WORLD'),'ETC')FROM EMP;
  
  -- CASE문
  /*
    CASE 조건시 WHEN 결과1 THEN 출력1
              WHEN 결과2 THEN 출력2
              WHEN 결과3 THEN 출력3
              END '컬럼명'
  */
  CREATE TABLE T_ZIP(
    ZIPCODE NUMBER(10)
  );
  
  INSERT INTO T_ZIP(ZIPCODE) VALUES(2);
  INSERT INTO T_ZIP(ZIPCODE) VALUES(31);
  INSERT INTO T_ZIP(ZIPCODE) VALUES(32);
  INSERT INTO T_ZIP(ZIPCODE) VALUES(33);
  INSERT INTO T_ZIP(ZIPCODE) VALUES(41);
  COMMIT;  
  
  SELECT CASE ZIPCODE WHEN 2 THEN '서울'
                      WHEN 31 THEN '경기'
                      WHEN 32 THEN '강원'
                      WHEN 41 THEN '제주'
                      ELSE '기타지역'
         END "REGIONNAME"
   FROM T_ZIP;
   
   /*
   사원테이블에서 사원급여가 1000달러 이하이면 '4급'
   1001달러 2000이하면 '3급'
   2001달러 3000이하면 '2급'
   3001달러 4000이하면 '1급'
   4001달러 이상이면 '특급'이라는 데이터를 출력
   */
   SELECT CASE WHEN SAL<=1000 THEN '4급'
               WHEN SAL<=2000 THEN '3급'
               WHEN SAL<=3000 THEN '2급'
               WHEN SAL<=4000 THEN '1급'
               WHEN SAL>=4001 THEN '특급'
          END AS "회원등급"
   FROM EMP;
   
   SELECT CASE WHEN SAL<=1000 THEN '4급'
               WHEN SAL BETWEEN 1011 AND 2000 THEN '3급'
               WHEN SAL BETWEEN 2001 AND 3000 THEN '2급'
               WHEN SAL BETWEEN 3001 AND 4000 THEN '1급'
               WHEN SAL>=4001 THEN '특급'
          END AS "회원등급"
   FROM EMP;
   
   SELECT TABLE_NAME FROM ALL_TABLES WHERE OWNER='HR';
   
   -----------------------------------------------------------------
   -- 오라클 PDF 75PAGE
   -- 집계함수
   -- 1. COUNT(*) : ROW수, COUNT(컬럼명) 데이터건수(NULL을 포함하지 않음)
   -- 2. SUM()
   -- 3. AVG()
   -- 4. MAX()
   -- 5. MIN()
   
   /*
   1. 집계함수는 대부분 GROUP BY절과 같이 사용
   2. 모든 집계함수는 NULL값을 무시
   3. SELECT 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 GROUP BY 절에 명시되어야 한다
   */
 
  SELECT COUNT(*) FROM EMP;  
  SELECT COUNT(COMM) FROM EMP;  -- NULL은 제외
  SELECT COUNT(NVL(COMM,'1')) FROM EMP;
  
  SELECT SUM(SAL) FROM EMP; --29025
  SELECT ROUND(AVG(SAL)) FROM EMP; --2073
  SELECT MAX(SAL) FROM EMP;
  SELECT MIN(SAL) FROM EMP;
  -- POINT 집계함수 결과는 1개row
  
  SELECT EMPNO, COUNT(EMPNO) FROM EMP;  ---(X) EMPNO는 14건, 집계는 1건
  SELECT SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL), COUNT(SAL), COUNT(*) FROM EMP;
  
  
  -- 사장님이 회사 총수당이 얼마나 지급되지?  (수당의 평균)
  SELECT TRUNC(AVG(COMM),0) FROM EMP;  -- 721
  SELECT TRUNC(AVG(NVL(COMM,0)),0) FROM EMP;  --309
  SELECT TRUNC(SUM(COMM)/COUNT(*)) FROM EMP;  -- 309
  
  SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB;
  SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB;
  
  SELECT DEPTNO,SUM(SAL) FROM EMP GROUP BY DEPTNO;
  SELECT DEPTNO,AVG(SAL) FROM EMP GROUP BY DEPTNO;
  
  -- 부서별 평균급여를 구하세요
  SELECT DEPTNO, ROUND(AVG(SAL)) AS AVG
  FROM EMP
  GROUP BY DEPTNO;
  
  -- 직종별 평균급여를 구하세요
  SELECT JOB, ROUND(AVG(SAL)) AS AVG
  FROM EMP
  GROUP BY JOB;
  
  -- 직종별 평균급여, 급여합, 최대급여, 최소급여, 건수를 출력하세요
  SELECT AVG(SAL), SUM(SAL), MAX(SAL), MIN(SAL), COUNT(SAL)
  FROM EMP
  GROUP BY JOB;
  
  -- 부서별, 직종별 급여의 합을 구하세요
  SELECT DEPTNO, JOB, SUM(SAL)
  FROM EMP
  GROUP BY DEPTNO, JOB;
  
  /*
  SELECT     4
  FROM       1
  WHERE      2
  GROUP BY   3
  ORDER BY   5
  */
  
  /*
  직종별 평균급여가 3000달러 이상인 사원의 직종과 평균급여를 출력하세요
  
  */
  SELECT JOB, AVG_SAL
  FROM (
  SELECT JOB, AVG(SAL) AS AVG_SAL
  FROM EMP
  GROUP BY JOB
  ) WHERE AVG_SAL>3000;
  
  
  SELECT JOB, AVG(SAL) AS AVG_SAL
  FROM EMP
  GROUP BY JOB
  HAVING AVG(SAL) >3000;  -- HAVING이 SELECT보다 먼저이므로 SELECT의 ALIAS를 쓸 수 없다.
 
 
 /* 
  CREATE VIEW TTT AS
  SELECT JOB, AVG(SAL) AS AVG_SAL
  FROM EMP
  GROUP BY JOB;
  
 DROP VIEW TTT;
 */
 
 /*
 SELECT      5
 FROM        1
 WHERE       2
 GROUP BY    3
 HAVING      4
 ORDER BY    6
 */
 
 /*
 1. 사원테이블에서 직종별 급여합을 출력하되 수당은 지급받고 급여의 합이 5000이상인 사원들의 목록을 출력하세요
 --급여의 합이 낮은 순으로 출력하세요
 */
 SELECT *
 FROM EMP
 WHERE JOB IN (
 SELECT JOB
 FROM EMP
 WHERE COMM IS NOT NULL
 GROUP BY JOB
 HAVING SUM(SAL) >= 5000
 )ORDER BY SAL;
 
SELECT JOB, SUM(SAL)
 FROM EMP
 WHERE COMM IS NOT NULL
 GROUP BY JOB
 HAVING SUM(SAL) >= 5000
 ORDER BY SUM(SAL) ASC;
 


 
 /*
 2. 사원테이블에서 부서인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하세요
 */
 SELECT DEPTNO, COUNT(DEPTNO), SUM(SAL)
 FROM EMP
 WHERE DEPTNO IN (
 SELECT DEPTNO 
 FROM EMP
 GROUP BY DEPTNO
 HAVING COUNT(DEPTNO)>4
 )GROUP BY DEPTNO;
 
 SELECT DEPTNO, COUNT(DEPTNO), SUM(SAL)
 FROM EMP
 GROUP BY DEPTNO
 HAVING COUNT(DEPTNO)>4;
 /*
 3. 사원테이블에서 직종별 급여의 합이 5000을 초과하는 직종과 급여의 합을 출력하세요
 단 판매직종(SALESMAN)은 제외하고 급여합으로 내림차순 정렬하세요
 */
 SELECT JOB, SUM(SAL)
 FROM EMP
 WHERE JOB !='SALESMAN'
 GROUP BY JOB
 HAVING SUM(SAL)>5000
 ORDER BY SUM(SAL) DESC;
 
 