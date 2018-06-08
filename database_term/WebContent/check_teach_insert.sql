
CREATE OR REPLACE FUNCTION checkTeach(
p_pid IN VARCHAR2,
p_cid IN VARCHAR2,
p_cid_no IN NUMBER,
p_tyear IN NUMBER,
p_tsemester IN NUMBER,
p_tday IN VARCHAR2,
p_troom IN VARCHAR2,
p_ttime IN VARCHAR2,
p_tmax IN NUMBER
)
RETURN RESULT NUMBER

IS
duplicate_time EXCEPTION; /*같은 pid에 시간 겹침 tsemester tday tyear ttime pid*/
duplicate_room EXCEPTION; /*시간 강의실 겹침 tsemester tday tyear ttime troom*/
duplicate_course EXCEPTION; /* 연도 학기 과목번호 분반  tsemester tyear cid cidno*/

v_count NUMBER;

BEGIN
result := 0;

/* dup time */
SELECT COUNT(*)
INTO v_count
FROM teach
WHERE p_id=p_pid AND t_semester=p_tsemester AND t_day=p_tday AND t_tme=p_ttime;

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

/* dup course */
SELECT COUNT(*)
INTO v_count
FROM teach
WHERE t_year=p_tyear AND t_semester=p_tsemester AND c_id=p_cid AND c_id_no=p_cid_no;

INSERT INTO teach VALUES (p_pid, p_cid, p_cid_no, p_tyear, p_tsemester, p_tday, p_troom, p_ttime, p_tmax);
COMMIT;

result := 1;

EXCEPTION
WHEN too_many_sumCourseUnit THEN
result := '최대학점을 초과하였습니다';
WHEN too_many_courses THEN
result := '이미 등록된 과목을 신청하였습니다';
WHEN too_many_students THEN
result := '수강신청 인원이 초과되어 등록이 불가능합니다';
WHEN duplicate_time THEN
result := '이미 등록된 과목 중 중복되는 시간이 존재합니다';
WHEN OTHERS THEN
ROLLBACK;
result := SQLCODE;
END;
/
