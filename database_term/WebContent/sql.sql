select * from course
where c_id in ( select c_id from teach where p_id = 'cs' );


select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, c.c_major as major,
t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, t.t_time as time, t.t_max as max
from course c, teach t
where t.p_id='cs' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no;
