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
('1512173', '0000', '������', '��⵵', 'aaaa@gmail.com', '010-0000-0000', 4, '��ǻ�Ͱ��а�');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade,s_major) VALUES
('1511111', '1111', '������', '��⵵', 'bbbb@gmail.com', '010-1111-1111', 4, '��ǻ�Ͱ��а�');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade, s_major) VALUES
('1522222', '2222', '������', '�����', 'cccc@gmail.com', '010-2222-2222', 4, '��ǻ�Ͱ��а�');
INSERT INTO student(s_id, s_pwd, s_name, s_addr, s_email, s_phone, s_grade, s_major) VALUES
('1533333', '3333', '���м�', '��⵵', 'dddd@gmail.com', '010-3333-3333', 4, '��ǻ�Ͱ��а�');


CREATE TABLE course
(
    c_id		VARCHAR2(10),
    c_id_no	NUMBER(1),
    c_name	VARCHAR2(50),
    c_unit	NUMBER(1),
    c_grade	NUMBER(1),
    c_major	VARCHAR2(50),
    CONSTRAINT c_pk PRIMARY KEY (c_id, c_id_no));

INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12345', 1, '�����ͺ��̽�', 3, 4, '����') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12350', 1, '�����Ϸ�', 3, 4, '����') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12355', 1, '�ΰ�����', 3, 4, '����') ;

INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12360', 1, '�Ӻ����', 3, 4, '����') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12365', 1, '���ý��ۼ���', 3, 3, '����') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12370', 1, '���α׷��־��', 3, 3, '����') ;

INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12375', 1, '�����г�ȸ��', 3, 2, '����') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12380', 1, '�ü��', 3, 4, '����') ;
INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12385', 1, '��������ó��', 3, 4, '����') ;

INSERT INTO course(c_id, c_id_no, c_name, c_unit, c_grade, c_major ) VALUES ('c12315', 1, '��ǻ��Ư��', 3, 4, '����') ;


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

INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4580', '4580', '������', '��ǻ�Ͱ��а�', '������414', 'moon@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4545', '4545', '�̻��', '��ǻ�Ͱ��а�', '������408', 'sanglee@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4550', '4550', 'â����', '��ǻ�Ͱ��а�', '������410', 'chang@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4575', '4575', '�ֿ���', '��ǻ�Ͱ��а�', '������409', 'ywchoi@sm.co.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4555', '4555', '������', '��ǻ�Ͱ��а�', '���ñ���ȸ��205', 'hyunjalee@sm.co.kr');

INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4590', '4590', '�̱��', '��ǻ�Ͱ��а�', '������406', ' kiyonglee@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4595', '4595', '������', '��ǻ�Ͱ��а�', '������403', ' ykim@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4530', '4530', '������', '��ǻ�Ͱ��а�', '������405', ' sjyu@sm.ac.kr');

INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4535', '4535', '�ڼ���', '��ǻ�Ͱ��а�', '������ 404', ' blue@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4585', '4585', '���ֱ�', '��ǻ�Ͱ��а�', '������412', ' jgkim@sm.ac.kr');
INSERT INTO professor(p_id, p_pwd, p_name, p_major, p_room, p_email) VALUES ('cs4525', '4525', '������', '��ǻ�Ͱ��а�', '������411', ' choejn@sm.ac.kr');



CREATE TABLE enroll
(
    s_id VARCHAR2(10),
    c_id VARCHAR2(10),
    c_id_no NUMBER(1),
    e_year NUMBER(4),
    e_semester NUMBER(1), -- ���ǽ�
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


INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4545', 'c12350', 1, 2018, 1, 'ȭ,��', '10:30-11:45', '���309', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4575', 'c12355', 1, 2018, 1,  '��,��', '10:30-11:45', '���309', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4555', 'c12345', 1, 2018, 1,  'ȭ,��', '12:00-13:15', '���309', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4585', 'c12375', 1, 2018, 1,  'ȭ,��', '13:30-14:45', '���413', 30);


INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4595', 'c12360', 1, 2018, 1,  'ȭ,��', '17:00-19:00', '���413', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4550', 'c12370', 1, 2018, 1,  '��,��', '10:30-11:45', '���413', 40);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4575', 'c12385', 1, 2018, 1,  '��,��', '17:00-18:45', '���413', 40);

INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4535', 'c12365', 1, 2018, 1, 'ȭ,��', '10:30-11:45', '���414', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4585', 'c12380', 1, 2018, 1,  'ȭ,��', '12:00-13:15', '���413', 55);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4590', 'c12315', 1, 2018, 1,  'ȭ,��', '15:00-16:15', '���309', 60);


INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4545', 'c12350', 1, 2018, 2, 'ȭ,��', '10:30-11:45', '���309', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4575', 'c12355', 1, 2018, 2,  '��,��', '10:30-11:45', '���309', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4555', 'c12345', 1, 2018, 2,  'ȭ,��', '12:00-13:15', '���309', 30);

INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4595', 'c12360', 1, 2018, 2,  'ȭ,��', '17:00-19:00', '���413', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4550', 'c12370', 1, 2018, 2,  '��,��', '10:30-11:45', '���413', 40);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4575', 'c12385', 1, 2018, 2,  '��,��', '17:00-18:45', '���413', 40);

INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max)VALUES ('cs4535', 'c12365', 1, 2018, 2, 'ȭ,��', '10:30-11:45', '���414', 30);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max) VALUES ('cs4585', 'c12380', 1, 2018, 2,  'ȭ,��', '12:00-13:15', '���413', 55);
INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time,  t_room, t_max) VALUES ('cs4590', 'c12315', 1, 2018, 2,  'ȭ,��', '15:00-16:15', '���309', 60);
