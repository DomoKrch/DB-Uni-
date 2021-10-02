select department.dept_name, round(avg(instructor.salary), 0) as avg_salary
from department
inner join instructor on (department.dept_name = instructor.dept_name)
group by department.dept_name
order by avg_salary;

select building, courses from
(select building, count(course_id) as courses
from section
group by building
order by courses desc) as foo
limit 1;

select dept_name, count(course_id) as courses
from course
group by dept_name
order by courses
limit 1;

select name, cs_courses from
(select student.name, count(course_id) as cs_courses
from student
inner join takes on student.id = takes.id
where course_id like 'CS%'
group by student.name) as foo
where cs_courses > 3;

select name, dept_name
from instructor
where dept_name = 'Biology' or dept_name = 'Music' or dept_name = 'Philosophy';

select instructor.name, teaches.year
from instructor
inner join teaches on instructor.id = teaches.id
where teaches.year = '2018' and teaches.year != '2017';









