
-- ���� ������
-- ���� �ٸ� ���� ����� ����� �ϳ��� ����, ��, ���̸� ���� �� �ְ� ���ִ� ������
-- UNION (������ �ߺ�x), UNION ALL(������ �ߺ� o), INTERSECT(������), MINUS(������)
-- ** ���Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ��Ѵ�.

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION -- �ߺ��� ������ �� ! 
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

-- A-B ������
SELECT --A
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
MINUS
SELECT --B
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- B- A ������
SELECT --B
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS
SELECT --A
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';