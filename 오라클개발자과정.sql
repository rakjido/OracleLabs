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
 
 
 --1. empno 와 ename 결합하여 출력하시오.
 SELECT EMPNO||ENAME
 FROM EMP;
 
 -- 2. 이름이 SMITH 이고 직업이 CLERK 인 사원의 사원번호, 이름, 직업, 급여를 출력하시오.
 
 SELECT EMPNO, ENAME, JOB, SAL 
 FROM EMP
 WHERE ENAME='SMITH' AND JOB='CLERK';
 
-- 3. 사원번호가 10 이상이고 급여가 2000 이상인 사람의 모든 정보를 출력하시오.

 SELECT *
 FROM EMP
 WHERE EMPNO>10 AND SAL >2000;

-- 4. 수당이 null 인 모든 사람의 정보를 출력하시오.
 SELECT *
 FROM EMP
 WHERE COMM IS NULL;

-- 5. 사번, 이름, 급여, 수당, 총급여를 출력하시오.
 SELECT EMPNO, ENAME, SAL, COMM, SAL + NVL(COMM,0) as TOTAL_INCOME
 FROM EMP;
 

-- 6. 이름에서 A로 시작하는 사원의 사번,이름, 급여, 수당 을 출력하시오.
-- 단, 수당이 null이라면 'empty' 로 출력하시오.
 SELECT EMPNO, ENAME, SAL, NVL(COMM,0)
 FROM EMP
 WHERE ENAME LIKE 'A%';
 
 
 
-- * HR 계정으로 하세요
--* 1. 부서 번호(department_id)가 50인 사원들의 이메일 아이디를 불러와 아이디를 소문자로 바꾸고 아이디@oracle.com 형식으로 출력하세요.
 SELECT LOWER(EMAIL)||'@oracle.com' AS email
 FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID=50;

--* 출력 : abull@oracle.com

--* 2. 모든 사원의 전화번호를 불러와 앞의 3개 숫자를 010으로 바꾸고 '.'을 '-'로 바꿔서 출력하세요
--* - ex) 515.123.4567 >> 010-123-4567
 SELECT '010-'||SUBSTR(REPLACE(PHONE_NUMBER,'.','-'),5) AS PHONENUMBER
 FROM HR.EMPLOYEES
 ;

--* 3. 부서 번호 별로 급여(salary)의 총합이 얼마인지 출력하되 사원 번호(employee_id)가 100번부터 150번까지인 사람만 계산해서 출력하세요
  SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SAL
  FROM HR.EMPLOYEES
  WHERE EMPLOYEE_ID BETWEEN 100 AND 150
  GROUP BY DEPARTMENT_ID;

--* 4. 입사 연도별로 입사등급을 나눠 출력하고 사원의 이름(first_name)과 성(last_name)을 중간에 공백을 넣어 같이 출력하세요
--* - 2002년 입사 >> 원로
--* - 2005년 입사 >> 청년
--* - 2007년 입사 >> 꼬꼬마
--* - 그외 >> 외계인
  SELECT  CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')<=2002 THEN '원로'
               WHEN TO_CHAR(HIRE_DATE,'YYYY')<=2005 THEN '청년'
               WHEN TO_CHAR(HIRE_DATE,'YYYY')<=2007 THEN '꼬꼬마'
               ELSE '외계인'
          END as GRADE,
          FIRST_NAME||' '||LAST_NAME as FULLNAME
  FROM HR.EMPLOYEES;
--* 출력 : Steven King 외계인

 SELECT TO_CHAR(TO_DATE('20190310','YYYYMMDD'),'DAY') FROM DUAL;
 SELECT TO_CHAR(TO_DATE('20190310','YYYYMMDD'),'D') FROM DUAL;
 
 -----------------------------------------------------------------------------
 -- 오라클.pdf (85p)
 -- [JOIN] 다중테이블로부터 데이터 검색
 
 
 --조인 실습 테이블 구성하기--
--create table M (M1 char(6) , M2 char(10));
--create table S (S1 char(6) , S2 char(10));
--create table X (X1 char(6) , X2 char(10));
--
--insert into M values('A','1');
--insert into M values('B','1');
--insert into M values('C','3');
--insert into M values(null,'3');
--commit;
--
--insert into S values('A','X');
--insert into S values('B','Y');
--insert into S values(null,'Z');
--commit;
--
--insert into X values('A','DATA');
--commit;

select * from m;
select * from s;
select * from x;


-- 종류
-- 등가조인 (EQUI JOIN) 70%
-- 원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1 매핑
-- SQL JOIN 문법
-- ANSI 문법(권장) [INNER] JOIN ON 

-- SQL JOIN
-- WHERE를 JOIN의 조건절로 사용 (어떤 것이 JOIN조건이고 어떤 것이 FROM의 조건절인지 혼동)
SELECT * 
FROM M, S
WHERE M.M1 = S.S1;

-- ANSI 문법
SELECT *
FROM M INNER JOIN S
ON M.M1=S.S1;

SELECT *
FROM M JOIN S -- INNER 생략가능
ON M.M1=S.S1;

SELECT *
FROM M INNER JOIN X
ON M.M1=X.X1;

-- 사원번호, 사원이름, 사원부서번호, 사원부서명을 알고 싶어요
SELECT A.EMPNO, A.ENAME, B.DEPTNO, B.DNAME
FROM EMP A INNER JOIN DEPT B
ON A.DEPTNO = A.DEPTNO;

SELECT *
FROM M, S, X
WHERE M.M1=S.S1
AND M.M1=X.X1;

-- ANSI JOIN

SELECT *
FROM M INNER JOIN S ON M.M1=S.S1
       INNER JOIN X ON M.M1=X.X1;

-- [HR계정]
SELECT * FROM HR.EMPLOYEES;
SELECT * FROM HR.DEPARTMENTS;
SELECT * FROM HR.LOCATIONS;

-- 1.사번, 이름(LAST NAME), 부서번호, 부서이름을 출력하세요 -- 106명
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM HR.EMPLOYEES E JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;

-- 문제점
SELECT COUNT(*) FROM HR.EMPLOYEES; -- 107명

-- 등가조인으로 해결불가 -- OUTER JOIN으로 해결
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM HR.EMPLOYEES E LEFT JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;

-- 2. 사번, 이름(LAST NAME), 부서번호, 부서명, 지역코드, 도시명 출력하세요

SELECT E.EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM HR.EMPLOYEES E JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
                    JOIN HR.LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID;

SELECT E.EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM HR.EMPLOYEES E LEFT JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
                    LEFT JOIN HR.LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID;
                    

--[BITUSER전환]
-- 2. 비등가조인(NON-EQUI JOIN) : 의미만 존재 
-- 원테이블과 대응되는 테이블에 있는 컬럼이 1:1매핑이 되지 않는 경우

SELECT * FROM EMP;
SELECT * FROM SALGRADE;


SELECT *
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

------------------------------------------------------------
-- 3. OUTER JOIN (EQUI JOIN + NULL)
-- OUTER JOIN <주종관계의 파악> >> 주가 되는 테이블의 데이터를 가져오는 방법
-- 문법 ) LEFT OUTER JOIN (왼쪽이 주)
--       RIGHT OUTER JOIN (오른쪽이 주)
--       FULL OUTER JOIN (LEFT, RIGHT JOIN을 UNION         

-- SQL LEFT JOIN
SELECT * 
FROM M, S
WHERE M.M1 = S.S1(+);

-- ANSI LEFT JOIN 
SELECT *
FROM M LEFT JOIN S
ON M.M1=S.S1;
 
-- SQL RIGHT JOIN  
SELECT * 
FROM M, S
WHERE  M.M1 (+) = S.S1;

-- ANSI RIGHT JOIN 
SELECT *
FROM M RIGHT JOIN S
ON M.M1 = S.S1;

-- ANSI FULL OUTER JOIN : LEFT JOIN, RIGHT JOIN을 UNION
SELECT *
FROM M FULL OUTER JOIN S
ON M.M1=S.S1;


-- HR 계정으로 이동

SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID IS NULL;

-- OUTER JOIN
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM HR.EMPLOYEES E LEFT OUTER JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;

-------------------------------------------------------------------------------------
-- SELF JOIN (자기참조)
-- 하나의 테이블에서 특정컬럼이 다른 컬럼을 참조하는 경우

SELECT A.EMPNO, A.ENAME, A.MGR, B.ENAME 
FROM EMP A LEFT JOIN EMP B
ON A.MGR=B.EMPNO;

SELECT * FROM EMP WHERE MGR IS NULL;

-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
 
SELECT COUNT(*) FROM EMP;
 
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
SELECT E.ENAME, E.JOB, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE D.LOC='DALLAS';

 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.

SELECT E.ENAME, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME LIKE '%A%';


-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.

SELECT E.ENAME, D.DNAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.SAL >= 3000;
 
 
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.

SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB='SALESMAN';

 
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다

SELECT E.EMPNO AS "사원번호", E.ENAME AS "사원이름", E.SAL*12 AS "연봉", E.SAL*12+E.COMM AS "실급여", S.GRADE AS "급여등급"
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.COMM IS NOT NULL;
SELECT * FROM SALGRADE;

-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE D.DEPTNO='10';

 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
           JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE D.DEPTNO IN ('10','20')
ORDER BY E.DEPTNO ASC, E.SAL DESC;

 
 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)

