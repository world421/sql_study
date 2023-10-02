
-- DML
-- : SELECT, INSERT, UPDATE,DELETE
/*
 - 친구헌테 돈 송금 
 - 은행한테 돈 송금 요청, 
 - 내계좌 차감,  친구계좌 증가  -> 동시에 수행되어야함  
 - 송금 실패 , -> 송금 되기전 상태로 돌려놔야함
 - 송금이라는 하나의 트랜잭션이 끝남 , 커밋 
 - ROLLBACK 중간에 커밋안했으면 
*/

-- 오토커밋 활성화 여부 확인
SHOW AUTOCOMMIT;
-- autocommit OFF
-- 트랜잭션 하기 위해서는 AUTO 꺼져있어야함
-- 오토커밋 온
SET AUTOCOMMIT ON;
-- 오토커밋 오프
SET AUTOCOMMIT OFF;

SELECT * FROM emps;

DELETE FROM emps WHERE employee_id = 304;

-- 세이브포인트 생성.
-- 롤백할 포인트를 직접 이름을 붙여서 지정.
-- ANSI 표준 문법이 아니기 때문에 그렇게 권장하지는 않음 

SAVEPOINT insert_park; --단순 저장 시점만 만드는거 

INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (306, 'kim', 'kim1234@gmail.com', sysdate, 1800);
    

ROLLBACK TO SAVEPOINT insert_park; -- savepoint 전으로 ! 

-- 보류중인 모든 데이터 변경사항을 취소(폐기)
-- 직전 커밋 단계로 회귀(돌아가기) 및 트랜잭션 종료.

ROLLBACK;


-- 보류중인 모든 데이터 변경사항을 영구적으로 적용하면서 트랜잭션 종료 ! 
-- ★ commit 후에는 어떠한 방법을 사용하더라도 되돌릴 수 없습니다.
COMMIT;

-- maindb에 반영되는건 아님 ! 
 -- commit 해야 반영되는거 
 -- 확실하게 작업 끝났을때 
 -- 

