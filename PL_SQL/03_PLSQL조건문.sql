
-- IF 문

SET SERVEROUTPUT ON;

DECLARE 
    v_num1 NUMBER :=10;
    v_num2 NUMBER :=15;
BEGIN
    IF
      v_num1 > v_num2
    THEN --참이라면  
        dbms_output.put_line(v_num1 || '이(가) 큰 수');
    ELSE -- 거짓이라면 
        dbms_output.put_line(v_num2 || '이(가) 큰 수');
    END IF; -- 괄호를 닫는다 
END;

-- ELSIF 

DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER :=0; 
BEGIN
    -- DBMS_RNADOM.VALUE : 난수값 주는 객체. 함수임! 
    -- 10부터 120까지의 난수, -1 입력하면 1의 자리에서 반올림
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
    
    SELECT 
        salary
    INTO 
        v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM =1;
    
    dbms_output.put_line('조회된 급여' || v_salary);
    
    IF 
        v_salary <=5000
    THEN 
        dbms_output.put_line('급여가 좀 낮음');
    ELSIF
        v_salary <=9000
    THEN
        dbms_output.put_line('급여가 중간임');
    ELSE 
        dbms_output.put_line('급여가 높음');
    END  IF;
END;


-- CASE문

DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER :=0; 
BEGIN -- 10이상 120미만
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
    
    SELECT 
        salary
    INTO v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM =1; --첫째 값만 구해서 변수에 저장할 예정 
    
    dbms_output.put_line('조회된 급여' || v_salary);

    CASE
        WHEN v_salary <= 5000 THEN
         dbms_output.put_line('급여가 좀 낮음');
        WHEN v_salary <=9000 THEN
         dbms_output.put_line('급여가 중간임 '); 
        ELSE 
         dbms_output.put_line('급여가 높음 ');
    END CASE;
END;

-- 중첩 if문
DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER :=0; 
    v_comission NUMBER :=0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
    
    SELECT 
        salary , commission_pct
    INTO 
        v_salary , v_comission
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM =1; --첫째 값만 구해서 변수에 저장할 예정 
    
    dbms_output.put_line('조회된 급여' || v_salary);
    
    IF v_comission > 0 THEN -- 
        IF v_comission > 0.15 THEN
            dbms_output.put_line('커미션이 0.15 이상임!' );
            dbms_output.put_line(v_salary *  v_comission );
        END IF;
    ELSE 
         dbms_output.put_line('커미션이 0.15이하임!');
    END IF;
END;












