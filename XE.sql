-- bài làm
1. -- s?p x?p
select * from student ORDER BY id;
select * from student ORDER BY gender;
select * from student ORDER BY birthday asc, scholarship desc;
2.--tìm ki?m theo d?ng ( like )
select * from subject;
select * from subject where name like 'T%';
3-- 
select * from student;
select * from student where student.name like '%i';
4-- kí t? th? 2 ch?a n => _n%
select * from faculty where faculty.name like '_n%';
5--

-- lấy thị... hoặc ... thị
select * from student where student.name like '%Th?%';
6--
select * from student where substr(student.name,1,1) between 'A' and 'M'order by student.name asc;
7--
select * from student where student.scholarship>100000 order by student.faculty_id asc;
8--
select * from student where student.scholarship >=150000 and student.hometown = 'Hà N?i';
9--
--chỉ nên để 1 định dạng duy nhất, nên là yyyymmdd
select * from student where student.birthday between to_date(19910101, 'YYYYMMDD') and to_date(19920605, 'YYYYMMDD');

10--
select * from student where student.scholarship >=80000 and student.scholarship <=150000;
-- ho?c
select * from student where student.scholarship between 80000 and 150000;

11--
select * from subject where subject.lesson_quantity >=30 and subject.lesson_quantity <=45;

-- B
--1 khó
    select id, name, gender, birthday, hometown, 
    case 
        when scholarship > 500000 then 'Học bổng cao' 
        else  'Học bổng trung bình' 
    end   loai_hoc_bong 
    from student;
2 -- 
select count(*) as tongsv from student;
3--
select gender,count(*) from student group by gender;
4-- 
select faculty_id,count(*) studentNum from student group by student.faculty_id;



5--
select subject_id, count(distinct student_id)from exam_management group by subject_id
6--

select student_id, count(distinct subject_id) from exam_management group by student_id;

7--
select faculty_id,count(student.scholarship)from student group by student.faculty_id;
8-- nvl ?? trong th null thì thay th? = 1 giá tr? khác
select faculty_id, max(nvl(student.scholarship,0)) from student group by student.faculty_id;




9--

10--
select to_number(to_char(sysdate, 'YYYY')) - to_number(to_char(bithday, 'YYYY')) age, count(student.id) student_number 
from student 
group by to_number(to_char(sysdate, 'YYYY')) - to_number(to_char(bithday, 'YYYY'));
11--
select hometown, count(student.id) student_count  from student group by hometown having count(student.id) > 2;
12--
select student_id, subject_id, count(number_of_exam_taking) number_of_exam_takingfrom exam_management
group by student_id, subject_id 
having count(number_of_exam_taking) >= 2;
13--
select s.name, avg(mark) avg_mark from student s
join exam_management e on s.id = e.student_id
where s.gender = 'Nam' and e.number_of_exam_taking = 1
group by s.name having avg(mark) > 7;
14--
select s.name, count(e.subject_id) failed_subject
from student s
join exam_management e on s.id = e.student_id
where e.number_of_exam_taking = 1 and e.mark < 4
group by s.name
having count(e.subject_id) >= 2;
15--
select faculty.name, count(gender) student_count
from student, faculty
where student.faculty_id = faculty.id
    and gender = 'Nữ'
group by faculty.name
having count(gender) > 2;
16--
select faculty_id, count(student.id) student_number
from student
where scholarship between 200000 and 300000
group by faculty_id
having count(id) = 2;


17--
select * from student where student.scholarship = (select max(student.scholarship) from student);
--C
1 --
select * from student where to_char(birthday,'MM') = '02' and student.hometown = 'Hà N?i';
2--
select * from student where to_number(to_char(sysdate,'YYYY'))- to_number(to_char(birthday,'YYYY'))>=20;
3--
select * from student where to_number(to_char(birthday,'MM')) in (1,2,3) and hometown = 'Hà N?i';
D--
1--
select student.name, faculty.name 
from student, faculty
where student.faculty_id = faculty.id 
and (faculty.name = 'Anh - Văn' or faculty.name = 'Vật lý');
2--
select s.name student_name, f.name faculty_name
from student s
join faculty f on s.faculty_id = f.id
where (f.name = 'Anh - Văn' or f.name = 'Tin học') 
    and s.gender = 'Nam';
3--
4--
5--
6--
7--
8--
select faculty.name, count(student.id) student_number
from faculty
left join student on faculty.id = student.faculty_id
group by faculty.name
having count(student.id) = 0;

