select student.name, takes.grade, takes.course_id
from student inner join takes
on student.id = takes.id
where takes.course_id like 'CS%' and (takes.grade like 'A' or takes.grade like '-A')
order by student.name;

select instructor.name as advisor, student.name, takes.grade
from instructor
inner join advisor on instructor.id = advisor.i_id
inner join student on student.id = advisor.s_id
inner join takes on takes.id = student.id
where takes.grade != 'B+' and takes.grade != 'B-' and takes.grade != 'B'
       and takes.grade != 'A' and takes.grade != 'A-' and takes.grade != 'A+';

select student.dept_name, student.name, takes.grade
from student inner join takes
on student.id = takes.id
where takes.grade != 'F' and takes.grade != 'C';

select instructor.name, teaches.course_id, takes.grade
from instructor
inner join teaches on instructor.id = teaches.id
inner join takes on teaches.course_id = takes.course_id
where takes.grade != 'A';

select section.course_id, time_slot.start_hr, time_slot.start_min
from section
inner join time_slot on section.time_slot_id = time_slot.time_slot_id
where time_slot.start_hr < 13;