SELECT E.EMPNO AS "사원번호", E.ENAME AS "사원이름", D.EMPNO AS "관리자번호", D.ENAME AS "관리자이름"
FROM EMP E LEFT JOIN EMP D
ON E.MGR = D.EMPNO
;


-------------------------------------------------------------------------------
--[SUBQEURY] 오라클.PDF (100 PAGE)
-- SQL의 꽃이다. SQL의 만능 해결사

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >(
  SELECT AVG(SAL)
  FROM EMP
);


-- SUBQUERY
-- 1. SINGLE ROW SUBQUERY : SUBQUERY의 결과가 1개의 ROW(단일값)을 가질 때
-- 2. MULTI ROW SUBQUERY : SUBQUERY의 결과가 1개 이상의 ROW를 가질 때
-- 구분이유 : 사용되는 연산자의 차이
-- MULTI ROW (IN, NOT IN, ANY, ALL)

-- 정의 (SUBQUERY)
-- 1.괄호안에 있어야 한다. (SELECT AVG(SAL) FROM EMP)
-- 2.단일컬럼으로 구성 >> (SELECT SAL, DEPTNO FROM EMP ) (X) 단일 컬럼이 아니다.
-- 3.단독으로 실행 가능해야 한다.

-- 실행순서
-- 1. SUBQUERY 먼저 실행
-- 2. SUBQUERY의 결과를 가지고 MAIN QUERY실행

-- 사원 테이블에서 JONES의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여
  SELECT EMPNO, ENAME, SAL
  FROM EMP 
  WHERE SAL > (
  SELECT SAL FROM EMP WHERE ENAME='JONES'
  );

-- 급여가 2000 이상
SELECT *
FROM EMP
WHERE SAL IN (
SELECT SAL FROM EMP WHERE SAL >2000
);

-- 부하직원이 있는 사원의 사번과 이름을 출력하세요

SELECT *
FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);
-- EMPNO = 7902 OR EMPNO = 7698 OR EMPNO = 7839 OR EMP IS NULL

-- 부하직원이 없는 사원의 사번과 이름을 출력하세요

SELECT *
FROM EMP WHERE EMPNO NOT IN (SELECT NVL(MGR,0) FROM EMP);
-- EMPNO != 7902 AND EMPNO != 7698 AND EMPNO = 7839 AND EMP IS NOT NULL
-- NOT IN을 사용할 경우 NULL이 영향을 주기 때문에 주의해야 한다.

-- KING에게 보고하는, 즉 직속상관이 KING인 사원
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP
WHERE MGR  IN (
SELECT EMPNO FROM EMP WHERE ENAME='KING'
);

-- 20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의 사번, 이름, 급여, 부서번호
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > (
SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20
);

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > ALL(
SELECT SAL FROM EMP WHERE DEPTNO=20
);

--
SELECT *
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='SALESMAN')
AND SAL IN (SELECT SAL FROM EMP WHERE JOB='SALEMAN')
;

--
-- 부서의 평균월급보다 더 많은 월급을 월급을 받는 사원의 사번, 이름, 부서번호, 부서별 평균월급
SELECT A.EMPNO, A.ENAME, A.DEPTNO, B.AVG_SAL 
FROM EMP A JOIN (
SELECT DEPTNO,AVG(SAL) AS AVG_SAL
FROM EMP GROUP BY DEPTNO) B
ON A.DEPTNO=B.DEPTNO
WHERE A.SAL > B.AVG_SAL;


--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
SELECT *
FROM EMP
WHERE SAL =(SELECT SAL FROM EMP WHERE ENAME='SMITH')
;
 
--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO 
FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO=10);
 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.
SELECT ENAME, HIREDATE 
FROM EMP 
WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE')
AND ENAME !='BLAKE';


--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL DESC;
 
--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN (
SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%'
);


--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)

SELECT * FROM EMP
WHERE SAL > ALL(
SELECT SAL FROM EMP WHERE DEPTNO=30
);
 
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
SELECT * FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.
SELECT DEPTNO, ENAME, JOB FROM EMP 
WHERE DEPTNO =(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES') ;
 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)

SELECT ENAME, SAL 
FROM EMP
WHERE MGR =(SELECT EMPNO FROM EMP WHERE ENAME='KING');

 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.

SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
AND DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%S%' );
 
--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.

SELECT E.ENAME, E.SAL, E.DEPTNO
FROM EMP E JOIN (
SELECT DISTINCT DEPTNO, SAL FROM EMP 
WHERE COMM IS NOT NULL) B
ON E.DEPTNO=B.DEPTNO
WHERE E.SAL = B.SAL
;

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM EMP
                      WHERE COMM IS NOT NULL)
AND SAL IN( SELECT SAL
               FROM EMP
               WHERE COMM IS NOT NULL);
               
--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라.

SELECT * FROM EMP
WHERE SAL NOT IN (SELECT SAL FROM EMP WHERE DEPTNO=30)
AND COMM NOT IN (SELECT NVL(COMM,0) FROM EMP WHERE DEPTNO=30);

-------------------------------------------------------------------------------
--[INSERT], [UPDATE], [DELETE]

/*
오라클 기분
DDL (데이터 정의어) : CREATE, ALTER, DROP, TRUNCATE(저장공간까지 삭제), RENAME, MODIFY
DML (데이터 조작어) : INSERT, UPDATE, DELETE
DQL (데이터 질의어) : SELECT
DCL (데이터 제어어) : GRANK, REVOKE
TCL (트랜잭션 처리) : COMMIT, ROLLBACK, SAVEPOINT


*/

-- DML (트랜잭션 : 하나의 논리적인 작업 단위)
-- A은행에서 출금, B라는 은행 입금 (하나의 논리적인 단위)
-- A라는 계좌 100 출금 : UPDATE
-- B라는 계좌 100 입금 : UPDATE
-- 둘다 성공 : COMMIT
-- 둘중에 하나라도 실패 : ROLLBACK

-- 테이블 정보 보기
DESC EMP;

SELECT * FROM TAB; -- 사용자가 만든 계정(스키마) 테이블 목록 출력

SELECT * FROM COL; -- 컬럼정보
SELECT * FROM COL WHERE TNAME='EMP';

SELECT * FROM USER_TABLES WHERE TABLE_NAME='DEPT';

-----------------------------------------------------------------------------
-- DML (오라클.PDF P.168)

--INSERT INTO table_name [(column1[, column2, . . . . . ])]
--VALUES (value1[, value2, . . . . . . ]);

CREATE TABLE TEMP (
  ID NUMBER PRIMARY KEY , -- ID컬럼에는 NULL값도, 중복도 안됨. 유일한 데이터 1건 보장
  NAME VARCHAR2(20) -- DEFAULT NULL 허용 
);  


CREATE SEQUENCE SEQ_ID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

INSERT INTO TEMP(ID, NAME) VALUES(SEQ_ID.NEXTVAL, '홍길동');
COMMIT;

-- 2컬럼 목록 생략
INSERT INTO TEMP VALUES(SEQ_ID.NEXTVAL, '김유신');
COMMIT;
SELECT * FROM TEMP;

--1 문제
-- INSERT INTO TEMP(ID, NAME) VALUES(2,'아무개'); -- SQL 오류: ORA-00001: 무결성 제약 조건(BITUSER.SYS_C0011066)에 위배됩니다

-- INSERT INTO TEMP(NAME) VALUES('아무개'); -- SQL 오류: ORA-01400: NULL을 ("BITUSER"."TEMP"."ID") 안에 삽입할 수 없습니다

------------------------------------------------------------------------------
-- 일반 SQL은 프로그램적인 요소가 없음
-- PL-SAL (변수, 제어문)

CREATE TABLE TEMP2(ID VARCHAR2(20));

-- PL-SQL 사용
/*
BEGIN
  FOR i IN 1..1000 LOOP
    INSERT INTO TEMP2(ID) VALUES('A'||TO_CHAR(i));
  END LOOP;
END;
*/
SELECT * FROM TEMP2;

------------------------------------------------------------------------------

CREATE TABLE TEMP3 (
  MEMBERID NUMBER(3) NOT NULL,
  NAME VARCHAR2(10), -- NULL 허용
  REGDATE DATE DEFAULT SYSDATE -- DEFAULT로 SYSDATE 값
);

SELECT SYSDATE FROM DUAL;

INSERT INTO TEMP3(MEMBERID, NAME) VALUES(200, '아무개');

SELECT * FROM TEMP3;
COMMIT;

INSERT INTO TEMP3(MEMBERID) VALUES(300);
SELECT * FROM TEMP3;
COMMIT;


