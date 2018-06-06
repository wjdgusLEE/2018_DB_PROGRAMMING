CREATE TABLE student
(
    s_id VARCHAR2(10),
    s_pwd VARCHAR2(10) not null,
    s_name VARCHAR2(50) not null,
    s_email VARCHAR2(100),
    s_phone VARCHAR2(100),
    s_grade NUMBER(1) not null,
    s_major VARCHAR2(50)   not null,
    CONSTRAINT s_pk PRIMARY KEY (s_id)
);


INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade, s_college, s_major) VALUES
('1512173', '0000', '이정현', '경기도', 'aaaa@gmail.com', '010-0000-0000', 4, '컴퓨터과학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade, s_college, s_major) VALUES
('1511111', '1111', '오지은', '경기도', 'bbbb@gmail.com', '010-1111-1111', 4, '컴퓨터과학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade, s_college, s_major) VALUES
('1522222', '2222', '정혜린', '서울시', 'cccc@gmail.com', '010-2222-2222', 4, '컴퓨터과학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade, s_college, s_major) VALUES
('1533333', '3333', '김학수', '경기도', 'dddd@gmail.com', '010-3333-3333', 4, '컴퓨터과학과');



CREATE TABLE course
(
    c_id VARCHAR2(10),
    c_id_no NUMBER(1),
    c_name VARCHAR2(50),
    c_unit NUMBER(1),
    c_grade NUMBER(1),
    c_major VARCHAR2(50),
    CONSTRAINT c_pk PRIMARY KEY (c_id, c_id_no)
);


INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12345', 1, '데이터베이스', 3, 4, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12350', 1, '컴파일러', 3, 4, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12355', 1, '인공지능', 3, 4, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12360', 1, '임베디드', 3, 4, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12365', 1, '웹시스템설계', 3, 3, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12370', 1, '프로그래밍언어', 3, 3, '전공') ;



CREATE TABLE professor
(
    p_id VARCHAR2(10),
    p_pwd VARCHAR2(10)   not null,
    p_name VARCHAR2(50)   not null,
    p_major VARCHAR2(50)   not null,
    p_room VARCHAR2(50)   not null,
    p_email VARCHAR2(100),
    CONSTRAINT p_pk PRIMARY KEY (p_id)
);

INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4580', '4580', '문봉희', '컴퓨터과학과', '새힘관414', 'moon@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4545', '4545', '이상규', '컴퓨터과학과', '새힘관408', 'sanglee@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4550', '4550', '창병모', '컴퓨터과학과', '새힘관410', 'chang@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4575', '4575', '최영우', '컴퓨터과학과', '새힘관409', 'ywchoi@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4555', '4555', '이현자', '컴퓨터과학과', '수련교수회관205', 'hyunjalee@sm.co.kr');


CREATE TABLE enroll
(
    s_id VARCHAR2(10),
    c_id VARCHAR2(10),
    c_id_no NUMBER(1),
    e_year NUMBER(4),
    e_semester NUMBER(1), -- 강의실
    CONSTRAINT e_pk PRIMARY KEY (s_id, c_id, c_id_no),
    CONSTRAINT s_id_fk FOREIGN KEY (s_id) REFERENCES student (s_id),
    CONSTRAINT e_c_id_fk FOREIGN KEY (c_id, c_id_no) REFERENCES  course (c_id, c_id_no)
);

INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1512173', 'c12355', 1, 2018, 1);
INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1512173', 'c12350', 1, 2018, 1);
INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1512173', 'c12345', 1, 2018, 1);

INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1511111', 'c12355', 1, 2018, 1);
INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1511111', 'c12345', 1, 2018, 1);


CREATE TABLE teach
(
    p_id VARCHAR2(10),
    c_id VARCHAR2(10),
    c_id_no NUMBER(1),
    t_year NUMBER(4),
    t_semester NUMBER(1),
    t_day VARCHAR2(20),
    t_room VARCHAR2(20),  
    t_time VARCHAR2(20),
    t_max NUMBER(3), 
    CONSTRAINT t_pk PRIMARY KEY (p_id, c_id, c_id_no,t_year,t_semester ),
    CONSTRAINT p_id_fk FOREIGN KEY (p_id) REFERENCES  professor (p_id),
    CONSTRAINT t_c_id_fk FOREIGN KEY (c_id, c_id_no) REFERENCES  course (c_id, c_id_no)
);


INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4550', 'c12370', 1, 2018, 1,  '월,수', '10:30-11:45', '명신413', 40);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4575', 'c12385', 1, 2018, 1,  '월,수', '17:00-18:45', '명신413', 40);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4550', 'c12370', 1, 2018, 2,  '월,수', '10:30-11:45', '명신413', 40);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4575', 'c12385', 1, 2018, 2,  '월,수', '17:00-18:45', '명신413', 40);

