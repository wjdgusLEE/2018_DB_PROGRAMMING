CREATE OR REPLACE TRIGGER TriggerStudent
  BEFORE
  UPDATE OR INSERT ON student
  FOR EACH ROW
DECLARE
    uncorrect_password_len EXCEPTION;
    uncorrect_id_len EXCEPTION;
    blank_exception EXCEPTION;
    pwd_length NUMBER;
    blank_pos NUMBER;
    id_length NUMBER;
BEGIN

  SELECT LENGTH(:new.s_pwd)
  INTO pwd_length
  FROM dual;

  IF pwd_length < 4 THEN
      RAISE uncorrect_password_len;
  END IF;
  
  select INSTR(:new.s_id, ' ', 1)
  INTO blank_pos
  FROM DUAL;
  
  IF blank_pos > 0 THEN 
  	RAISE blank_exception;
  END IF;
  
  
  SELECT LENGTH(:new.s_id) 
  INTO id_length
  FROM DUAL;
  
  IF id_length != 7 THEN
  	RAISE uncorrect_id_len;
  END IF;
  
  UPDATE student
  SET s_pwd = :new.s_pwd, s_email = :new.s_email, s_major = :new.s_major; 
EXCEPTION
  WHEN uncorrect_password_len THEN
    RAISE_APPLICATION_ERROR(-20003, '비밀번호 4자리 이상');
  WHEN blank_exception THEN
    RAISE_APPLICATION_ERROR(-20002, '암호에 공란은 입력되지 않습니다.');
  WHEN uncorrect_id_len THEN
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
    uncorrect_password_len EXCEPTION;
    uncorrect_id_len EXCEPTION;
    blank_exception EXCEPTION;
    pwd_length NUMBER;
    blank_pos NUMBER;
    id_length NUMBER;
BEGIN

  SELECT LENGTH(:new.p_pwd)
  INTO pwd_length
  FROM dual;
  
 IF pwd_length < 4 THEN
      RAISE uncorrect_password_len;
  END IF;
  
  select INSTR(:new.p_id, ' ', 1)
  INTO blank_pos
  FROM DUAL;
  
  IF blank_pos > 0 THEN 
  	RAISE blank_exception;
  END IF;
  
  SELECT LENGTH(:new.p_id) 
  INTO id_length
  FROM DUAL;
  
  IF id_length != 7 THEN
  	RAISE uncorrect_id_len;
  END IF;
  
  UPDATE professor
  SET p_pwd = :new.p_pwd, p_email = :new.p_email, p_major = :new.p_major; 
  
EXCEPTION
  WHEN uncorrect_password_len THEN
    RAISE_APPLICATION_ERROR(-20003, '비밀번호 4자리 이상');
  WHEN blank_exception THEN
    RAISE_APPLICATION_ERROR(-20002, '암호에 공란은 입력되지 않습니다.');
  WHEN uncorrect_id_len THEN
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
    uncorrect_length EXCEPTION;
    empty_pwd EXCEPTION;
    pwd_length NUMBER;
BEGIN
  SELECT LENGTH(:new.m_pwd)
  INTO pwd_length
  FROM dual;

  IF pwd_length >= 4 THEN
      UPDATE manager
      SET m_pwd = :new.m_pwd, m_email = :new.m_email;
  ELSIF pwd_length = 0 THEN
      RAISE empty_pwd;
  ELSE
      RAISE uncorrect_length;
  END IF;
EXCEPTION
  WHEN empty_pwd THEN
    RAISE_APPLICATION_ERROR(-20003, '비밀번호 4자리 이상');
  WHEN uncorrect_length THEN
    RAISE_APPLICATION_ERROR(-20002, '암호에 공란은 입력되지 않습니다.');
  WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLCODE) || SQLERRM);
END;
/