------------------------------------------------------------------------------
-- INSERT (TIP)
-- 1. 대량 데이터 INSERT하기

CREATE TABLE TEMP4( ID NUMBER);
CREATE TABLE TEMP5( NUM NUMBER);

INSERT INTO TEMP4(ID) VALUES(1);
INSERT INTO TEMP4(ID) VALUES(2);
INSERT INTO TEMP4(ID) VALUES(3);
INSERT INTO TEMP4(ID) VALUES(4);
INSERT INTO TEMP4(ID) VALUES(5);
INSERT INTO TEMP4(ID) VALUES(6);
INSERT INTO TEMP4(ID) VALUES(7);
INSERT INTO TEMP4(ID) VALUES(8);
INSERT INTO TEMP4(ID) VALUES(9);
INSERT INTO TEMP4(ID) VALUES(10);
COMMIT;

SELECT * FROM TEMP4;

-- 요구사항 TEMP4에 있는 모든 데이터를 TEMP5에 넣고 싶다.
-- INSERT INTO 테이블명 (컬럼리스트) VALUES(값리스트)
-- INSERT INTO 테이블명 SELECT 구문 (단 컬럼의 개수와 타입이 동일)

INSERT INTO TEMP5(NUM)
SELECT ID
FROM TEMP4;

SELECT * FROM TEMP5;
COMMIT;

-- 2. INSERT 
-- 테이블이 없는 상황에서 [테이블을 생성] + [대량데이터 삽입]
-- 단, 복사개념(제약정보는 복사가 안됨(PK, FK))
-- 순수한 구조정보(컬럼이름, 타입)복사

CREATE TABLE COPYEMP
AS
SELECT *
FROM EMP;


CREATE TABLE COPYEMP2
AS
SELECT *
FROM EMP
WHERE DEPTNO=30;

-- 데이터는 복사안하고 구조만 복사하고 싶어요
CREATE TABLE COPYTEMP3
AS
SELECT *
FROM EMP
WHERE 1=2;

SELECT * FROM COPYTEMP3;

-- TIP 
-- 오라클 시스템 테이블 (다양한 정보)
-- 제약정보(PK, FK)
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='COPYEMP';

CREATE TABLE PKTEST (ID NUMBER PRIMARY KEY);  -- NOT NULL, UNIQUE

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='PKTEST';
--
INSERT INTO PKTEST
SELECT * FROM TEMP4;
COMMIT;

CREATE TABLE PKTEST2
AS
SELECT * FROM PKTEST;

-- 제약조건은 복사가 안됨
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='PKTEST2';

---------------- [INSERT의 종료]-----------------------------------------------

--[UPDATE]
/*
UPDATE TABLE_NAME
SET COLUMN1=VALUE1, COLUMN2=VALUE2
WHERE 조건


UPDATE TABLE_NAME
SET COLUMN1=(SUBQUERY)
WHERE 조건

*/

SELECT * FROM COPYEMP;

UPDATE COPYEMP
SET SAL=0
WHERE DEPTNO=20;

SELECT * FROM COPYEMP WHERE DEPTNO=20;

COMMIT;

-- UPDATE와 SUBQUERY의 결합이 자주 사용됨
UPDATE COPYEMP
SET SAL = (SELECT SUM(SAL) FROM EMP);

SELECT * FROM COPYEMP ;
ROLLBACK;

-- 여러개 컬럼 UPDATE
UPDATE COPYEMP
SET ENAME='AAA', JOB='BBB', HIREDATE=SYSDATE, SAL=(SELECT SUM(SAL) FROM EMP)
WHERE DEPTNO=10;

SELECT * FROM COPYEMP WHERE DEPTNO=10;
COMMIT;

-------------------------[ UPDATE END ] --------------------------------------
-- [DELETE]
-- 원칙적으로 DELETE후  COMMIT하면 복원불가 => 백업데이터가 있다면 복원가능

DELETE FROM COPYEMP;

SELECT * FROM COPYEMP;

ROLLBACK; 

DELETE FROM COPYEMP WHERE DEPTNO IN (10,20);

SELECT * FROM COPYEMP;
ROLLBACK;

----------------------[ DELETE END ] -----------------------------------------

/*
 APP(JAVA) -> JDBC API -> DB작업

 CRUD
 
 CREATE : INSERT
 READ : SELECT
 UPDATE : UPDATE
 DELETE : DELETE
 
 DML : CREATE, UPDATE, DELETE는 트랜잭션을 동반. 반드시 COMMIT, ROLLBACK사용

 JDBC -> ORACLE
 -- 전체조회(함수), 조건조회(함수), 삭제(함수), 수정(함수), 삽입(함수)
 
 -- public List<Emp> getEmpAllList(){ select * from emp...}
 -- public Emp getEmpListByEmpno(int empno) {select * from emp where empno=?}
 -- public int insertEmp(Emp emp) { inset into emp values(?, ?, ?, ?) }
 
 
*/

-------------------------------------------------------------------------------
-- [DDL]
-- CREATE, ALTER, DROP (테이블 기준)

SELECT * FROM USER_TABLES WHERE UPPER(TABLE_NAME)='BOARD';


CREATE TABLE BOARD (
 BOARDID NUMBER,
 TITLE VARCHAR2(50),
 CONTENT VARCHAR2(4000),
 REGDATE DATE
);

ALTER TABLE BOARD ADD CONSTRAINTS BOARDID_PK PRIMARY KEY(BOARDID);

------------------------------------------------------------------------------
-- 개발자 편하게 살기
SELECT * FROM USER_TABLES WHERE UPPER(TABLE_NAME)='BOARD';
SELECT * FROM USER_CONSTRAINTS WHERE UPPER(TABLE_NAME)='BOARD';

-------------------------------------------------------------------------------
-- ORACLE 11G 가상컬럼 (조합컬럼)
-- 학생성적 테이블 : 국어, 영어, 수학, 총점 컬럼
-- 국어, 영어, 수학 데이터만 INSERT하면 자동으로 총점이 구해졌으면..

CREATE TABLE VTABLE (
 NO1 NUMBER,
 NO2 NUMBER,
 NO3 NUMBER GENERATED ALWAYS AS (NO1+NO2) VIRTUAL
);

INSERT INTO VTABLE(NO1, NO2) VALUES(2,3);
COMMIT;
SELECT * FROM VTABLE;

INSERT INTO VTABLE(NO1, NO2, NO3) VALUES(2,3, 10); --  에러

-- 컬럼의 정보 보기 (DEFAULT VALUE확인 가능)

SELECT COLUMN_NAME, DATA_TYPE, DATA_DEFAULT 
FROM USER_TAB_COLUMNS WHERE UPPER(TABLE_NAME)='VTABLE';

-- 실무에서 활용하는 코드
-- 제품정보 (입고일) 분기별 데이터 (4분기)
-- 입고일 : 2019-03-01 >> 1분기

CREATE TABLE VTABLE2 (
  NO NUMBER, -- 순번
  P_CODE CHAR(4), --제품코드
  P_DATE CHAR(8), --입고일(20190303)
  P_QTY NUMBER, --수량
  P_BUNGI NUMBER(1) GENERATED ALWAYS AS ( CASE WHEN SUBSTR(P_DATE,5,2) IN ('01','02','03') THEN 1
                                               WHEN SUBSTR(P_DATE,5,2) IN ('04','05','06') THEN 2
                                               WHEN SUBSTR(P_DATE,5,2) IN ('07','08','09') THEN 3
                                               ELSE 4
                                          END ) VIRTUAL
);


SELECT COLUMN_NAME, DATA_TYPE, DATA_DEFAULT 
FROM USER_TAB_COLUMNS WHERE UPPER(TABLE_NAME)='VTABLE2';

INSERT INTO VTABLE2(NO, P_CODE, P_DATE, P_QTY) VALUES(1,'A100', '20190322', 20);
INSERT INTO VTABLE2(NO, P_CODE, P_DATE, P_QTY) VALUES(2,'A200', '20190722', 20);
INSERT INTO VTABLE2(NO, P_CODE, P_DATE, P_QTY) VALUES(3,'A300', '20190222', 20);
INSERT INTO VTABLE2(NO, P_CODE, P_DATE, P_QTY) VALUES(4,'A400', '20191222', 20);

SELECT * FROM VTABLE2;

COMMIT;

------------------------------------------------------------------------------
-- DDL 테이블 다루기 (오라클.PDF 138P)

-- 1. 테이블 생성하기
CREATE TABLE TEMP6(ID NUMBER);

-- 2. 테이블 생성했는데 컬럼 하나를 누락
-- 기본 테이블에 컬럼 추가하기
ALTER TABLE TEMP6 
ADD ENAME VARCHAR2(20);

-- 3. 기존테이블에 있는 컬럼의 이름을 잘못 표기 (ENAME -> USERNAME)
ALTER TABLE TEMP6 
RENAME COLUMN ENAME TO USERNAME;

DESC TEMP6;


-- 4. 기존 테이블에 있는 기존컬럼의 타입 정보 수정하기
ALTER TABLE TEMP6
MODIFY(USERNAME VARCHAR2(2000));

