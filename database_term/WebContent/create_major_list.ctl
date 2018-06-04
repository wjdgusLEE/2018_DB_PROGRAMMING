LOAD DATA
INFILE 'D:\Desktop\major_list.csv'
into table MAJOR
fields terminated by ','  lines terminated by '\n'
(
major varchar2(30)
)
