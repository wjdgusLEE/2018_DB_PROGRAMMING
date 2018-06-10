
CREATE OR REPLACE FUNCTION checkCourse(
p_cid IN VARCHAR2,
p_cid_no IN NUMBER
)
RETURN NUMBER
IS
duplicate_course EXCEPTION; /*과목번호 분반 다 겹침*/
v_count NUMBER;
result NUMBER;

BEGIN
result := 0;

SELECT COUNT(*)
INTO v_count
FROM course
WHERE c_id = p_cid AND c_id_no = p_cid_no;

IF v_count > 0 THEN
  RAISE duplicate_course;
END IF;

result := 1;
RETURN result;

EXCEPTION
WHEN duplicate_course THEN
  result :=  -1;
  ROLLBACK;
  RETURN result;
WHEN OTHERS THEN
  ROLLBACK;
  result := SQLCODE;
  RETURN result;
END;
/