-- 5. 기존 테이블에 있는 기존컬럼 삭제
ALTER TABLE TEMP6
DROP COLUMN USERNAME;


-- PRIMARY KEY 추가
ALTER TABLE TEMP6
ADD CONSTRAINTS ID_PK PRIMARY KEY(ID);

-- 6.테이블 삭제
-- 6.1 데이터만 삭제 : DELETE (기존 데이터가 있는 크기를 유지)
-- 테이블 처음 만들면 처음에 지정된 크기 >> 데이터를 넣으면 데이터 크기가 증가
-- EX) 처음 1M >> 10만건 >> 100M >> DELETE 10만건 삭제 >> 여전히 테이블의 크기는 100M
-- 테이블 데이터 삭제하면서 공간의 크기를 줄이는 방법 : TRUNCATE
-- TRUNCATE (WHERE절 사용불가)
-- EX) 처음 1M >> 10만건 >> 100M >> DELETE 10만건 삭제 >> 테이블의 크기는 1M

-- 6.2 테이블자체의 삭제
-- DROP
DROP TABLE TEMP6;



DESC TEMP6;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='TEMP6';

--------------------------------------------------------------------------------
-- 테이블 제약 설정
-- 오라클.PDF (114PAGE)
-- 데이터무결성 확보
-- 제약(CONSTRAINT) : INSERT, UPDATE 주로 적용
/*
NOT NULL(NN) : 열은 NULL값을 포함할 수 없습니다.

UNIQUE KEY(UK) : 테이블의 모든 행을 [유일하게 하는 값]을 가진 열(NULL을 허용)
-- UNIQUE제약은 NULL값을 가질 수 있다.

PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL과 UNIQUE조건을 만족)
NOT NULL하고 UNIQUE한 제약 (내부적으로 INDEX가 자동 설정)

FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정
(참조제약) [테이블]과 [테이블]간의 관계 설정

CHECK(CK) : 참이어야 하는 조건을 지정함 (대부분 업무규칙을 설정)
설정한 범위 내의 값만 입력받겠다. (GENDER : 컬럼에 '남' 또는 '여' 데이터만)

*/

--1.
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP'; -- ORACLE은 NOT NULL도 제약으로 본다

CREATE TABLE TEMP7 (
  ID NUMBER PRIMARY KEY -- 권장하지 않음 (줄임표현) SYS_C0011075 (나중에 제약을 수정, 삭제할때 임의로 만든 이름으로 쓰므로 )
);

DROP TABLE TEMP7;

CREATE TABLE TEMP7 (
  ID NUMBER CONSTRAINT PK_TEMP7_ID PRIMARY KEY, -- 관용적 표현 : PK_테이블명_컬럼명 
  NAME VARCHAR2(20) NOT NULL,
  ADDR VARCHAR2(50)
);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='TEMP7'; 

INSERT INTO TEMP7 (ID, NAME, ADDR) VALUES(1, '홍길동','서울시 강남구');
INSERT INTO TEMP7 (ID, NAME, ADDR) VALUES(2, '김유신','서울시 강남구');

COMMIT;

SELECT * FROM TEMP7;

--1. PRIMARY KEY는 테이블에 몇개까지 걸 수 있을까요? 1개 
-- 여러개의 컬럼을 묶어서 1개는 가능 (ENAME, AGE) => 복합키

CREATE TABLE TEMP8 (
  ID NUMBER CONSTRAINTS PK_TEMP8_ID PRIMARY KEY,
  NAME VARCHAR2(20) NOT NULL,
  JUMIN CHAR(6) CONSTRAINTS UK_TEMP8_JUMIN UNIQUE,  -- 중복값(X) >> NULL도 허용  : JUMIN CHAR(6) NOT NULL CONSTRAINTS UK_TEMP8_JUMIN UNIQUE
  ADDR VARCHAR2(20)
);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='TEMP8';

INSERT INTO TEMP8(ID, NAME, JUMIN, ADDR) VALUES(10,'홍길동', '123456', '경기도');
INSERT INTO TEMP8(ID, NAME, JUMIN, ADDR) VALUES(20,'김유신', '223456', '경기도');

INSERT INTO TEMP8(ID, NAME, ADDR) VALUES(30,'김우산', '경기도');
INSERT INTO TEMP8(ID, NAME, ADDR) VALUES(40,'김양산',  '경기도'); -- NULL은 중복체크 안되요 

--------------------------------------------------------------------------------
-- 테이블 생성 후 제약 걸기

CREATE TABLE TEMP9 (ID NUMBER);

-- 기존 테이블에 제약 추가하기
-- 주의사항 : 테이블에 기존 데이터가 제약을 위반한다면 제약은 추가되지 않음
ALTER TABLE TEMP9 ADD CONSTRAINTS PK_TEMP9_ID PRIMARY KEY(ID);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='TEMP9';

ALTER TABLE TEMP9
ADD ENAME VARCHAR2(20);

DESC TEMP9;

-- NOT NULL제약 추가하기
ALTER TABLE TEMP9
MODIFY (ENAME NOT NULL);

DESC TEMP9;

----------------------------------------------------------------------------
--[CHECK] 제약
-- WHERE 조건과 동일한 형태의 제약 >> WHERE GENDER IN ('남','여');
CREATE TABLE TEMP10 (
  ID NUMBER CONSTRAINT PK_TEMP10_ID PRIMARY KEY,
  NAME VARCHAR2(20) NOT NULL,
  JUMIN CHAR(6) CONSTRAINT UK_TEMP10_JUMIN UNIQUE,
  ADDR VARCHAR2(20),
  AGE NUMBER CONSTRAINT  CK_TEMP10_AGE CHECK(AGE>=19)
);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='TEMP10';

INSERT INTO TEMP10 (ID, NAME, JUMIN, ADDR, AGE) 
VALUES(100, '홍길동', '123456','서울시', 25);
COMMIT;

INSERT INTO TEMP10 (ID, NAME, JUMIN, ADDR, AGE) 
VALUES(200, '김유신', '123456','부산시', 18);  -- ORA-02290: 체크 제약조건(BITUSER.CK_TEMP10_AGE)이 위배되었습니다


SELECT * FROM TEMP10;

-------------------------------------------------------------------------------
-- 참조제약 : 테이블과 테이블과의 제약
-- EMP (DEPTNO) 컬럼은 DEPT (DEPTN) 컬럼을 참조한다.

CREATE TABLE C_EMP
AS 
 SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE 1=2;
 
CREATE TABLE C_DEPT
AS
 SELECT DEPTNO, DNAME FROM DEPT WHERE 1=2;
 
 SELECT * FROM C_EMP;
 
 SELECT * FROM C_DEPT;
 
 ALTER TABLE C_DEPT
 ADD CONSTRAINTS PK_DEPT_DEPTNO PRIMARY KEY(DEPTNO);
 
 -- 1.참조제약 (C_EMP 테이블에 있는 DEPTNO 컬럼
 -- C_DEPT에 먼저 PRIMARY KEY를 지정해야 함
 
 ALTER TABLE C_EMP
 ADD CONSTRAINTS FK_EMP_DEPTNO FOREIGN KEY(DEPTNO) REFERENCES C_DEPT (DEPTNO);
 -- C_DEPT >> DEPTNO에서 데이터 빌려쓸거야 (전 신용있어요 빌려가 주세요)
 -- DEPTNO의 값은 데이터 중복데이터 없고 NULL값 없어요 PRIMARY KEY
 
 DESC C_EMP;
 SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='C_EMP';
 
 INSERT INTO C_DEPT(DEPTNO, DNAME) VALUES(100, '인사팀');
 INSERT INTO C_DEPT(DEPTNO, DNAME) VALUES(200, '관리팀');
 INSERT INTO C_DEPT(DEPTNO, DNAME) VALUES(300, '회계팀');
 COMMIT;
 
 SELECT * FROM C_DEPT;
 
 -- 신입사원 입사
 INSERT INTO C_EMP(EMPNO, ENAME) VALUES(100,'홍길동'); -- FK : FK는 NOT NULL제약조건이 없다. (NULL값 허용)
 -- 신입사원은 부서를 갖지 않을 수 있다.
 
 -- 규칙 : 신입사원은 무조건 부서를 가져야 한다. (DEPTNO NOT NULL CONSTRAINT FK_EMP_DEPTNO FOREIN KEY(DEPTNO) REFERENCES DEPT (DEPTNO))
 SELECT * FROM C_EMP;
 
 INSERT INTO C_EMP(EMPNO, ENAME, DEPTNO) VALUES(200, '아무개', 500);
 
 ----------------------------------------------------------------------------
 -- 테이블 (부모 자식 테이블)
 -- 테이블 (MASTER, DETAIL)
 -- C_EMP 테이블 : 자식 테이블, DETAIL
 -- C_DEPT 테이블 : 부모 테이블, MASTER
 
 -- 두개 테이블 DEPTNO 관계에서 PRIMARY KEY가 있는 곳이 부모, FOREIGN KEY가 있는 곳이 자식
 
 -- 주의점
 SELECT  * FROM C_EMP;
 SELECT * FROM C_DEPT;
 -- C_DEPT테이블에서 C_EMP가 참조하고 있는 FK데이터 삭제 불가능
 DELETE FROM C_DEPT WHERE DEPTNO=300;
 -- C_DEPT테이블에서 C_EMP가 참조하고 있지 않은 FK데이터 삭제 가능
 
 DELETE FROM C_EMP;
 
 ------------------------------------------------------------------------------
 
 
 --학생 성적 테이블
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--는 값을 입력하지 않으면  default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드
CREATE TABLE GRADE (
  STUDENT_ID NUMBER NOT NULL,
  NAME VARCHAR2(30) NOT NULL,
  KOREAN NUMBER DEFAULT 0,
  ENGLISH NUMBER DEFAULT 0,
  MATH NUMBER DEFAULT 0,
  TOTAL NUMBER  GENERATED ALWAYS AS (KOREAN+ENGLISH+MATH) VIRTUAL,
  AVERAGE NUMBER  GENERATED ALWAYS AS ((KOREAN+ENGLISH+MATH)/3) VIRTUAL,
  DEPT_NO NUMBER
);

ALTER TABLE GRADE
ADD CONSTRAINTS PK_GRADE_STDUENT_ID PRIMARY KEY(STUDENT_ID);

ALTER TABLE GRADE
ADD CONSTRAINTS FK_GRADE_STDUENT_ID FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO);

