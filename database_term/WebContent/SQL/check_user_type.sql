CREATE OR REPLACE FUNCTION CheckStudent (id IN VARCHAR2, pwd IN VARCHAR2 )
RETURN NUMBER
AS
  searched_id VARCHAR2(20);
BEGIN
  SELECT s_id
  into searched_id
  FROM student
  WHERE s_id = id and s_pwd = pwd;

  IF SQL%ROWCOUNT = 1 THEN
    RETURN 0;
  RETURN -1;
  END IF;
EXCEPTION
      WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('error message: '||SQLERRM);
      RETURN -1;
END;
/

CREATE OR REPLACE FUNCTION CheckProfessor (id IN VARCHAR2, pwd IN VARCHAR2 )
RETURN NUMBER
AS
  searched_id VARCHAR2(20);
BEGIN
  SELECT p_id
  into searched_id
  FROM professor
  WHERE p_id = id and p_pwd = pwd;

  IF SQL%ROWCOUNT = 1 THEN
    RETURN 1;
  RETURN -1;
  END IF;
EXCEPTION
      WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('error message: '||SQLERRM);
      RETURN -1;
END;
/


CREATE OR REPLACE FUNCTION CheckManager (id IN VARCHAR2, pwd IN VARCHAR2 )
RETURN NUMBER
AS
  searched_id VARCHAR2(20);
BEGIN
  SELECT m_id
  into searched_id
  FROM manager
  WHERE m_id = id and  m_pwd = pwd;

  IF SQL%ROWCOUNT = 1 THEN
    RETURN 2;
  RETURN -1;
  END IF;
EXCEPTION
      WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('error message: '||SQLERRM);
      RETURN -1;
END;
/





VAR check_type NUMBER;
EXECUTE :check_type := CheckStudent('1512173','1234');
PRINT check_type;

VAR check_type NUMBER;
EXECUTE :check_type := CheckStudent('1512173','1200');
PRINT check_type;

VAR check_type NUMBER;
EXECUTE :check_type := CheckProfessor('001', '111');
PRINT check_type;

VAR check_type NUMBER;
EXECUTE :check_type := CheckProfessor('001', '100');
PRINT check_type;

VAR check_type NUMBER;
EXECUTE :check_type := CheckManager('m01', '0000');
PRINT check_type;

VAR check_type NUMBER;
EXECUTE :check_type := CheckManager('m01', '2222');
PRINT check_type;

--drop function manager;
--drop function student;
--drop function professor;
-- show error;
-- cl scr
