
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

insert into student (s_id, s_name, s_email, s_major, s_pwd) values('1500004', '������', 'aaaa@naver.com', '��ǻ�Ͱ��а�', '1234');
insert into student (s_id, s_name, s_email, s_major, s_pwd) values('1500000', '������', 'bbbb@naver.com', '��ǻ�Ͱ��а�', '0000');
insert into student (s_id, s_name, s_email, s_major, s_pwd) values('1500001', '������', 'cccc@naver.com', '��ǻ�Ͱ��а�', '1111');
insert into student (s_id, s_name, s_email, s_major, s_pwd) values('1500002', '���е�', 'dddd@naver.com', '��ǻ�Ͱ��а�', '2222');



CREATE TABLE professor
(
    p_id VARCHAR2(10) CONSTRAINT p_pk PRIMARY KEY,
    p_pwd VARCHAR2(10)   not null,
    p_name VARCHAR2(50)   not null,
    p_major VARCHAR2(50)   not null,
    p_email VARCHAR2(100)
);


insert into professor values('p001', '1111', '����ȣ', '��ǻ�Ͱ��а�', 'Shim@sookmung.ac.kr ');
insert into professor values('p002', '2223', 'â����', '��ǻ�Ͱ��а�', 'Chang@sookmung.ac.kr ');
insert into professor values('p003', '3332', '�̱��', '��ǻ�Ͱ��а�','Lee@sookmung.ac.kr ');
insert into professor values('p004', '4441', '���ֱ�', '��ǻ�Ͱ��а�', 'Kim@sookmung.ac.kr ');


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

-- unit ���� 
-- grade �г�
-- max �ִ�
-- day ����
-- time 1,2,3
-- semester �б�

insert into course values('c001', 1, '�����ͺ��̽�', '��ǻ�Ͱ��а�', 3, 4,  1,'��/��', 1, 35);
insert into course values('c001', 2, '�����ͺ��̽�', '��ǻ�Ͱ��а�', 2, 3, 2,'ȭ/��', 3, 25);
insert into course values('c002', 1, '���α׷��־���', '��ǻ�Ͱ��а�', 3, 3, 1,'��/��', 5, 55);
insert into course values('c003', 1, '��ġ�ؼ�', '��ǻ�Ͱ��а�', 3, 2, 1,'ȭ/��', 2, 30);
insert into course values('c004', 1, '�ü��', '��ǻ�Ͱ��а�', 3, 4, 2,'ȭ/��', 2, 40);

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

insert into manager values('m01', '1111','�����', 'manager1@gmail.com');
insert into manager values('m02', '2222','�����', 'manager2@yahoo.com');
