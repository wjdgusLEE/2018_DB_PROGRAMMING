
CREATE OR REPLACE FUNCTION checkCourseDelete(
p_cid IN VARCHAR2,
p_cid_no IN NUMBER
)
RETURN NUMBER

IS
v_count NUMBER;
result NUMBER;

BEGIN
result := 0;

IF (p_cid_no = 1) THEN
  DELETE teach
  WHERE c_id = p_cid;

  DELETE course
  WHERE c_id = p_cid;
<<<<<<< HEAD
=======

>>>>>>> dfcfdc40e04c7ca670b5bd32bf65354f78ce67ba
ELSE
  DELETE teach
  WHERE c_id = p_cid AND c_id_no=p_cid_no;

  DELETE course
  WHERE c_id = p_cid AND c_id_no=p_cid_no;
<<<<<<< HEAD
=======

>>>>>>> dfcfdc40e04c7ca670b5bd32bf65354f78ce67ba
END IF;

COMMIT;

result := 1;
RETURN result;

EXCEPTION
WHEN OTHERS THEN
  ROLLBACK;
  result := SQLCODE;
  RETURN result;
END;
/
