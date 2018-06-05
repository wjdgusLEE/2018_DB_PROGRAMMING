
CREATE OR REPLACE FUNCTION checkCourse(
p_pid IN VARCHAR2,
p_cid IN VARCHAR2,
p_cid_no IN NUMBER,
p_cname IN VARCHAR2,
p_cunit IN NUMBER,
p_cgrade IN NUMBER,
p_cmajor IN VARCHAR2
)
RETURN RESULT NUMBER

IS
duplicate_course EXCEPTION; /*과목번호 분반 다 겹침*/

v_cid course.c_id%TYPE;
v_cid_no course.c_id_no%TYPE;
v_count NUMBER;

BEGIN
result := 0;

SELECT COUNT(*)
INTO v_count
FROM course c
WHERE c.c_id = p_cid AND c.c_id_no = p_cid_no;

IF v_count > 0 THEN
  RAISE duplicate_course;
END IF;

SELECT COUNT(*)
INTO v_count
FROM course c
WHERE c.c_id = p_cid AND c.c_id_no = p_cid_no;

IF v_count > 0 THEN
  RAISE duplicate_course;
END IF;

COMMIT;

result := 1;

EXCEPTION
WHEN duplicate_course THEN
  result := -1;
WHEN OTHERS THEN
  ROLLBACK;
  result := -1;
END;
/
