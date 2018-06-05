
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
duplicate_class EXCEPTION; /*분반 겹침*/

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

/* 에러 처리 3 : 수강신청 인원 초과 여부 */
SELECT t_max
INTO nTeachMax
FROM teach
WHERE t_year= nYear and t_semester = nSemester
and c_id = sCourseId and c_id_no= nCourseIdNo;
SELECT COUNT(*)
INTO nCnt
FROM enroll
WHERE e_year = nYear and e_semester = nSemester
and c_id = sCourseId and c_id_no = nCourseIdNo;
IF (nCnt >= nTeachMax)
THEN
RAISE too_many_students;
END IF;
/* 에러 처리 4 : 신청한 과목들 시간 중복 여부 */
SELECT COUNT(*)
INTO nCnt
FROM
(
SELECT t_time
FROM teach
WHERE t_year=nYear and t_semester = nSemester and
c_id = sCourseId and c_id_no = nCourseIdNo
INTERSECT
SELECT t.t_time
FROM teach t, enroll e
WHERE e.s_id=sStudentId and e.e_year=nYear and e.e_semester = nSemester
and
t.t_year=nYear and t.t_semester = nSemester and
e.c_id=t.c_id and e.c_id_no=t.c_id_no
);
IF (nCnt > 0)
THEN
RAISE duplicate_time;
END IF;
INSERT INTO enroll(S_ID,C_ID,C_ID_NO,E_YEAR,E_SEMESTER)
VALUES (sStudentId, sCourseId, nCourseIdNo, nYear, nSemester);
COMMIT;
result := '수강신청 등록이 완료되었습니다.';
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
