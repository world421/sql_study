
-- 테이블 생성과 제약조건
--  : 테이블에 부적절한 데이터가 입력되는 것을 방지하기 위해 규칙을 설정하는 것.
-- 테이블 열레벨 제약조건 (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: 테이블의 고유 식별 컬럼입니다. (주요 키)
     -- NULL 값도 허용하지 않음.
-- UNIQUE: 유일한 값을 갖게 하는 컬럼 (중복값 방지)
-- NOT NULL: null을 허용하지 않음.(필수값)
-- FOREIGN KEY: 참조하는 테이블의 PRIMARY KEY를 저장하는 컬럼 
-- FK - (데이터의 무결성을 강화, 아무거나 막 입력되는거 방지, 참조하는게 있으면 삭제 어려움 )
-- CHECK: 정의된 형식만 저장되도록 허용.

-- 컬럼 레벨 제약 조건 (컬럼 선언마다 제약조건 지정)
CREATE TABLE dept2 (
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY,
                        -- PRIMARY KEY = NOT NULL + UNIQUE 
                       -- 제약조건   이름   (나중에 제약조건 지목하기 위한 )
                       -- 지목할일 없다면 생략(CONSTRAINT dept2_deptno_pk) 가능 
                       -- dept_no NUMBER(2) PRIMARY KEY 
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE, 
    loca NUMBER(4) CONSTRAINT dept2_loca_fk REFERENCES locations(location_id),
                            -- 외래키 : 타테이블에 있는 참조하고 join 하기위해서 
                            -- dpeat 해당하지않는 아이디는 안받아줌 10,20,30 ... 200 
                            -- 없으면 막아줌 참조하는 데이터 600번 안받아줌 
                            -- 외래키를 프라이머리 키로 참조
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus> 0),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M','F'))
                            --  check 이 조건ㅇ ㅔ 맞는 값들만 집어넣을수 있도록 
);

DROP TABLE dept2;


-- 테이블 레벨 제약 조건 ( 모든 열 선언 후 제약 조건을 취하는 방식)
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
-- 외래 키 (foreign key) 가 부모테이블(참조테이블)에 없다면 INSERT 불가능
INSERT INTO dept2
VALUES(10,'gg',3000,100000,'M');

INSERT INTO dept2
VALUES(20,'hh',1900,100000,'M');

UPDATE dept2
SET loca = 4000
WHERE dept_no = 10; -- 실패( 외래키 제약조건 위반)

UPDATE dept2
SET loca = 4000
WHERE loca = 1900; -- 실패( 외래키 제약조건 위반)

-- 제약 조건을 변경 
-- 제약 조건은 추가, 삭제만 가능합니다. 변경은 안됩니다.
-- 변경하려면 삭제하고 새로운 내용으로 추가하셔야 합니다.

CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
);

-- pk 추가

ALTER TABLE dept2 ADD CONSTRAINT dept_no_pk PRIMARY KEY(dept_no);

-- fk 추가
ALTER TABLE dept2 ADD CONSTRAINT dept2_loca_locid_fk 
FOREIGN KEY(loca) REFERENCES locations(location_id);

-- check 추가
ALTER TABLE dept2 ADD CONSTRAINT dept2_bonus_uk CHECK(dept_bonus > 0);

-- unique 추가
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptname_uk UNIQUE(dept_name);

-- NOT NULL 은 열 수정형태로 변경합니다.
ALTER TABLE dept2 MODIFY dept_bonus NUMBER(10) NOT NULL;

-- 제약조건 확인
SELECT * FROM user_constraints
WHERE table_name = 'DEPT2';

-- 제약 조건 삭제(제약 조건 이름으로)
ALTER TABLE dept2 DROP CONSTRAINT dept_no_pk;

---------------------------------------------------
-- 가변문자형(VARCHAR2) 알아서줄어듬 byte 
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