CREATE TABLE MAJOR (
  major varchar2(30)
);

CREATE OR REPLACE FUNCTION Date2EnrollYear(dDate IN DATE)
	RETURN NUMBER
	IS 
	currentYear NUMBER;
	currentMonth NUMBER;
	year NUMBER;
	BEGIN
	SELECT to_number(to_char(dDate, 'YYYY')) INTO currentYear FROM DUAL;
	SELECT to_number(to_char(dDate, 'MM')) INTO currentMonth FROM DUAL;
	if currentMonth = 11 or currentMonth = 12 then
	   year := currentYear + 1;
	else
	   year := currentYear;
	end if;
	return year;
END;
/


CREATE OR REPLACE FUNCTION Date2EnrollSemester(dDate IN DATE)
	RETURN NUMBER
	IS
	currentMonth NUMBER;
	semester NUMBER;
	BEGIN
	SELECT to_number(to_char(dDate, 'MM')) INTO currentMonth FROM DUAL;
	if currentMonth >= 5 and currentMonth <= 10 then
	   semester := 2;
	else
	   semester := 1;
	end if;
	return semester;
END;
/


CREATE OR REPLACE PROCEDURE InsertEnroll(sStudentId IN VARCHAR2,
	sCourseId IN VARCHAR2, nCourseIdNo IN NUMBER, result OUT VARCHAR2)
IS
	too_many_sumCourseUnit EXCEPTION;
	duplicate_courses EXCEPTION;
	too_many_students EXCEPTION;
	duplicate_time EXCEPTION;
	nYear NUMBER;
	nSemester NUMBER;
	nSumCourseUnit NUMBER;
	nCourseUnit NUMBER;
	nCnt NUMBER;
	nTeachMax NUMBER;
BEGIN
	result := '';
	DBMS_OUTPUT.put_line('#');
	DBMS_OUTPUT.put_line(sStudentId || '님이 과목번호 ' || sCourseId ||
	', 분반 ' || TO_CHAR(nCourseIdNo) || '의 수강 등록을 요청하였습니다.');
	
	/* 년도, 학기 알아내기 */
	nYear := Date2EnrollYear(SYSDATE);
	nSemester := Date2EnrollSemester(SYSDATE);

	/* 에러 처리 1 : 최대학점 초과여부 */
	SELECT SUM(c.c_unit)
	INTO nSumCourseUnit
	FROM course c, enroll e
	WHERE e.s_id = sStudentId and e.e_year = nYear and
		e.e_semester = nSemester and e.c_id = c.c_id and e.c_id_no = c.c_id_no;
		
	SELECT c_unit
	INTO nCourseUnit
	FROM course
	WHERE c_id = sCourseId and c_id_no = nCourseIdNo;
	
	IF (nSumCourseUnit + nCourseUnit > 18)
	THEN
	RAISE too_many_sumCourseUnit;
	END IF;
	
	/* 에러 처리 2 : 동일한 과목 신청 여부 */
	SELECT COUNT(*)
	INTO nCnt
	FROM enroll
	WHERE s_id = sStudentId and c_id = sCourseId;
	IF (nCnt > 0) THEN
		RAISE duplicate_courses;
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
	IF (nCnt >= nTeachMax) THEN
		RAISE too_many_students;
	END IF;
	
	/* 에러 처리 4 : 신청한 과목들 시간 중복 여부 */
	SELECT COUNT(*)
	INTO nCnt
	FROM
	(
	SELECT t_day, t_time
	FROM teach
	WHERE t_year=nYear and t_semester = nSemester and
	c_id = sCourseId and c_id_no = nCourseIdNo
	INTERSECT
	SELECT t_day, t.t_time
	FROM teach t, enroll e
	WHERE e.s_id=sStudentId and e.e_year=nYear and e.e_semester = nSemester
	and t.t_year=nYear and t.t_semester = nSemester and	e.c_id=t.c_id and e.c_id_no=t.c_id_no);
	IF (nCnt > 0) THEN
		RAISE duplicate_time;
	END IF;
	
	/* 수강 신청 등록 */	
	INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) 
	VALUES (sStudentId, sCourseId, nCourseIdNo, nYear, nSemester);
	COMMIT;
	result := '수강신청 등록이 완료되었습니다.';
	EXCEPTION
	WHEN too_many_sumCourseUnit THEN
		result := '최대학점을 초과하였습니다';
	WHEN duplicate_courses THEN
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