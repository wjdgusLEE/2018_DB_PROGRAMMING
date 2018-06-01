CREATE OR REPLACE TRIGGER TriggerStudent
  BEFORE
  UPDATE OR INSERT ON student
  FOR EACH ROW
DECLARE
    uncorrect_length EXCEPTION;
    empty_pwd EXCEPTION;
    pwd_length NUMBER;
BEGIN
  -- DBMS_OUTPUT.PUT_LINE('변경 후 컬럼 값 : ' || new);
  SELECT LENGTH(:new.s_pwd)
  INTO pwd_length
  FROM dual;

  IF pwd_length >= 4 THEN
      UPDATE student
      SET s_pwd = :new.s_pwd, s_email = :new.s_email, s_major = :new.s_major;
  ELSIF pwd_length = 0 THEN
      RAISE empty_pwd;
  ELSE
      RAISE uncorrect_length;
  END IF;
EXCEPTION
  WHEN empty_pwd THEN
    RAISE_APPLICATION_ERROR(-20003, '암호에 공란은 입력되지 않습니다.');
  WHEN uncorrect_length THEN
    RAISE_APPLICATION_ERROR(-20002, '암호는 4자리 이상이어야 합니다');
  WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLCODE) || SQLERRM);
END;
/

CREATE OR REPLACE TRIGGER TriggerProfessor
  BEFORE
  UPDATE OR INSERT ON  professor
  FOR EACH ROW
DECLARE
    uncorrect_length EXCEPTION;
    empty_pwd EXCEPTION;
    pwd_length NUMBER;
BEGIN
  -- DBMS_OUTPUT.PUT_LINE('변경 후 컬럼 값 : ' || new);
  SELECT LENGTH(:new.p_pwd)
  INTO pwd_length
  FROM dual;

  IF pwd_length >= 4 THEN
      UPDATE professor
      SET p_pwd = :new.p_pwd, p_email = :new.p_email, p_major = :new.p_major;
  ELSIF pwd_length = 0 THEN
      RAISE empty_pwd;
  ELSE
      RAISE uncorrect_length;
  END IF;
EXCEPTION
  WHEN empty_pwd THEN
    RAISE_APPLICATION_ERROR(-20003, '암호에 공란은 입력되지 않습니다.');
  WHEN uncorrect_length THEN
    RAISE_APPLICATION_ERROR(-20002, '암호는 4자리 이상이어야 합니다');
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
  -- DBMS_OUTPUT.PUT_LINE('변경 후 컬럼 값 : ' || new);
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
    RAISE_APPLICATION_ERROR(-20003, '암호에 공란은 입력되지 않습니다.');
  WHEN uncorrect_length THEN
    RAISE_APPLICATION_ERROR(-20002, '암호는 4자리 이상이어야 합니다');
  WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLCODE) || SQLERRM);
END;
/
