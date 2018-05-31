CREATE OR REPLACE FUNCTION CheckStudent (id IN VARCHAR2)
RETURN NUMBER
AS
  searched_id VARCHAR2(20);
BEGIN
  SELECT s_id
  into searched_id
  FROM student
  WHERE s_id = id;

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

CREATE OR REPLACE FUNCTION CheckProfessor (id IN VARCHAR2)
RETURN NUMBER
AS
  searched_id VARCHAR2(20);
BEGIN
  SELECT p_id
  into searched_id
  FROM professor
  WHERE p_id = id;

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


CREATE OR REPLACE FUNCTION CheckManager (id IN VARCHAR2)
RETURN NUMBER
AS
  searched_id VARCHAR2(20);
BEGIN
  SELECT m_id
  into searched_id
  FROM manager
  WHERE m_id = id;

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
EXECUTE :check_type := CheckStudent('1500001');
PRINT check_type;

VAR check_type NUMBER;
EXECUTE :check_type := CheckManager('m01');
PRINT check_type;

VAR check_type NUMBER;
EXECUTE :check_type := CheckProfessor('002');
PRINT check_type;

-- cl scr
