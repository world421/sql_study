
/*
���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� 
(AVG(�÷�) ���)
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���

-EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� 
�����͸� ����ϼ���
*/

SELECT *
FROM employees  
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT count(*)
FROM employees  
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT *
FROM employees  
WHERE salary > (SELECT AVG(salary) FROM employees
                WHERE job_id = 'IT_PROG');

/*
���� 2.
-DEPARTMENTS���̺��� manager_id�� 100�� �μ��� �����ִ� �������
��� ������ ����ϼ��� 
*/
SELECT 
 *
FROM departments 
WHERE manager_id = 100;


/*
���� 3.
-EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� 
����ϼ���
-EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
*/

SELECT * FROM employees
WHERE manager_id > (SELECT manager_id FROM employees 
                     WHERE First_name = 'Pat');
                     
SELECT * FROM employees
WHERE manager_id IN (SELECT manager_id FROM employees 
                     WHERE First_name = 'James');

/*
���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� 
�� ��ȣ, �̸��� ����ϼ��� - �ζ��κ� 
*/

SELECT * FROM
    (
     SELECT ROWNUM AS rn, tbl.first_name
        FROM(
                SELECT * FROM employees
                ORDER BY first_name DESC
            ) tbl 
    )
WHERE rn > 40 and rn <=50 ;
-- WHERE rn BETWEEN 41 AND 50;
/*
���� 5.
-EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� 
�� ��ȣ, ���id, �̸�, ��ȣ, �Ի����� ����ϼ���.
*/

SELECT * FROM 
    (
    SELECT ROWNUM rn, tal.* 
        FROM (
                SELECT
                employee_id, first_name,phone_number,hire_date
                FROM employees
                ORDER BY hire_date
             ) tal
      )
WHERE rn > 30 AND rn < = 40;

/*
���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����
*/
SELECT
    employee_id,
    first_name || ' ' || last_name AS name,
    e.department_id,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON  e.department_id = d.department_id
ORDER BY employee_id;

/*
���� 7.
���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
SELECT
    employee_id,
    e.first_name || last_name,
    e.department_id,
    (
    SELECT 
        department_name
    FROM departments d 
    WHERE d.department_id = e.department_id
    ) AS department_name
FROM employees e 
ORDER BY employee_id ASC;
/*
���� 8.
departments���̺� locations���̺��� left �����ϼ���
����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
����) �μ����̵� ���� �������� ����
*/
SELECT 
    d.department_id, d.department_name, d.manager_id,
    loc.location_id, loc.street_address, loc.postal_code, loc.city
FROM departments d
LEFT JOIN locations loc 
ON d.location_id = loc.location_id
ORDER BY department_id ;

/*
���� 9.
departments���̺� locations���̺��� left �����ϼ���
���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/

SELECT
    d.department_id, d.department_name, d.manager_id,
    (
        SELECT postal_code
        FROM locations loc
        WHERE d.location_id = loc.location_id
    ) AS postal_code,
     (
        SELECT street_address
        FROM locations loc
        WHERE d.location_id = loc.location_id
    ) AS str_add,
    (
        SELECT location_id
        FROM locations loc
        WHERE d.location_id = loc.location_id
    ) AS loc_id,
    (
        SELECT  loc.city
        FROM locations loc
        WHERE d.location_id = loc.location_id
    ) AS city
    
FROM departments d
ORDER BY department_id  ;  

/*
���� 10.
locations���̺� countries ���̺��� left �����ϼ���
����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_id �� ����մϴ�
����) country_name���� �������� ����
*/

SELECT
     loc.location_id, loc.street_address, loc.city,
     c.country_id,c.country_name
FROM locations loc
LEFT JOIN countries c
ON loc.country_id = c.country_id
ORDER BY country_name ;


/*
���� 11.
���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
SELECT 
 loc.location_id, loc.street_address, loc.city,
     (
      SELECT country_id
      FROM countries c
      WHERE loc.country_id = c.country_id
     ) country_id,
     (
      SELECT country_name
      FROM countries c
      WHERE loc.country_id = c.country_id
     ) country_name
FROM locations loc 
ORDER BY country_name ASC ;

/*
���� 12. 
employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 
1-10��° �����͸� ����մϴ�.
����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, 
�μ����̵�, �μ��̸� �� ����մϴ�.
����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.
*/

SELECT * FROM 
    (SELECT ROWNUM rn , tal.*
    FROM(
        SELECT 
        employee_id, 
        concat(first_name, last_name),
        phone_number,hire_date, e.department_id,
        d.department_name
        FROM employees e
        LEFT JOIN departments d
        ON e.department_id = d.department_id
        ORDER BY hire_date ASC
        ) tal
    )
WHERE rn > 0 AND rn <=10;

/*
���� 13. 
--EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID, 
DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���.
*/

SELECT 
    last_name, job_id, d.department_id, department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE job_id = 'SA_MAN';


/*
���� 14
--DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
--�ο��� ���� �������� �����ϼ���.
--����� ���� �μ��� ������� ���� �ʽ��ϴ�.
*/

SELECT 

FROM  



/*
���� 15
--�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���.
--�μ��� ����� ������ 0���� ����ϼ���.
*/

/*
���� 16
-���� 15 ����� ���� DEPARTMENT_ID�������� �������� �����ؼ� 
ROWNUM�� �ٿ� 1-10 ������ ������ ����ϼ���.
*/



