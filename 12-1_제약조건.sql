
-- ���̺� ������ ��������
--  : ���̺� �������� �����Ͱ� �ԷµǴ� ���� �����ϱ� ���� ��Ģ�� �����ϴ� ��.
-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű)
     -- NULL ���� ������� ����.
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����)
-- NOT NULL: null�� ������� ����.(�ʼ���)
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷� 
-- FK - (�������� ���Ἲ�� ��ȭ, �ƹ��ų� �� �ԷµǴ°� ����, �����ϴ°� ������ ���� ����� )
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.

-- �÷� ���� ���� ���� (�÷� ���𸶴� �������� ����)
CREATE TABLE dept2 (
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY,
                        -- PRIMARY KEY = NOT NULL + UNIQUE 
                       -- ��������   �̸�   (���߿� �������� �����ϱ� ���� )
                       -- �������� ���ٸ� ����(CONSTRAINT dept2_deptno_pk) ���� 
                       -- dept_no NUMBER(2) PRIMARY KEY 
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE, 
    loca NUMBER(4) CONSTRAINT dept2_loca_fk REFERENCES locations(location_id),
                            -- �ܷ�Ű : Ÿ���̺� �ִ� �����ϰ� join �ϱ����ؼ� 
                            -- dpeat �ش������ʴ� ���̵�� �ȹ޾��� 10,20,30 ... 200 
                            -- ������ ������ �����ϴ� ������ 600�� �ȹ޾��� 
                            -- �ܷ�Ű�� �����̸Ӹ� Ű�� ����
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus> 0),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M','F'))
                            --  check �� ���Ǥ� �� �´� ���鸸 ��������� �ֵ��� 
);

DROP TABLE dept2;


-- ���̺� ���� ���� ���� ( ��� �� ���� �� ���� ������ ���ϴ� ���)
CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) CONSTRAINT dept_name_notnull NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1),
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no),
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 0),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);
-- �ܷ� Ű (foreign key) �� �θ����̺�(�������̺�)�� ���ٸ� INSERT �Ұ���
INSERT INTO dept2
VALUES(10,'gg',3000,100000,'M');

INSERT INTO dept2
VALUES(20,'hh',1900,100000,'M');

UPDATE dept2
SET loca = 4000
WHERE dept_no = 10; -- ����( �ܷ�Ű �������� ����)

UPDATE dept2
SET loca = 4000
WHERE loca = 1900; -- ����( �ܷ�Ű �������� ����)

-- ���� ������ ���� 
-- ���� ������ �߰�, ������ �����մϴ�. ������ �ȵ˴ϴ�.
-- �����Ϸ��� �����ϰ� ���ο� �������� �߰��ϼž� �մϴ�.

CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
);

-- pk �߰�

ALTER TABLE dept2 ADD CONSTRAINT dept_no_pk PRIMARY KEY(dept_no);

-- fk �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_loca_locid_fk 
FOREIGN KEY(loca) REFERENCES locations(location_id);

-- check �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_bonus_uk CHECK(dept_bonus > 0);

-- unique �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptname_uk UNIQUE(dept_name);

-- NOT NULL �� �� �������·� �����մϴ�.
ALTER TABLE dept2 MODIFY dept_bonus NUMBER(10) NOT NULL;

-- �������� Ȯ��
SELECT * FROM user_constraints
WHERE table_name = 'DEPT2';

-- ���� ���� ����(���� ���� �̸�����)
ALTER TABLE dept2 DROP CONSTRAINT dept_no_pk;

---------------------------------------------------
-- ����������(VARCHAR2) �˾Ƽ��پ�� byte 
CREATE TABLE members (
    m_name VARCHAR2(3) NOT NULL,
    m_num NUMBER(1),
    reg_date DATE NOT NULL,
    gender VARCHAR2(1),
    loca NUMBER (4),
    
    CONSTRAINT mem_memnum_pk PRIMARY KEY(m_num),
    CONSTRAINT mem_regdate_uk UNIQUE(reg_date),
    CONSTRAINT mem_gen CHECK(gender IN('M', 'F')),
    CONSTRAINT mem_loca_loc_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id)

);

select * from user_constraints
where table_name ='MEMBERS';

INSERT INTO members
VALUES ('DDD',4,SYSDATE,'M',2000);

SELECT * FROM members;

SELECT
    m.m_name, m.m_num,loc.street_address,loc.location_id
FROM members m 
JOIN locations loc
ON loc.location_id = m.loca
ORDER BY m_num;
