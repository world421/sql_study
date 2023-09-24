# sql_study

SELECT 
      컬럼명(여러 개 가능)
FROM 테이블 이름;

-- SQL은 대소문자를 구분하지 않음
-- 키워드는 대문자로 쓰는게 관례
-- 줄 개행 (ctrl + F7)

-- 문장을 연결하고 싶다면 || 를 사용
-- DISTINCT (중복 행의 제거 )

#=============
WHERE 절 비교 (데이터 값은 대/소문자를 구분한다.)
WHERE job_id = 'IT_PROG';

#데이터의 행 제한
(BTWEEN, IN, LIKE)

AND, OR 논리연산
-- AND가 OR보다 연산 순서가 빠름.

#=================

그룹함수 AVG, MAX, MIN, SUM, COUNT

주의할 점 !
- 그룹함수는 일반 컬럼과 동시에 그냥 출력할 수는 없음
- GROUP BY 절을 사용할 때  GROUP 절에 묶이지 않으면 다른 컬럼을 조회할 수 없습니다.
- GROUP BY를 통해 그룹화 할 때 조건을 걸 경우 HAVING 을 사용.
