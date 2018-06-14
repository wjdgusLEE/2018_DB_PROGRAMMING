drop table teach;
drop table enroll;
drop table student;
drop table professor;
drop table course;

CREATE TABLE student
(
    s_id		VARCHAR2(10),
    s_pwd		VARCHAR2(10)   not null,
    s_name		VARCHAR2(50)   not null,
    s_addr		VARCHAR2(200),
    s_email		VARCHAR2(100),
    s_phone      VARCHAR2(100),
    s_grade	NUMBER(1)   not null,
    s_major	VARCHAR2(50)   not null,
    CONSTRAINT s_pk PRIMARY KEY (s_id)
);

INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade, s_major) VALUES
('1512173', '0000', '이정현', '경기도', 'aaaa@gmail.com', '010-0000-0000', 4, '컴퓨터과학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade,s_major) VALUES
('1511111', '1111', '오지은', '경기도', 'bbbb@gmail.com', '010-1111-1111', 4, '컴퓨터과학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade, s_major) VALUES
('1522222', '2222', '정혜린', '서울시', 'cccc@gmail.com', '010-2222-2222', 4, '컴퓨터과학과');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade, s_major) VALUES
('1533333', '3333', '김학수', '경기도', 'dddd@gmail.com', '010-3333-3333', 4, '컴퓨터과학과');


CREATE TABLE course
(
    c_id		VARCHAR2(10),
    c_id_no	NUMBER(1),
    c_name	VARCHAR2(50),
    c_unit	NUMBER(1),
    c_grade	NUMBER(1),
    c_major	VARCHAR2(50),
    CONSTRAINT c_pk PRIMARY KEY (c_id, c_id_no));

INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12345', 1, '데이터베이스', 3, 4, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12350', 1, '컴파일러', 3, 4, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12355', 1, '인공지능', 3, 4, '전공') ;

INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12360', 1, '임베디드', 3, 4, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12365', 1, '웹시스템설계', 3, 3, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12370', 1, '프로그래밍언어', 3, 3, '전공') ;

INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12375', 1, '디지털논리회로', 3, 2, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12380', 1, '운영체제', 3, 4, '전공') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12385', 1, '영상정보처리', 3, 4, '전공') ;

INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12315', 1, '컴퓨터특강', 3, 4, '전공') ;


CREATE TABLE professor
(
    p_id		VARCHAR2(10),
    p_pwd	VARCHAR2(10)   not null,
    p_name	VARCHAR2(50)   not null,
    p_major	VARCHAR2(50)   not null,
    p_room	VARCHAR2(50)   not null,
    p_email	VARCHAR2(100),
    CONSTRAINT p_pk PRIMARY KEY (p_id)
);

INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4580', '4580', '문봉희', '컴퓨터과학과', '새힘관414', 'moon@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4545', '4545', '이상규', '컴퓨터과학과', '새힘관408', 'sanglee@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4550', '4550', '창병모', '컴퓨터과학과', '새힘관410', 'chang@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4575', '4575', '최영우', '컴퓨터과학과', '새힘관409', 'ywchoi@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4555', '4555', '이현자', '컴퓨터과학과', '수련교수회관205', 'hyunjalee@sm.co.kr');

INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4590', '4590', '이기용', '컴퓨터과학과', '새힘관406', ' kiyonglee@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4595', '4595', '김윤진', '컴퓨터과학과', '새힘관403', ' ykim@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4530', '4530', '유석종', '컴퓨터과학과', '새힘관405', ' sjyu@sm.ac.kr');

INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4535', '4535', '박숙영', '컴퓨터과학과', '새힘관 404', ' blue@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4585', '4585', '김주균', '컴퓨터과학과', '새힘관412', ' jgkim@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4525', '4525', '최종원', '컴퓨터과학과', '새힘관411', ' choejn@sm.ac.kr');



CREATE TABLE enroll
(
    s_id VARCHAR2(10),
    c_id VARCHAR2(10),
    c_id_no NUMBER(1),
    e_year NUMBER(4),
    e_semester NUMBER(1), -- 강의실
    CONSTRAINT e_pk PRIMARY KEY (s_id, c_id, c_id_no),
    CONSTRAINT s_id_fk FOREIGN KEY (s_id) REFERENCES student(s_id) ON DELETE CASCADE,
    CONSTRAINT e_c_id_fk FOREIGN KEY (c_id, c_id_no) REFERENCES  course (c_id, c_id_no) ON DELETE CASCADE
);



INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1512173', 'c12355', 1, 2018, 1);
INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1512173', 'c12350', 1, 2018, 1);
INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1512173', 'c12345', 1, 2018, 1);


INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1511111', 'c12355', 1, 2018, 1);
INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1511111', 'c12385', 1, 2018, 1);
INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1511111', 'c12375', 1, 2018, 1);

INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1522222', 'c12370', 1, 2018, 1);
INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1522222', 'c12380', 1, 2018, 1);
INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester) VALUES ('1522222', 'c12360', 1, 2018, 1);


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
    CONSTRAINT p_id_fk FOREIGN KEY (p_id) REFERENCES  professor(p_id) ON DELETE CASCADE,
    CONSTRAINT t_c_id_fk FOREIGN KEY (c_id, c_id_no) REFERENCES  course (c_id, c_id_no) ON DELETE CASCADE
);


INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4545', 'c12350', 1, 2018, 1, '화,목', '10:30-11:45', '명신309', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4575', 'c12355', 1, 2018, 1,  '월,수', '10:30-11:45', '명신309', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4555', 'c12345', 1, 2018, 1,  '화,목', '12:00-13:15', '명신309', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4585', 'c12375', 1, 2018, 1,  '화,목', '13:30-14:45', '명신413', 30);


INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4595', 'c12360', 1, 2018, 1,  '화,목', '17:00-19:00', '명신413', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4550', 'c12370', 1, 2018, 1,  '월,수', '10:30-11:45', '명신413', 40);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4575', 'c12385', 1, 2018, 1,  '월,수', '17:00-18:45', '명신413', 40);

INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4535', 'c12365', 1, 2018, 1, '화,목', '10:30-11:45', '명신414', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4585', 'c12380', 1, 2018, 1,  '화,목', '12:00-13:15', '명신413', 55);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4590', 'c12315', 1, 2018, 1,  '화,목', '15:00-16:15', '명신309', 60);


INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4545', 'c12350', 1, 2018, 2, '화,목', '10:30-11:45', '명신309', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4575', 'c12355', 1, 2018, 2,  '월,수', '10:30-11:45', '명신309', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4555', 'c12345', 1, 2018, 2,  '화,목', '12:00-13:15', '명신309', 30);

INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4595', 'c12360', 1, 2018, 2,  '화,목', '17:00-19:00', '명신413', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4550', 'c12370', 1, 2018, 2,  '월,수', '10:30-11:45', '명신413', 40);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4575', 'c12385', 1, 2018, 2,  '월,수', '17:00-18:45', '명신413', 40);

INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max)VALUES ('cs4535', 'c12365', 1, 2018, 2, '화,목', '10:30-11:45', '명신414', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4585', 'c12380', 1, 2018, 2,  '화,목', '12:00-13:15', '명신413', 55);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4590', 'c12315', 1, 2018, 2,  '화,목', '15:00-16:15', '명신309', 60);
