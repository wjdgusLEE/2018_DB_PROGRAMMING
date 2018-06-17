
DROP TABLE PROFESSOR;
DROP TABLE STUDENT;
DROP TABLE ENROLL;
DROP TABLE COURSE;
DROP TABLE TEACH;


CREATE TABLE student
(
    s_id VARCHAR2(10) CONSTRAINT s_pk PRIMARY KEY,
    s_pwd VARCHAR2(10) not null,
    s_name VARCHAR2(50) not null,
    s_email VARCHAR2(100),
    s_phone VARCHAR2(100),
    s_grade NUMBER(1),
    s_major VARCHAR2(50)   not null
);

insert into student (s_id, s_name, s_email, s_major, s_pwd) values('1500004', '이정현', 'aaaa@naver.com', '컴퓨터과학과', '1234');
insert into student (s_id, s_name, s_email, s_major, s_pwd) values('1500000', '오지은', 'bbbb@naver.com', '컴퓨터과학과', '0000');
insert into student (s_id, s_name, s_email, s_major, s_pwd) values('1500001', '정혜린', 'cccc@naver.com', '컴퓨터과학과', '1111');
insert into student (s_id, s_name, s_email, s_major, s_pwd) values('1500002', '김학도', 'dddd@naver.com', '컴퓨터과학과', '2222');



CREATE TABLE professor
(
    p_id VARCHAR2(10) CONSTRAINT p_pk PRIMARY KEY,
    p_pwd VARCHAR2(10)   not null,
    p_name VARCHAR2(50)   not null,
    p_major VARCHAR2(50)   not null,
    p_email VARCHAR2(100)
);


insert into professor values('p001', '1111', '심준호', '컴퓨터과학과', 'Shim@sookmung.ac.kr ');
insert into professor values('p002', '2223', '창병모', '컴퓨터과학과', 'Chang@sookmung.ac.kr ');
insert into professor values('p003', '3332', '이기용', '컴퓨터과학과','Lee@sookmung.ac.kr ');
insert into professor values('p004', '4441', '김주균', '컴퓨터과학과', 'Kim@sookmung.ac.kr ');


--CREATE TABLE course
--(
--    c_id VARCHAR2(10) CONSTRAINT c_pk PRIMARY KEY,
--    c_id_no NUMBER(1),
--    c_name VARCHAR2(50),
--    c_major VARCHAR2(50),
--    c_unit NUMBER(1),
--    c_grade NUMBER(1),
--    c_semester NUMBER(1),
--    c_day VARCHAR2(20),
--    c_time NUMBER,
--    c_max NUMBER(3)
--);

CREATE TABLE course
(
    c_id VARCHAR2(10),
    c_id_no NUMBER(1),
    c_name VARCHAR2(50),
    c_major VARCHAR2(50),
    c_unit NUMBER(1),
    c_grade NUMBER(1),
    c_semester NUMBER(1),
    c_day VARCHAR2(20),
    c_time NUMBER,
    c_max NUMBER(3),
    CONSTRAINT c_pk PRIMARY KEY (c_id, c_id_no)
); -- SUCCESS

-- unit 학점 
-- grade 학년
-- max 최대
-- day 요일
-- time 1,2,3
-- semester 학기

insert into course values('c001', 1, '데이터베이스', '컴퓨터과학과', 3, 4,  1,'월/수', 1, 35);
insert into course values('c001', 2, '데이터베이스', '컴퓨터과학과', 2, 3, 2,'화/목', 3, 25);
insert into course values('c002', 1, '프로그래밍언어론', '컴퓨터과학과', 3, 3, 1,'월/수', 5, 55);
insert into course values('c003', 1, '수치해석', '컴퓨터과학과', 3, 2, 1,'화/목', 2, 30);
insert into course values('c004', 1, '운영체제', '컴퓨터과학과', 3, 4, 2,'화/금', 2, 40);

CREATE TABLE enroll
(
    s_id VARCHAR2(10) CONSTRAINT e_s_fk REFERENCES student(s_id),
    c_id VARCHAR2(10) ,
   	c_id_no NUMBER, 
   	CONSTRAINT e_c_fk FOREIGN KEY (c_id, c_id_no) REFERENCES course(c_id, c_id_no),
    CONSTRAINT e_uk UNIQUE (s_id, c_id, c_id_no)
);

insert into enroll values('1500004', 'c004', 1);
insert into enroll values('1500004', 'c001', 1);
insert into enroll values('1500000', 'c001', 2);
insert into enroll values('1500000', 'c002', 1);
insert into enroll values('1500001', 'c004', 1);
insert into enroll values('1500001', 'c003', 1);
insert into enroll values('1500002', 'c002', 1);
insert into enroll values('1500002', 'c003', 1);


CREATE TABLE teach
(
    p_id VARCHAR2(10) CONSTRAINT t_p_fk REFERENCES professor(p_id),
    c_id VARCHAR2(10) ,
    c_id_no NUMBER ,
    CONSTRAINT t_c_fk FOREIGN KEY (c_id, c_id_no) REFERENCES course(c_id, c_id_no),
    CONSTRAINT t_uk UNIQUE(p_id, c_id, c_id_no)
);

insert into teach values('p001', 'c001', 1);
insert into teach values('p001', 'c001', 2);
insert into teach values('p002', 'c002', 1);
insert into teach values('p003', 'c003', 1);
insert into teach values('p004', 'c004', 1);

CREATE TABLE manager(
	m_id VARCHAR2(20) CONSTRAINT m_pk PRIMARY KEY,
	m_pwd VARCHAR2(20),
	m_name VARCHAR2(20),
	m_email VARCHAR2(20)
);

insert into manager values('m01', '1111','김숙명', 'manager1@gmail.com');
insert into manager values('m02', '2222','장숙명', 'manager2@yahoo.com');
