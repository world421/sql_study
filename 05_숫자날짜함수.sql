
-- ======# �����Լ� ============
-- ROUND() �ݿø�
-- ���ϴ� �ݿø� ��ġ�� �Ű������� ����, ������ �ִ� �͵� ����  

SELECT
    ROUND(3.1415,3) , ROUND(45.923,0), ROUND(45.923,-1)
FROM dual;

-- TRUNC(����)
-- ������ �Ҽ��� �ڸ������� �߶���ϴ�.
SELECT
    TRUNC(3.1415,3) , TRUNC(45.923,0), TRUNC(45.923,-1)
FROM dual;

-- ABS(���밪)
SELECT ABS(-34) FROM dual;

-- CEIL (�ø�) ,FLOOR(����)
SELECT CEIL(3.14) , FLOOR(3.14)
FROM dual;

-- MOD(������)
SELECT 
    10/4, MOD (10,4)
FROM dual;

-- #========== ��¥�Լ�============
-- sysdate : ��ǻ���� ���� ��¥, �ð� ������ �����ͼ� �����ϴ� �Լ� 
SELECT sysdate FROM dual;
SELECT systimestamp FROM dual;

-- ��¥�� ������ �����մϴ�.
SELECT sysdate + 1 FROM dual; 
-- �������� : 23/09/22
-- ��°�� : 23/09/23 (day+1)

-- ��¥ Ÿ�԰� ��¥Ÿ���� ��������� �����մϴ�
-- ������ ������� �ʽ��ϴ�.

SELECT 
    first_name, 
    sysdate - hire_date 
FROM employees; -- �ϼ���� ex) 7402��

SELECT first_name, hire_date,
(sysdate - hire_date) / 7 AS week
FROM employees; -- �ּ�

SELECT first_name, hire_date,
    (sysdate - hire_date) / 365) AS year
FROM employees; -- ���

-- ��¥ �ݿø�, ����
SELECT ROUND(sysdate) FROM dual; -- ���� ���� 
SELECT ROUND(sysdate,'year') FROM dual; -- �� ���� �ݿø�
SELECT ROUND(sysdate,'month') FROM dual; --  �� ���� �ݿø� 15�� ���� ������ ���:23/10/01
SELECT ROUND(sysdate,'day') FROM dual; -- �� �������� �ݿø�(�ش� ���� �Ͽ��� ��¥)

SELECT TRUNC(sysdate) FROM dual; -- ���� ���� 
SELECT TRUNC(sysdate,'year') FROM dual; -- ��°� 23/01/01
SELECT TRUNC(sysdate,'month') FROM dual; --  ��°� 23/09/01
SELECT TRUNC(sysdate,'day') FROM dual; -- 23/09/17
