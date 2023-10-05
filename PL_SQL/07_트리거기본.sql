
/*
trigger는 테이블에 부착된 형태로써, INSERT, UPDATE, DELETE 작업이 수행될 때
특정 코드가 작동되도록 하는 구문입니다.
VIEW에는 부착이 불가능합니다.

트리거를 만들 때 범위 지정하고 F5버튼으로 부분 실행해야 합니다.
그렇지 않으면 하나의 구문으로 인식되어 정상 동작하지 않습니다.

- 자동화 하려는 목적이 크다
- A에다 트리거 실행시키면 B에도
- 다른 테이블과 연계 작업도 가능 (?)
- 트리거 객체라 create 만들어주면댐 
*/

CREATE TABLE tbl_test(
    id NUMBER(10),
    text VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER trg_test
    AFTER DELETE OR UPDATE --트리거의 발생시점.(삭제 혹은 수정 이후에 동작)
    ON tbl_test -- 트리거를 부착할 테이블 어디에 붙일지)
    FOR EACH ROW -- 각 행에 모두 적용.(생략 가능. 생략시 한번만 실행)
    
-- DECLARE 는 생략 가능
BEGIN --실행부
    dbms_output.put_line('트리거가 동작함!'); -- 실행하고자 하는코드를 begin~end 에 넣음.
    
END;

INSERT INTO tbl_test VALUES(1,'김철수'); --INSERT 트리거 동작 안했음
UPDATE tbl_test SET text = '김개똥' WHERE id =1;
DELETE tbl_test WHERE id =1;









