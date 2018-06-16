
CREATE OR REPLACE FUNCTION checkCourse(
p_cid IN VARCHAR2,
p_cid_no IN NUMBER
)
RETURN NUMBER
IS
  CURSOR course_list(v_cid course.c_id%TYPE) IS
        SELECT c_id_no
        FROM course
        WHERE c_id = v_cid;

  duplicate_course EXCEPTION; /*과목번호 분반 다 겹침*/
  v_count NUMBER;
  result NUMBER;

BEGIN
result := 0;

FOR courses IN course_list(p_cid) LOOP
  IF (courses.c_id_no=p_cid_no) THEN
    RAISE duplicate_course;
  END IF;
END LOOP;

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