DESC GRADE;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='GRADE';

--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다
CREATE TABLE DEPARTMENT (
  DEPT_NO NUMBER NOT NULL,
  DEPT_NAME VARCHAR2(50) NOT NULL
);

ALTER TABLE DEPARTMENT
ADD CONSTRAINTS PK_DEPT_DEPT_NO PRIMARY KEY(DEPT_NO);

--학과코드 , 학과명

--그리고 select 결과는
--학번 , 이름  총점, 평균 , 학과코드 , 학과명 을 출력하세요

INSERT INTO DEPARTMENT VALUES(100,'회계학과');
INSERT INTO DEPARTMENT VALUES(200,'전산학과');
COMMIT;

INSERT INTO GRADE(STUDENT_ID, NAME, KOREAN, ENGLISH, MATH, DEPT_NO) VALUES(10, '우세림', 100, 100, 60, 200);
INSERT INTO GRADE(STUDENT_ID, NAME, KOREAN, ENGLISH, MATH, DEPT_NO) VALUES(20, '김동민', 100, 100, 100, 100);

SELECT G.STUDENT_ID, G.NAME, G.TOTAL, ROUND(G.AVERAGE) AS AVERAGE, D.DEPT_NO, D.DEPT_NAME
FROM GRADE G INNER JOIN DEPARTMENT D
ON G.DEPT_NO = D.DEPT_NO;

-------------------------------------------------------------------------------
-- VIEW 객체 (가상테이븖)
-- 오라클.PDF PAGE 192
-- CREATE VIEW 뷰이름 AS [SELECT 구문: VIEW를 통해서 볼 수 있는 데이터 목록]
-- VIEW는 테이블처럼 사용가능 [가상테이블] --> EMP, DEPT와 같은 논리로 접근 사용
-- VIEW는 메모리상에만 존재하는 가상테이블 [ SUBQEURY -> IN LINE VIEW )
-- 사용법은 일반 테이블과 동일
-- DML (INSERT, UPDATE, DELETE) => VIEW통해서 DML가능 => VIEW가 가지고 있는 (볼 수 있는) 실테이블 데이터를 변경

-- VIEW는 별도 권한 필요 SQL 오류: ORA-01031: 권한이 불충분합니다
CREATE VIEW V_001 
AS 
  SELECT EMPNO, ENAME
  FROM EMP;
  
SELECT * FROM V_001; -- 내부적으로 VIEW가 가지는 QUERY를 실행

-- VIEW의 사용목적
--1. 개발자의 편리성 (JOIN, SUBQUERY) >> 가상테이블 개념
--2. 편리성 (QUERY의 단순화) -> 복잡한 QUERY를 미리 만들어두고 사용
--3. 보안(권한 처리) -> 노출하고 싶은 데이터만 모아서 VIEW 생성 -> VIEW의 권한만 부여


CREATE VIEW V_EMP
AS
  SELECT EMPNO, ENAME, JOB, HIREDATE 
  FROM EMP;

SELECT * FROM V_EMP;

-- 편리성 (쿼리 단순화)
CREATE VIEW V_002
AS
  SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO;
  
SELECT * FROM V_002;

CREATE VIEW V_003 -- VIEW에서는 ALIAS 이름을 부여해야 함
AS
  SELECT DEPTNO, AVG(SAL) AS AVG_SAL
  FROM EMP
  GROUP BY DEPTNO;
  
SELECT *
FROM EMP E JOIN V_003 S
ON E.DEPTNO = S.DEPTNO
WHERE E.SAL > S.AVG_SAL;

-- 테이블 1개 이상  JOIN > SUBQUERY > VIEW


--CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
--AS Subquery
--[WITH CHECK OPTION [CONSTRAINT constraint ]]
--[WITH READ ONLY]
--
--OR REPLACE 이미 존재한다면 다시 생성한다.
--FORCE Base Table 유무에 관계없이 VIEW 을 만든다.
--NOFORCE 기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
--view_name VIEW 의 이름
--Alias Subquery 를 통해 선택된 값에 대한 Column 명이 된다.
--Subquery SELECT 문장을 기술한다.
--WITH CHECK OPTION VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다.
--Constraint CHECK OPTON 제약 조건에 대해 지정된 이름이다.
--WITH READ ONLY 이 VIEW 에서 DML 이 수행될 수 없게 한다.


DROP VIEW V_001;

CREATE OR REPLACE VIEW V_007
AS 
  SELECT AVG(SAL) AS AVGSAL FROM EMP;
  
SELECT * FROM V_007;

CREATE OR REPLACE VIEW V_007
AS 
  SELECT ROUND(AVG(SAL),0) AS AVGSAL FROM EMP;

-- VIEW를 통한 DML가능 (INSERT, UPDATE, DELETE)
-- VIEW테이블이 아니기 때문에 VIEW를 통해서 볼 수 있는 데이터에 대해서만 가능
-- 복합VIEW(하나 이상의 테이블로 구성)는 DML 작업하지 말것. 

SELECT * FROM V_EMP; -- VIEW통해서 볼 수 있는 데이터 (EMPNO, ENAME, JOB, HIREDATE)

UPDATE V_EMP --VIEW를 통해서 SAL데이터를 볼 수 없다.DML 불가능
SET SAL=0;

UPDATE V_EMP -- 원본 데이터를 UPDATE > EMP의 테이블 UPDATE
SET JOB='IT'
;

SELECT * FROM EMP;

CREATE OR REPLACE VIEW V_EMP2
AS 
  SELECT * FROM EMP WHERE DEPTNO=20;
  
SELECT * FROM V_EMP2;

UPDATE V_EMP2 -- VIEW가 접근가능한 데이터만 업데이트
SET SAL=0;

SELECT * FROM EMP;

-- VIEW 목록보기
SELECT * FROM USER_VIEWS;


--1. 30번 부서 사원들의 직위, 이름, 월급을 담는 VIEW를 만들어라.
CREATE OR REPLACE VIEW V_E01
AS
  SELECT JOB, ENAME, SAL FROM EMP WHERE DEPTNO=30;
 
 
--2. 30번 부서 사원들의  직위, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직위, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.
-- create or replace view view001 (컬럼명, 컬럼명, .....)  
CREATE OR REPLACE VIEW V_E02 (직위, 사원이름, 월급)
AS
  SELECT JOB , ENAME , SAL FROM EMP WHERE DEPTNO=30 AND SAL>300;

SELECT * FROM V_E02;
 
--3. 부서별 최대월급, 최소월급, 평균월급을 담는 VIEW를 만들어라.
CREATE OR REPLACE VIEW V_E03
AS 
  SELECT DEPTNO, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, AVG(SAL) AS AVG_SAL
  FROM EMP
  GROUP BY DEPTNO;

--4. 부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
-- 부서만 출력하도록 하라.

CREATE OR REPLACE VIEW V_E04
AS
  SELECT DEPTNO, AVG(SAL) AS AVG_SAL
  FROM EMP
  GROUP BY DEPTNO
  HAVING AVG(SAL)>2000;
 
 SELECT * FROM V_E04;

 
--5. 직위별 총월급을 담는 VIEW를 만들되, 직위가 MANAGER인
-- 사원들은 제외하고 총월급이 3000이상인 직위만 출력하도록 하라.
CREATE OR REPLACE VIEW V_E05
AS 
  SELECT JOB, SUM(SAL) AS TOTAL_SAL
  FROM EMP
  GROUP BY JOB
  HAVING SUM(SAL)>3000;

