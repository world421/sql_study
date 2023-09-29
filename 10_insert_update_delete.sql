
-- insert
-- ���̺� ���� Ȯ��
-- ���̺� �տ� ������ ���̺� ������ ǥ���ش޶����� 
DESC departments;

-- INSERT �� ù��° ��� (��� �÷� �����͸� �� ���� ����)
INSERT INTO departments
VALUES(300, '���ߺ�',NULL,NULL);

SELECT * FROM departments;
ROLLBACK; -- ���� ������ �ٽ� �ڷ� �ǵ����� Ű���� 

-- INSERT�� �ι�° ���( ���� �÷��� �����ϰ� ����, NOT NULL Ȯ���ϼ���!)
INSERT INTO departments 
    (department_id,  location_Id)
VALUES 
    (300, 1700);
    

-- �纻 ���̺� ����
-- �纻 ���̺� ������ �� �׳� �����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
-- WHERE���� fasle��(1=2)�����ϸ� -> ���̺� ������ ����ǰ� �����ʹ� ���� X 
CREATE TABLE emps AS  --CTAS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2); 
-- WHERE ���� FALSE �� �ָ� ������ ������! '1=2' 

DROP TABLE emps; -- ���̺� ����

-- INSERT (��������)
INSERT INTO emps 
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE department_id = 50);

-------------------------------------------------------------
-- UPDATE 
CREATE TABLE emps AS  
(SELECT * FROM employees); 

SELECT * FROM emps;

-- UPDATE �� ������ ���� ������ ������ �� �� �����ؾ� �մϴ�.
-- �׷��� ������ ���� ����� ���̺� ��ü�� ����˴ϴ�.
UPDATE emps SET salary = 30000;

-- ���� �������� ������(where) 107�� salary �� 30000���� �ٲ�
ROLLBACK;

UPDATE emps SET salary = 30000
WHERE employee_id = 100;

UPDATE emps SET salary = salary + salary * 0.1
WHERE employee_id = 100;

UPDATE emps
SET phone_number = '010.4742.8917',manager_id = 102
WHERE employee_id =100;

-- UPDATE (��������)
UPDATE emps
    SET (job_id, salary, manager_id) = 
    (
        SELECT job_id, salary, manager_id
        FROM emps
        WHERE employee_id = 100
    )
WHERE employee_id =101;
SELECT * FROM emps;

---------------------------------------------
-- DELETE 
DELETE FROM emps 
WHERE  employee_id =103;

-- DELETE (��������)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                       WHERE department_name = 'IT');