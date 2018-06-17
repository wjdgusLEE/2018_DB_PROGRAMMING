
CREATE OR REPLACE FUNCTION checkTeach(
p_pid IN VARCHAR2,
p_cid IN VARCHAR2,
p_cid_no IN NUMBER,
p_tyear IN NUMBER,
p_tsemester IN NUMBER,
p_tday IN VARCHAR2,
p_troom IN VARCHAR2,
p_ttime IN VARCHAR2
)
RETURN NUMBER

IS
duplicate_time EXCEPTION; /*같은 pid에 시간 겹침 tsemester tday tyear ttime pid*/
duplicate_room EXCEPTION; /*시간 강의실 겹침 tsemester tday tyear ttime troom*/
<<<<<<< HEAD
duplicate_course EXCEPTION; /* 연도 학기 과목번호 분반  tsemester tyear cid cidno*/
=======
>>>>>>> dfcfdc40e04c7ca670b5bd32bf65354f78ce67ba

v_count NUMBER;
result NUMBER;

BEGIN
result := 0;

/* dup time */
SELECT COUNT(*)
INTO v_count
FROM teach
WHERE p_id=p_pid AND t_year=p_tyear AND t_semester=p_tsemester AND t_day=p_tday AND t_time=p_ttime;

IF v_count > 0 THEN
  RAISE duplicate_time;
END IF;

/* dup room*/
SELECT COUNT(*)
INTO v_count
FROM teach
WHERE t_semester=p_tsemester AND t_day=p_tday AND t_year=p_tyear AND t_time=p_ttime AND t_room=p_troom;

IF (v_count > 0) THEN
  RAISE duplicate_room;
END IF;

result := 1;
RETURN result;

EXCEPTION
WHEN duplicate_room THEN
  ROLLBACK;
  result := -2;
  RETURN result;
WHEN duplicate_time THEN
  ROLLBACK;
  result := -3;
  RETURN result;
WHEN OTHERS THEN
  ROLLBACK;
  result := SQLCODE;
  RETURN result;
END;
/