SELECT * FROM V_E05 WHERE JOB !='MANAGER' AND TOTAL_SAL > 3000;
--------------------------------------------------------------------------------
-- DB의 세계
-- 개발자 : APP (CRUD)
-- 관리자 : 백업과 복원 (관리: 네트워크, 권한...)
-- 튜닝 : APP + DB + 네트워크
        -- SQL 튜닝
        -- Server 튜닝
-- 설계 : 모델링 (업무지식)

-------------------------------------------------------------------------------
-- 시퀀스
-- 오라클.pdf (p.185)
-- 순번 추출하기
-- 자동으로 번호를 생성하는 객체

--CREATE SEQUENCE sequence_name
--[INCREMENT BY n]
--[START WITH n]
--[{MAXVALUE n | NOMAXVALUE}]
--[{MINVALUE n | NOMINVALUE}]
--[{CYCLE | NOCYCLE}]
--[{CACHE | NOCACHE}];


--sequence_name SEQUENCE 의 이름입니다.
--INCREMENT BY n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정.
--이 절이 생략되면 SEQUENCE 는 1 씩 증가.
--START WITH n 생성하기 위해 첫번째 SEQUENCE 를 지정.
--이 절이 생략되면 SEQUENCE 는 1 로 시작.
--MAXVALUE n SEQUENCE 를 생성할 수 있는 최대 값을 지정.
--NOMAXVALUE 오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정.
--MINVALUE n 최소 SEQUENCE 값을 지정.
--NOMINVALUE 오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정.
--CYCLE | NOCYCLE 최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를
--지정. NOCYCLE 이 디폴트.
--CACHE | NOCACHE 얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지 (미리 번호를 만들어 놓는 것)
--하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE.

DROP TABLE BOARD;

CREATE TABLE BOARD (
  BOARDID NUMBER CONSTRAINT PK_BOARD_ID PRIMARY KEY,
  TITLE VARCHAR2(100)
);

-- BOARDID 컬럼 (NOT NULL, UNIQUE, INDEX구성된다)
-- 개발자 : BOARDID데이터는
-- 개발자 : WHERE BOARDID =?. 무조건 1건

-- INSERT INTO BOARD(BOARDID, TITLE) VALUES ( )
-- 그러면 중복되지 않고 NULL값이 아니라는 보장

-- 조건 : 처음 글을 쓰면 1이라는 값을 INSERT. 그 다음 글부터는 2,3,4, 순차적인 값을 INSERT


INSERT INTO BOARD VALUES(1, '타이틀1');

INSERT INTO BOARD 
SELECT MAX(NVL(BOARDID,0))+1, '타이틀2' FROM BOARD;

SELECT * FROM BOARD;

CREATE SEQUENCE SEQ_BOARD_ID 
START WITH 1
INCREMENT BY 1
;

INSERT INTO BOARD VALUES(SEQ_BOARD_ID.NEXTVAL, '타이틀1');
INSERT INTO BOARD VALUES(SEQ_BOARD_ID.NEXTVAL, '타이틀2');

SELECT * FROM BOARD;

-------------------------------------------------------------------------------
-- SEQUENCE 번호 추출 (규칙) : 중복값이 없고 순차적인 값 (공유객체)
------------------------------------------------------------------------------
CREATE SEQUENCE BOARD_NUM;

SELECT * FROM SYS.USER_SEQUENCES;

--1.4.1 NEXTVAL 과 CURRVAL 의사열
--가) 특징
--1) NEXTVAL 는 다음 사용 가능한 SEQUENCE 값을 반환 한다.
--－188－
--2) SEQUENCE 가 참조될 때 마다, 다른 사용자에게 조차도 유일한 값을 반환한다.
--3) CURRVAL 은 현재 SEQUENCE 값을 얻는다.
--4) CURRVAL 이 참조되기 전에 NEXTVAL 이 사용되어야 한다.

-- 실채번
SELECT BOARD_NUM.NEXTVAL FROM DUAL;
-- 몇번까지 했지? (채번하지 않고 정보만 준다)
SELECT BOARD_NUM.CURRVAL FROM DUAL; -- 마지막으로 추출한 번호는 2

CREATE SEQUENCE KBOARD_NUM;

CREATE TABLE KBOARD (
  NUM NUMBER CONSTRAINT PK_KBOARD_ID PRIMARY KEY,
  TITLE VARCHAR2(100)
);

INSERT INTO KBOARD (NUM, TITLE) VALUES (KBOARD_NUM.NEXTVAL, '타이틀1');
INSERT INTO KBOARD (NUM, TITLE) VALUES (KBOARD_NUM.NEXTVAL, '타이틀2');
INSERT INTO KBOARD (NUM, TITLE) VALUES (KBOARD_NUM.NEXTVAL, '타이틀3');

SELECT * FROM KBOARD;

SELECT KBOARD_NUM.CURRVAL FROM DUAL;

-------------------------------------------------------------------------------
-- SEQUENCE하나로 여러개의 테이블에서 사용가능

-- TIP)
-- MS-SQL : 2012버전부터 SERQUENCE도입
-- CREATE TABLE BOARD(BOARDNUM INT IDENTITY(1,1), TITLE VHARCHAR(20));
-- INSERT INTO BOARD(TITLE) VALUES('방가');
-- MYSQL : AUTO_INCREMENT
-- CREATE TABLE BOARD(BOARDNUM INT AUTO_INCREMENT, TITLE VHARCHAR(20));

CREATE SEQUENCE SEQ_NUM
START WITH 10
INCREMENT BY 2;

SELECT SEQ_NUM.NEXTVAL FROM DUAL;
SELECT SEQ_NUM.NEXTVAL FROM DUAL;

--------------------------------------------------------------------------------
-- 개발자 필수 2
-- ROWNUM 의사컬럼 : 실제 물리적으로 존재하는 컬럼이 아니고 논리적으로 존재
-- ROWNUM : 실제로 테이블에 컬럼으로 존재하지 않지만 내부적으로 행 번호 부여할 수 있는 의사컬럼
-- ROWID : 주소값 (행이 실제로 저장되는 내부 주소값) -> 인덱스 만들때 사용

-- ROWNUM은 PAGINATION의 필수

SELECT ROWNUM, EMPNO, ENAME FROM EMP;  --SELECT한 결과에 순번 부여

-- TOP-N 쿼리
-- 테이블에서 조건에 맞는 상위(TOP)레코드(ROW) N개 추출
-- MS-SQL : SELECT TOP 10, * FROM EMP ORDER BY SAL DESC;

SELECT ROWNUM, EMPNO, ENAME FROM EMP WHERE DEPTNO=10;

SELECT ROWID FROM EMP;

-- 1.정렬의 기분을 정의하는 작업(선행)
-- 2.정렬이 된 상황에서 앞에 순번 조건절 제시
-- 1단계
SELECT *
FROM (
SELECT * 
FROM EMP
ORDER BY SAL DESC
) E
;

-- 2단계
SELECT ROWNUM AS "NUM", E.*
FROM (
SELECT * 
FROM EMP
ORDER BY SAL DESC
) E
;

-- 3단계
SELECT ROWNUM AS "NUM", E.*
FROM (
SELECT * 
FROM EMP
ORDER BY SAL DESC
) E
WHERE ROWNUM <=5;
;
-------------------------------------------------------------------------------

SELECT *
FROM (
  SELECT ROWNUM AS "NUM", E.*
  FROM (
  SELECT * 
  FROM EMP
  ORDER BY SAL DESC
  ) E
)N
WHERE N.NUM<=10;

-------------------------------------------------------------------------------
-- 게시판 (페이징 처리)
-- 1000건 데이터
-- 10건씩 나누어서 보여주기

-- 총 100건
-- pagesize=10 :한 화면에 (페이지) 보여줄 데이터 건수 row수
-- 1 ~ 10 : 1 page (DB에서 1~10글까지 SELECT 가지고 APP출력)
-- 11~ 20 : 2 page

SELECT *
FROM (
  SELECT ROWNUM AS "NUM", E.*
  FROM (
  SELECT * 
  FROM EMP
  ORDER BY SAL DESC
  ) E
)N
WHERE N.NUM BETWEEN 11 AND 20;

------------------------------------------------------------------------------
-- HR계정으로 이동

-- 41~50 사원 데이터 출력하세요 (사번은 낮은 순으로 )
SELECT * FROM HR.EMPLOYEES;

SELECT * 
FROM (
  SELECT ROWNUM AS NUM, E.*
  FROM HR.EMPLOYEES E
  ORDER BY EMPLOYEE_ID ASC
) N
WHERE N.NUM BETWEEN 41 AND 50;


--------------------------------------------------------------------------------
-- SQL 기본과정 END
-- SQL 고급과정 (3차 프로젝트 전에)
-- 고급 QUERY 순위, RANK
-- PL/SQL
-- 변수, 제어문, 커서, 함수, 프로시져, 트리거, 스케쥴
--------------------------------------------------------------------------------

-- 1차 종합 TEST 50문제

