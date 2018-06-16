
  SELECT *
  FROM course
  WHERE c_id  IN (
    SELECT c_id
    FROM TEACH
    WHERE p_id = 'p001'
  );

  select c.c_id, c.c_id_no , count(*) as cnt
  from enroll e, course c
  where c.c_id = e.c_id and c.c_id_no = e.c_id_no and e.c_id in (
  	select c_id
    from teach
    where p_id = 'p001'
  )
  group by c.c_id, c.c_id_no; --success;
 


CREATE OR REPLACE FUNCTION current_enroll (professorID IN VARCHAR2)
RETURN TABLE
IS 
	TYPE countable IS RECORD (c_id VARCHAR, c_id_no NUMBER, c_name VARCHAR, c_major VARCHAR, c_unit NUMBER, c_grade NUMBER, c_semester NUMBER, c_day VARCHAR, c_time NUMBER, c_max NUMBER, cnt NUMBER);
	TYPE countable_course IS TYPE OF countable index BINARY_INTERGER;
	i BINARY_INTEGER;
BEGIN


select *	
from 
 (select c.c_id as id, c.c_id_no as no_id , count(*) as cnt
  from enroll e, course c
  where c.c_id = e.c_id and c.c_id_no = e.c_id_no and e.c_id in (
  	select c_id
    from teach
    where p_id = 'p001'
  )
  group by c.c_id, c.c_id_no), course cmp
  where cmp.c_id = id and cmp.c_id_no = no_id;
  
  
  select *	
from 
 (select c.c_id as id, c.c_id_no as no_id , count(*) as cnt
  from enroll e, course c
  where c.c_id = e.c_id and c.c_id_no = e.c_id_no and e.c_id in (
  	select c_id
    from teach
    where p_id = ?
  )
  group by c.c_id, c.c_id_no), course cmp
  where cmp.c_id = id and cmp.c_id_no = no_id;
  
  select * from 
  ( select c.c_id as id, c.c_id_no as no_id , count(*) as cnt 
  from enroll e, course c 
  where c.c_id = e.c_id and c.c_id_no = e.c_id_no and e.c_id in 
  ( select c_id from teach where p_id = 'p001') group by c.c_id, c.c_id_no), course cmp where cmp.c_id = id and cmp.c_id_no = no_id;