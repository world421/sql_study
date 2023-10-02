
-- ����� ���� Ȯ��
SELECT * FROM all_users;

-- ���� ���� ��� 
CREATE USER user1 IDENTIFIED BY user1;
--          ���̵�    �ĺ��̵ȴ�   ��й�ȣ
-- ������� ���� , ���� ���������� ����
----------------------------------------
/*
    DCL: GRANT(���� �ο�), REVOKE(���� ȸ��)

CREATE USER -> �����ͺ��̽� ���� ���� ����
CREATE SESSION -> �����ͺ��̽� ���� ����
CREATE TABLE -> ���̺� ���� ����
CREATE VIEW -> �� ���� ����
CREATE SEQUENCE -> ������ ���� ����
ALTER ANY TABLE -> ��� ���̺� ������ �� �ִ� ����
INSERT ANY TABLE -> ��� ���̺��� �����͸� �����ϴ� ����.
SELECT ANY TABLE... -> � ���̺� ��ȸ�� �� �ִ� ���� 

SELECT ON [���̺� �̸�] TO [���� �̸�] -> Ư�� ���̺� ��ȸ�� �� �ִ� ����.
INSERT ON....
UPDATE ON....

- �����ڿ� ���ϴ� ������ �ο��ϴ� ����.


                          [������
*/

-- ���Ѻο� grant 
GRANT CREATE SESSION TO user1;
GRANT SELECT ON hr.departments TO user1;
-- user1���� ��ȸ�� �� �ִ� ������ �ְڴ�.
GRANT INSERT ON hr.departments TO user1;

GRANT CREATE TABLE TO user1;

ALTER USER user1
DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users;

GRANT SELECT ANY TABLE TO user1;

GRANT RESOURCE , CONNECT , DBA TO user1; -- ���� �� ���� TO 

REVOKE RESOURCE, CONNECT, DBA FROM user1; -- ���� ȸ�� �Ҷ��� FROM 

SELECT *FROM hr.departments;

-- ����� ���� ����
-- DROP USER [�����̸�] CASCADE;
-- CASCADE ���� �� -> ���̺� or ������ �� ��ü�� �����Ѵٸ� ���� ���� �ȵ�.

DROP USER user1 CASCADE; 
-- ���� �������� ������ �����Ұ� ! 
-- ���������Ҷ� ��ü�� ������������ ���������� 
-- user1���� table��������ϱ� table�� ���� 
--------------------------------------------
/*
���̺� �����̽��� �����ͺ��̽� ��ü �� ���� �����Ͱ� ����Ǵ� �����Դϴ�.
���̺� �����̽��� �����ϸ� ������ ��ο� ���� ���Ϸ� ������ �뷮��ŭ��
������ ������ �ǰ�, �����Ͱ� ���������� ����˴ϴ�.
�翬�� ���̺� �����̽��� �뷮�� �ʰ��Ѵٸ� ���α׷��� ������������ �����մϴ�.
*/

SELECT * FROM dba_tablespaces;

CREATE USER test1 IDENTIFIED BY test1;

GRANT CREATE SESSION TO test1;

GRANT CONNECT, RESOURCE TO test1;

-- user_tablespace ���̺� �����̽��� �⺻ ��� �������� �����ϰ� ��뷮 ����.
ALTER USER test1 DEFAULT TABLESPACE user_tablespace
QUOTA UNLIMITED ON user_tablespace;
 -- k,m,g,t, unlimited (�뷮 ���Ѿ���)

-- tablesplace ����� ��� (2����)

-- 1) tablespace ���� ��ü�� ��ü ����
DROP TABLESPACE user_tablespace INCLUDING CONTENTS;

-- 2)������ ���ϱ��� �ѹ��� �����ϴ� ��
DROP TABLESPACE user_tablespace INCLUDING CONTENTS AND DATAFILES;




