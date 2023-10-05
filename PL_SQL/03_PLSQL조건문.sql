
-- IF ��

SET SERVEROUTPUT ON;

DECLARE 
    v_num1 NUMBER :=10;
    v_num2 NUMBER :=15;
BEGIN
    IF
      v_num1 > v_num2
    THEN --���̶��  
        dbms_output.put_line(v_num1 || '��(��) ū ��');
    ELSE -- �����̶�� 
        dbms_output.put_line(v_num2 || '��(��) ū ��');
    END IF; -- ��ȣ�� �ݴ´� 
END;

-- ELSIF 

DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER :=0; 
BEGIN
    -- DBMS_RNADOM.VALUE : ������ �ִ� ��ü. �Լ���! 
    -- 10���� 120������ ����, -1 �Է��ϸ� 1�� �ڸ����� �ݿø�
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
    
    SELECT 
        salary
    INTO 
        v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM =1;
    
    dbms_output.put_line('��ȸ�� �޿�' || v_salary);
    
    IF 
        v_salary <=5000
    THEN 
        dbms_output.put_line('�޿��� �� ����');
    ELSIF
        v_salary <=9000
    THEN
        dbms_output.put_line('�޿��� �߰���');
    ELSE 
        dbms_output.put_line('�޿��� ����');
    END  IF;
END;


-- CASE��

DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER :=0; 
BEGIN -- 10�̻� 120�̸�
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
    
    SELECT 
        salary
    INTO v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM =1; --ù° ���� ���ؼ� ������ ������ ���� 
    
    dbms_output.put_line('��ȸ�� �޿�' || v_salary);

    CASE
        WHEN v_salary <= 5000 THEN
         dbms_output.put_line('�޿��� �� ����');
        WHEN v_salary <=9000 THEN
         dbms_output.put_line('�޿��� �߰��� '); 
        ELSE 
         dbms_output.put_line('�޿��� ���� ');
    END CASE;
END;

-- ��ø if��
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
    AND ROWNUM =1; --ù° ���� ���ؼ� ������ ������ ���� 
    
    dbms_output.put_line('��ȸ�� �޿�' || v_salary);
    
    IF v_comission > 0 THEN -- 
        IF v_comission > 0.15 THEN
            dbms_output.put_line('Ŀ�̼��� 0.15 �̻���!' );
            dbms_output.put_line(v_salary *  v_comission );
        END IF;
    ELSE 
         dbms_output.put_line('Ŀ�̼��� 0.15������!');
    END IF;
END;












