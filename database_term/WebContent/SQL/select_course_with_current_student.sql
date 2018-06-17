
  
select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, 
c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, 
t.t_time as time, t.t_max as max
from course c, teach t 
where t.p_id='"+session_id+"' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no;


SELECT c_id as id, c_id_no as id_no, COUNT(*) AS cnt
from enroll 
group by c_id, c_id_no;

SELECT e.c_id as id, e1.c_id as id_no
from enroll e
left join enroll e1 on e.c_id = e1.c_id;


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
  