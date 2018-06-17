CREATE OR REPLACE TRIGGER TriggerStudent
  BEFORE
  UPDATE OR INSERT ON student
  FOR EACH ROW
DECLARE
    underflow_pwd EXCEPTION;
    underflow_id EXCEPTION;
    blank_exception EXCEPTION;
    pwd_length NUMBER;
    nBlank NUMBER;
    nLength NUMBER;
BEGIN

  SELECT LENGTH(:new.s_pwd)
  INTO pwd_length
  FROM dual;

  IF pwd_length < 4 THEN
      RAISE underflow_pwd;
  END IF;
  
  select INSTR(:new.s_pwd,' ', 1, 1)
  INTO nBlank
  FROM DUAL;
  
  IF nBlank > 0 THEN 
  	RAISE blank_exception;
  END IF;
  
   select INSTR(:new.s_id,' ', 1, 1)
  INTO nBlank
  FROM DUAL;
  
  IF nBlank > 0 THEN 
  	RAISE blank_exception;
  END IF;
  
  
  SELECT LENGTH(:new.s_id) 
  INTO nLength
  FROM DUAL;
  
  IF nLength != 7 THEN
  	RAISE underflow_id;
  END IF;
  
  UPDATE student
  SET s_pwd = :new.s_pwd, s_email = :new.s_email, s_major = :new.s_major; 
EXCEPTION
  WHEN underflow_pwd THEN
    RAISE_APPLICATION_ERROR(-20003, '비밀번호 4자리 이상');
  WHEN blank_exception THEN
    RAISE_APPLICATION_ERROR(-20002, '공란은 입력되지 않습니다.');
  WHEN underflow_id THEN
  	RAISE_APPLICATION_ERROR(-20004, '아이디는 숫자 7자리입니다.');
  WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLCODE) || SQLERRM);
END;
/

CREATE OR REPLACE TRIGGER TriggerProfessor
  BEFORE
  UPDATE OR INSERT ON professor
  FOR EACH ROW
DECLARE
    underflow_pwd EXCEPTION;
    underflow_id EXCEPTION;
    blank_exception EXCEPTION;
    pwd_length NUMBER;
    nBlank NUMBER;
    nLength NUMBER;
BEGIN

  SELECT LENGTH(:new.p_pwd)
  INTO pwd_length
  FROM dual;
  
 IF pwd_length < 4 THEN
      RAISE underflow_pwd;
  END IF;
  
  select INSTR(:new.p_pwd,' ', 1, 1)
  INTO nBlank
  FROM DUAL;
  
  IF nBlank > 0 THEN 
  	RAISE blank_exception;
  END IF;
  
   select INSTR(:new.p_pid,' ', 1, 1)
  INTO nBlank
  FROM DUAL;
  
  IF nBlank > 0 THEN 
  	RAISE blank_exception;
  END IF;
  
  SELECT LENGTH(:new.p_id) 
  INTO nLength
  FROM DUAL;
  
  IF nLength != 7 THEN
  	RAISE underflow_id;
  END IF;
  
  UPDATE professor
  SET p_pwd = :new.p_pwd, p_email = :new.p_email, p_major = :new.p_major; 
  
EXCEPTION
  WHEN underflow_pwd THEN
    RAISE_APPLICATION_ERROR(-20003, '비밀번호 4자리 이상');
  WHEN blank_exception THEN
    RAISE_APPLICATION_ERROR(-20002, '공란은 입력되지 않습니다.');
  WHEN underflow_id THEN
  	RAISE_APPLICATION_ERROR(-20004, '아이디는 숫자 7자리입니다.');
  WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLCODE) || SQLERRM);
END;
/

CREATE OR REPLACE TRIGGER TriggerManager
  BEFORE
  UPDATE OR INSERT ON  manager
  FOR EACH ROW
DECLARE
    underflow_length EXCEPTION;
    blank_exception EXCEPTION;
    pwd_length NUMBER;
    nBlank NUMBER;
BEGIN
  SELECT LENGTH(:new.m_pwd)
  INTO pwd_length
  FROM dual;

  IF pwd_length < 4 THEN 
      RAISE underflow_length;
  END IF;
  
  select INSTR(:new.m_pwd, ' ', 1)
  INTO nBlank
  FROM DUAL;
  
  IF nBlank > 0 THEN 
  	RAISE blank_exception;
  END IF;
  
  select INSTR(:new.m_id, ' ', 1)
  INTO nBlank
  FROM DUAL;
  
  IF nBlank > 0 THEN 
  	RAISE blank_exception;
  END IF;
  
  UPDATE manager
      SET m_pwd = :new.m_pwd, m_email = :new.m_email;
  
EXCEPTION
  WHEN underflow_length THEN
    RAISE_APPLICATION_ERROR(-20003, '비밀번호 4자리 이상');
  WHEN  blank_exception THEN
    RAISE_APPLICATION_ERROR(-20002, '공란은 입력되지 않습니다.');
  WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLCODE) || SQLERRM);
END;
/