--1> 부서테이블의 모든 데이터를 출력하라.
  SELECT * FROM EMP;
 
--2> EMP테이블에서 각 사원의 직업, 사원번호, 이름, 입사일을 출력하라.
  SELECT JOB, EMPNO, ENAME, HIREDATE FROM EMP;
 
--3> EMP테이블에서 직업을 출력하되, 각 항목(ROW)가 중복되지 않게
-- 출력하라.
  SELECT DISTINCT JOB FROM EMP;
 
--4> 급여가 2850 이상인 사원의 이름 및 급여를 출력하라.
  SELECT ENAME, SAL FROM EMP WHERE SAL >=2850;
 
--5> 사원번호가 7566인 사원의 이름 및 부서번호를 출력하라.
  SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO=7566;
 
--6> 급여가 1500이상 ~ 2850이하의 범위에 속하지 않는 모든 사원의 이름
-- 및 급여를 출력하라.
 
  SELECT ENAME, SAL
  FROM EMP
  WHERE SAL <1500 OR SAL > 2850;
 
--7> 1981년 2월 20일 ~ 1981년 5월 1일에 입사한 사원의 이름,직업 및 
--입사일을 출력하라. 입사일을 기준으로 해서 오름차순으로 정렬하라.
 
  SELECT ENAME, JOB, HIREDATE 
  FROM EMP 
  WHERE HIREDATE BETWEEN TO_DATE('19810220','YYYYMMDD') AND TO_DATE('19810501','YYYYMMDD')
  ORDER BY HIREDATE ASC
  ;
 
--8> 10번 및 30번 부서에 속하는 모든 사원의 이름과 부서 번호를
-- 출력하되, 이름을 알파벳순으로 정렬하여 출력하라.
 
 SELECT ENAME, DEPTNO
 FROM EMP
 WHERE DEPTNO IN (10, 30)
 ORDER BY ENAME ASC;
 
--9> 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는
-- 사원의 이름 및 급여를 출력하라.
--(단 컬럼명을 각각 employee 및 Monthly Salary로 지정하시오)
 
 SELECT ENAME as "EMPLOYEE", SAL as "Monthly Salary"
 FROM EMP
 WHERE DEPTNO IN (10, 30)
 AND SAL>1500;
 
--10> 관리자가 없는 모든 사원의 이름 및 직위를 출력하라.
 SELECT ENAME, JOB
 FROM EMP 
 WHERE MGR IS NULL;
 
--11> 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 출력하되, 
-- 급여를 기준으로 내림차순으로 정렬하여 출력하라.
 
 SELECT ENAME, SAL, COMM
 FROM EMP
 WHERE COMM IS NOT NULL
 ORDER BY SAL DESC;
 
--12> 이름의 세 번째 문자가 A인 모든 사원의 이름을 출력하라.
 SELECT ENAME
 FROM EMP
 WHERE ENAME LIKE '__A%';
 
--13> 이름에 L이 두 번 들어가며 부서 30에 속해있는 사원의 이름을 
--출력하라.
 
 SELECT ENAME
 FROM EMP
 WHERE ENAME LIKE '%LL%'
 AND DEPTNO=30;
 
--14> 직업이 Clerk 또는 Analyst 이면서 급여가 1000,3000,5000 이 
-- 아닌 모든 사원의 이름, 직업 및 급여를 출력하라.
 SELECT ENAME, JOB, SAL
 FROM EMP
 WHERE JOB IN ('CLERK', 'ANALYST')
 AND SAL NOT IN (1000, 3000, 5000);
 
--15> 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되 
--컬럼명을 New Salary로 지정하여 출력하라.
 
 SELECT EMPNO, ENAME, SAL, ROUND(SAL*1.15,0) AS "New Salary"
 FROM EMP;
 
--16> 15번 문제와 동일한 데이타에서 급여 인상분(새 급여에서 이전 
-- 급여를 뺀 값)을 추가해서 출력하라.(컬럼명은 Increase로 하라). 
 
 SELECT EMPNO, ENAME, SAL, ROUND(SAL*1.15,0) AS "New Salary", ROUND(SAL*0.15,0) AS "Increase"
 FROM EMP;
 
--18> 모든 사원의 이름(첫 글자는 
-- 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를 표시하는
-- 쿼리를 작성하고 컬럼 별칭은 적당히 넣어서 출력하라.
 
 SELECT UPPER(SUBSTR(ENAME,1,1))||LOWER(SUBSTR(ENAME,2)) as NAME, LENGTH(ENAME) AS LENGTH_NAME
 FROM EMP
 ;
 
--19> 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은 
-- 사원의 커미션은 'no commission'으로 출력하라.
  SELECT ENAME, NVL(TO_CHAR(COMM),'no commission') as COMM
  FROM EMP;
 
 
--20> 모든 사원의 이름,부서번호,부서이름을 표시하는 질의를 작성하라.
  SELECT E.ENAME, D.DEPTNO, D.DNAME
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO;
  
 
--21> 30번 부서에 속한 사원의 이름과 부서번호 그리고 부서이름을 출력하라.
 SELECT A.ENAME, A.DEPTNO, D.DNAME 
 FROM EMP A JOIN DEPT D
 ON A.DEPTNO = D.DEPTNO
 WHERE A.DEPTNO=30;
 
--22> 30번 부서에 속한 사원들의 모든 직업과 부서위치를 출력하라.
--(단, 직업 목록이 중복되지 않게 하라.)
 
  SELECT DISTINCT E.JOB, D.LOC
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO
  WHERE D.DEPTNO=30;
 
--23> 커미션이 책정되어 있는 모든 사원의 이름, 부서이름 및 위치를 출력하라.
 
 SELECT E.ENAME, D.DNAME, D.LOC
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 WHERE E.COMM IS NOT NULL
 ;
 
--24> 이름에 A가 들어가는 모든 사원의 이름과 부서 이름을 출력하라.
 
 SELECT E.ENAME, D.DNAME 
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 WHERE E.ENAME LIKE '%A%';
 
--25> Dallas에서 근무하는 모든 사원의 이름, 직업, 부서번호 및 부서이름을 
-- 출력하라.
 SELECT E.ENAME, E.JOB, E.DEPTNO, D.DNAME 
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 WHERE D.LOC='DALLAS';
 
--26> 사원이름 및 사원번호, 해당 관리자이름 및 관리자 번호를 출력하되,
-- 각 컬럼명을 employee,emp#,manager,mgr#으로 표시하여 출력하라.
 
SELECT E.ENAME as "employee", E.EMPNO as "emp#", M.ENAME as "manager", M.EMPNO as "mgr#"
FROM EMP E JOIN EMP M
ON E.MGR=M.EMPNO;
 
 
--27> 모든 사원의 이름,직업,부서이름,급여 및 등급을 출력하라.
 SELECT E.ENAME, E.JOB, D.DNAME, E.SAL, G.GRADE
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 JOIN SALGRADE G
 ON E.SAL BETWEEN G.LOSAL AND G.HISAL;
 ;
 
 
--28> Smith보다 늦게 입사한 사원의 이름 및 입사일을 출력하라.
 
 SELECT ENAME, HIREDATE
 FROM EMP
 WHERE HIREDATE > (
   SELECT HIREDATE
   FROM EMP
   WHERE ENAME='SMITH'
 );
 
--29> 자신의 관리자보다 먼저 입사한 모든 사원의 이름, 입사일, 
-- 관리자의 이름, 관리자의 입사일을 출력하되 각각 컬럼명을 
-- Employee,EmpHiredate, Manager,MgrHiredate로 표시하여 
-- 출력하라.
 
 SELECT E.ENAME as Empolyee, E.HIREDATE as EmpHiredate, M.ENAME as Manager, M.HIREDATE as MgrHireDate
 FROM EMP E JOIN EMP M
 ON E.MGR=M.EMPNO
 WHERE E.HIREDATE < M.HIREDATE
 ;
--30> 모든 사원의 급여 최고액,최저액,총액 및 평균액을 출력하되 
-- 각 컬럼명을 Maximum,Minimum,Sum,Average로 지정하여 출력하라.
 
 SELECT MAX(SAL) as Maximum, MIN(SAL) as Minimum, SUM(SAL) as Sum, AVG(SAL) as Average로
 FROM EMP;
 
 
--31> 각 직업별로 급여 최저액.최고액,총액 및 평균액을 출력하라.
 
 SELECT JOB, MIN(SAL), MAX(SAL), SUM(SAL), AVG(SAL)
 FROM EMP
 GROUP BY JOB;
 
--32> 직업이 동일한 사람 수를 직업과 같이 출력하라.
 
 SELECT JOB, COUNT(EMPNO) as NO
 FROM EMP
 GROUP BY JOB;
 
--33> 관리자의 수를 출력하되, 관리자 번호가 중복되지 않게하라.
-- 그리고, 컬럼명을 Number of Manager로 지정하여 출력하라.
 
 SELECT COUNT(EMPNO) as "Number of Manager"
 FROM EMP
 WHERE EMPNO IN (SELECT MGR FROM EMP);
 

--34> 최고 급여와 최저 급여의 차액을 출력하라.

 SELECT MAX(SAL)-MIN(SAL) AS DIFF_SAL
 FROM EMP;
 
--35> 관리자 번호 및 해당 관리자에 속한 사원들의 최저 급여를 출력하라.
-- 단, 관리자가 없는 사원 및 최저 급여가 1000 미만인 그룹은 제외시키고 
-- 급여를 기준으로 출력 결과를 내림차순으로 정렬하라.


 SELECT E.MGR, MIN(E.SAL)
 FROM EMP E LEFT JOIN EMP M
 ON E.MGR = M.EMPNO
 WHERE M.MGR IS NOT NULL
 GROUP BY E.MGR
 HAVING MIN(E.SAL) < 1000
 ORDER BY MIN(E.SAL) DESC
 ;
 
 
--36> 부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력하라.
-- 그리고 각각의 컬럼명을 부서명,위치,사원의 수,평균급여로 표시하라.
 
 SELECT D.DNAME as "부서명", D.LOC as "위치", COUNT(E.EMPNO) as "사원의 수", ROUND(AVG(E.SAL)) as "평균급여"
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 GROUP BY D.DNAME, D.LOC;
 
--37> Smith와 동일한 부서에 속한 모든 사원의 이름 및 입사일을 출력하라.
-- 단, Smith는 제외하고 출력하시오

  SELECT ENAME, HIREDATE
  FROM EMP
  WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME='SMITH')
  AND ENAME !='SMITH';
 
