
-- ������ (���������� �����ϴ� ���� ����� �ִ� ��ü) 
-- PK ������� �� �ַ� ���� ! 

CREATE SEQUENCE dept2_seq
    START WITH 1 -- ���۰� ( ����� �������� , ���� ����,
                --          �⺻���� �����Ҷ� �ּҰ�. 
                --          �����Ҷ� �ִ밪 .
    INCREMENT BY 1 -- ����� ( ����� ����, ������ ����,�⺻�� 1 )
    MAXVALUE 10 -- �ִ밪 (�⺻���� ������ �� 1027, �����϶� -1) ����� Ŀ���Ŵ�
    MINVALUE 1 -- �ּҰ� (�⺻�� ������ �� 1, ������ �� -1028)
     -- ���۰��̶� ������ ���ϸ� maxvalue �������� 
    NOCACHE  -- ĳ���޸� ��� ���� (�⺻�� CACHE) 
            -- CACHE 50 (50���� �����ڴ�)
            -- INSET �Ҷ� ERROR �߻��ϸ� 1~40 
            -- �����Ҷ��� �����ϸ� �� ������� ���� �����߻��ϸ� ĳ���� �������Ҽ���
    NOCYCLE; -- ��ȯ���� (�⺻�� NOCYCLE, ��ȯ��Ű���� CYCLE)
    
DROP TABLE dept2;
    
CREATE TABLE dept2(
    dept_no NUMBER(2) PRIMARY KEY,
    dopt_name VARCHAR(14),
    loca VARCHAR(13),
    dept_date DATE
    );
    
-- ������ ����ϱ� (NEXTVAL , CURRVAL)
INSERT INTO dept2
VALUES(dept2_seq.NEXTVAL ,'tset','test',sysdate);


SELECT dept2_seq.CURRVAL FROM dual;

-- ������ ���� (���� ���� ����)
-- START WITH �� ������ �Ұ����մϴ�.

ALTER SEQUENCE dept2_seq MAXVALUE 9999; -- �ִ밪 ���� 
ALTER SEQUENCE dept2_seq INCREMENT BY -1; --������ ����
ALTER SEQUENCE dept2_seq MINVALUE 0; --�ּҰ� ����

-- ������ ���� �ٽ� ó������ ������ ���
ALTER SEQUENCE dept2_seq INCREMENT BY -88;
SELECT dept2_seq.NEXTVAL FROM dual;
ALTER SEQUENCE dept2_seq INCREMENT BY 1;

-- ������ �����ϱ� (���������� �ִ� �� ������)
DROP SEQUENCE dept2_seq;
SELECT * FROM dept2;

--------------------------------------------------------

/*
- index
index�� primary key, unique ���� ���ǿ��� �ڵ����� �����ǰ�,
��ȸ�� ������ �� �ִ� hint ������ �մϴ�.
index�� ��ȸ�� ������ ������, �������ϰ� ���� �ε����� �����ؼ�
����ϸ� ������ ���� ���ϸ� ����ų �� �ֽ��ϴ�.
���� �ʿ��� ���� index�� ����ϴ� ���� �ٶ����մϴ�.
*/

SELECT * FROM employees WHERE salary = 12008;
-- �ε��� ����
CREATE INDEX emp_salary_idx ON employees(salary); 
                            -- ON(���ٺ��ϰ���(����÷����ϰ���)
                            -- salary ���� index�� ����             
/*
    ���̺� ��ȸ�� �ε����� ���� �÷��� �������� ����Ѵٸ� 
    ���̺� ��ü ��ȸ�� �ƴ�, �÷��� ���� �ε����� �̿��ؼ� ��ȸ�� �����մϴ�.
    �ε����� �����ϰ� �Ǹ� ������ �÷��� ROWID�� ���� �ε����� �غ�ǰ�,
    ��ȸ�� ������ �� �ش� �ε����� ROWID�� ���� ���� ��ĵ�� �����ϰ� �մϴ�.
*/

DROP INDEX emp_salary_idx; 

-- �������� �ε����� ����ϴ� hint ���
CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE tbl_board(
        bno NUMBER(10) PRIMARY KEY,
        wirter VARCHAR2(20)
);

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'tset');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'admin');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'kim');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'hong');

SELECT * FROM tbl_board
WHERE bno = 32;

commit;

-- �ε��� �̸� ����
ALTER INDEX SYS_c007066
RENAME TO tbl_board_idx;

SELECT * FROM 
    (
    SELECT ROWNUM AS rn, a.*
    FROM (
            SELECT  *
            FROM tbl_board
            ORDER BY bno DESC
        )a
    )
WHERE rn > 10 AND rn <=20;

-- /*+ INDEX(table_name index_name) */
-- ������ �ε����� ������ ���Բ� ����.
-- INDEX ASC, DESC�� �߰��ؼ� ������, ������ ������ ���Բ� ���� ����.

SELECT * FROM
    (
    SELECT /*+ INDEX_DESC(tbl_board tbl_board_idx) */ 
                        -- ���̺� �̸�, �ε��� �̸�
        ROWNUM AS rn,
        bno,
        wirter
    FROM tbl_board
    )
WHERE rn > 10 AND rn <= 20;

/*
- �ε����� ����Ǵ� ��� 
1. �÷��� WHERE �Ǵ� �������ǿ��� ���� ���Ǵ� ���
2. ���� �������� ���� �����ϴ� ��� (������ �� ���ü��� �ִ� ���)
3. ���̺��� ������ ���( index �ӵ��� ������)
4. Ÿ�� �÷��� ���� ���� null���� �����ϴ� ���.
    -------- ���� x 
5. ���̺��� ���� �����ǰ�, �̹� �ϳ� �̻��� �ε����� ������ �ִ� ��쿡��
 �������� �ʽ��ϴ�. (�ӵ��� ����)
*/

