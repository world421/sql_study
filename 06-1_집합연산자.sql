
-- 집합 연산자
-- 서로 다른 쿼리 결과의 행들을 하나로 결합, 비교, 차이를 구할 수 있게 해주는 연산자
-- UNION (합집합 중복x), UNION ALL(합집합 중복 o), INTERSECT(교집합), MINUS(차집합)
-- ** 위아래 column 개수와 데이터 타입이 정확히 일치해야한다.

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION -- 중복을 제외한 합 ! 
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- UNION ALL
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;


-- INTERSECT
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- A-B 차집합
SELECT --A
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
MINUS
SELECT --B
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- B- A 차집합
SELECT --B
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS
SELECT --A
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';