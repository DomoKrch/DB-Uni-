select * from course where (credits > 3);

select * from classroom where (building = 'Packard' or building = 'Watson');

select * from course where (dept_name = 'Comp. Sci.');

select course.course_id, course.title, course.dept_name, course.credits,
section.semester from course
inner join section
on (course.course_id = section.course_id)
where section.semester = 'Fall';

select * from student where (tot_cred > 45 and tot_cred < 90);

select * from student
where (name like '%a' or name like '%i' or name like '%e'
           or name like '%o' or name like '%u');

select course.course_id, course.title, course.dept_name, course.credits,
prereq.prereq_id from course
inner join prereq
on (course.course_id = prereq.course_id)
where prereq.prereq_id = 'CS-101';







