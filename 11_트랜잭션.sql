
-- DML
-- : SELECT, INSERT, UPDATE,DELETE
/*
 - ģ������ �� �۱� 
 - �������� �� �۱� ��û, 
 - ������ ����,  ģ������ ����  -> ���ÿ� ����Ǿ����  
 - �۱� ���� , -> �۱� �Ǳ��� ���·� ����������
 - �۱��̶�� �ϳ��� Ʈ������� ���� , Ŀ�� 
 - ROLLBACK �߰��� Ŀ�Ծ������� 
*/

-- ����Ŀ�� Ȱ��ȭ ���� Ȯ��
SHOW AUTOCOMMIT;
-- autocommit OFF
-- Ʈ����� �ϱ� ���ؼ��� AUTO �����־����
-- ����Ŀ�� ��
SET AUTOCOMMIT ON;
-- ����Ŀ�� ����
SET AUTOCOMMIT OFF;

SELECT * FROM emps;

DELETE FROM emps WHERE employee_id = 304;

-- ���̺�����Ʈ ����.
-- �ѹ��� ����Ʈ�� ���� �̸��� �ٿ��� ����.
-- ANSI ǥ�� ������ �ƴϱ� ������ �׷��� ���������� ���� 

SAVEPOINT insert_park; --�ܼ� ���� ������ ����°� 

INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (306, 'kim', 'kim1234@gmail.com', sysdate, 1800);
    

ROLLBACK TO SAVEPOINT insert_park; -- savepoint ������ ! 

-- �������� ��� ������ ��������� ���(���)
-- ���� Ŀ�� �ܰ�� ȸ��(���ư���) �� Ʈ����� ����.

ROLLBACK;


-- �������� ��� ������ ��������� ���������� �����ϸ鼭 Ʈ����� ���� ! 
-- �� commit �Ŀ��� ��� ����� ����ϴ��� �ǵ��� �� �����ϴ�.
COMMIT;

-- maindb�� �ݿ��Ǵ°� �ƴ� ! 
 -- commit �ؾ� �ݿ��Ǵ°� 
 -- Ȯ���ϰ� �۾� �������� 
 -- 

