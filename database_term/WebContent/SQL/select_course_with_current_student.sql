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
  ( select c_id from teach where p_id = 'p001') group by c.c_id, c.c_id_no), course cmp 
  where cmp.c_id = id and cmp.c_id_no = no_id;

  
select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, 
c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, 
t.t_time as time, t.t_max as max
from course c, teach t 
where t.p_id='"+session_id+"' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no;


SELECT c_id as id, c_id_no as id_no, COUNT(*) AS cnt
from enroll 
group by c_id, c_id_no;

SELECT c_id, c_id_no, p_id
from teach;


select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, 
c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, 
t.t_time as time, t.t_max as max, cnt
from course c, teach t, 
(SELECT c_id as id, c_id_no as id_no, COUNT(*) AS cnt
from enroll 
group by c_id, c_id_no)  
where t.p_id='"+session_id+"' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no and c.c_id = id and c_id_no = id_no;

select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, 
c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, 
t.t_time as time, t.t_max as max, cnt
from course c, teach t, 
(SELECT c_id as id, c_id_no as id_no, COUNT(*) AS cnt
from enroll 
group by c_id, c_id_no)  
where t.p_id='1814525' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no and c.c_id = id and c.c_id_no = id_no;
  