--38> 자신의 급여가 평균 급여보다 많은 모든 사원의 사원 번호, 이름, 급여를 
--    표시하는 질의를 작성하고 급여를 기준으로 결과를 내림차순으로 정렬하라.
 SELECT EMPNO, ENAME, SAL
 FROM EMP
 WHERE SAL > (
   SELECT AVG(SAL) FROM EMP 
 )
 ORDER BY SAL DESC;
 
--39> 이름에 T가 들어가는 사원의 속한 부서에서 근무하는 모든 사원의 사원번호
-- 및 이름을 출력하라.
 
 SELECT EMPNO, ENAME
 FROM EMP
 WHERE DEPTNO IN (
   SELECT DEPTNO
   FROM EMP
   WHERE ENAME LIKE '%T%'
);
 
--40> 부서위치가 Dallas인 모든 사원의 이름,부서번호 및 직위를 출력하라.
 
  SELECT E.ENAME, E.DEPTNO, E.JOB
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO
  WHERE D.LOC='DALLAS';
 
--41> KING에게 보고하는 모든 사원의 이름과 급여를 출력하라.
 
 SELECT ENAME, SAL
 FROM EMP
 WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME='KING');
 
--42> Sales 부서의 모든 사원에 대한 부서번호, 이름 및 직위를 출력하라.
 
  SELECT E.DEPTNO, E.ENAME, E.JOB
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO
  WHERE D.DNAME='SALES';
 
 
--43> 자신의 급여가 평균 급여보다 많고 이름에 T가 들어가는 사원과 동일한
-- 부서에 근무하는 모든 사원의 사원 번호, 이름 및 급여를 출력하라.
 
 SELECT EMPNO, ENAME, SAL
 FROM EMP
 WHERE SAL > (SELECT AVG(SAL) FROM EMP)
 AND DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%')
 ;
 
 SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
  FROM EMP)
AND DEPTNO IN(SELECT DEPTNO
  FROM EMP
  WHERE ENAME LIKE '%T%')
--44> 커미션을 받는 사원과 급여가 일치하는 사원의 이름,부서번호,급여를 
-- 출력하라.
 
 SELECT ENAME, DEPTNO, SAL
 FROM EMP 
 WHERE SAL IN (
   SELECT SAL
   FROM EMP 
   WHERE COMM IS NOT NULL)
 ;
 
 SELECT E.ENAME, D.DNAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND E.JOB IN(SELECT E.JOB
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO
  AND D.LOC='DALLAS')
  
--45> Dallas에서 근무하는 사원과 직업이 일치하는 사원의 이름,부서이름,
--     및 급여를 출력하시오
 
 SELECT E.ENAME, D.DNAME, E.SAL
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 WHERE E.JOB IN (
   SELECT JOB
   FROM EMP
   WHERE DEPTNO =(
     SELECT DEPTNO
     FROM DEPT
     WHERE LOC='DALLAS'
   )
 );
 
 
--46> Scott과 동일한 급여 및 커미션을 받는 모든 사원의 이름, 입사일 및 
-- 급여를 출력하시오
SELECT *
FROM EMP
WHERE SAL =(
   SELECT SAL
   FROM EMP 
   WHERE ENAME='SCOTT'
)
AND NVL(COMM,0) = (
   SELECT NVL(COMM,0)
   FROM EMP 
   WHERE ENAME='SCOTT'
);
 
 SELECT ENAME, HIREDATE, SAL
FROM EMP
WHERE SAL=(SELECT SAL
  FROM EMP
  WHERE ENAME='SCOTT')
AND NVL(COMM,0)=(SELECT NVL(COMM,0)
  FROM EMP
  WHERE ENAME='SCOTT');
 
--47> 직업이 Clerk 인 사원들보다 더 많은 급여를 받는 사원의 사원번호,
-- 이름, 급여를 출력하되, 결과를 급여가 높은 순으로 정렬하라.
 
 SELECT EMPNO, ENAME, SAL
 FROM EMP
 WHERE SAL > (
   SELECT MAX(SAL)
   FROM EMP
   WHERE JOB='CLERK'
 )
 ORDER BY SAL DESC;
 
 SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>ALL(SELECT SAL
  FROM EMP
  WHERE JOB='CLERK') --결국 최대값과 비교 any 최소값과 비교
ORDER BY SAL DESC;
  
--48> 이름에 A가 들어가는 사원과 같은 직업을 가진 사원의 이름과
-- 월급, 부서번호를 출력하라.
 SELECT ENAME, SAL, DEPTNO
 FROM EMP 
 WHERE JOB IN (
   SELECT JOB
   FROM EMP
   WHERE ENAME LIKE '%A%'
 );
 
 SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE JOB IN(SELECT JOB
  FROM EMP
  WHERE ENAME LIKE '%A%');
 
--49> New  York 에서 근무하는 사원과 급여 및 커미션이 같은 사원의 
-- 사원이름과 부서명을 출력하라.
 
 SELECT A.ENAME, D.DNAME
 FROM EMP A JOIN 
(SELECT *
 FROM EMP
 WHERE DEPTNO =(
   SELECT DEPTNO
   FROM DEPT
   WHERE LOC='NEW YORK'
 ) )B
 ON A.SAL = B.SAL
 AND NVL(A.COMM,0) = NVL(B.COMM,0)
           JOIN DEPT D
 ON A.DEPTNO = D.DEPTNO
 ;
 
 select * from emp join dept 
on emp.deptno = dept.deptno
and dept.loc='NEW YORK';
 
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE
e.deptno= d.deptno
AND E.SAL IN(
          SELECT E.SAL
                FROM EMP E, DEPT D
                WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK'
                  )
AND NVL(COMM,0) IN(
               SELECT NVL(COMM,0)
               FROM EMP E, DEPT D
               WHERE E.DEPTNO=D.DEPTNO
                              AND LOC='NEW YORK');
 
--50> Dallas에서 근무하는 사원과 직업 및 관리자가 같은 사원의 사원번호,사원이름,
--    직업,월급,부서명,커미션을 출력하되 커미션이 책정되지 않은 사원은 NoCommission
--    으로 표시하고, 커미션의 컬럼명은 Comm으로 나오게 출력하시오.
--    단, 최고월급부터 출력되게 하시오

SELECT DISTINCT A.EMPNO, A.ENAME, A.JOB, A.SAL, B.DNAME, NVL(TO_CHAR(A.COMM), 'NoCommission') as Comm
FROM EMP A JOIN (
SELECT E.JOB, E.MGR , D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE D.LOC='DALLAS') B
ON A.JOB=B.JOB
AND A.MGR=B.MGR
ORDER BY A.SAL DESC;


SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DNAME,
NVL((TO_CHAR(E.COMM)),'NoCommision') AS "COMM"
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND JOB IN(SELECT JOB
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS')
AND MGR IN(SELECT MGR
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS');
  
--------------------------------------------------------------------------------
CREATE TABLE DMLEMP
AS
  SELECT * FROM EMP;
  
SELECT * FROM DMLEMP;

ALTER TABLE DMLEMP
ADD CONSTRAINTS PK_DMLEMP_EMPNO PRIMARY KEY(EMPNO);

SELECT * FROM SYS.USER_CONSTRAINTS WHERE TABLE_NAME='DMLEMP';

INSERT INTO DMLEMP(EMPNO, ENAME, DEPTNO) VALUES(100, '홍길동', 10);

--------------------------------------------------------------------------------
CREATE TABLE SDEPT
AS
  SELECT * FROM DEPT;
  

