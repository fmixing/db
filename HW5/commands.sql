DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

create table Students (
StudentID int primary key,
StudentName varchar(50) not null,
GroupID int not null
);

create table Groups (
GroupID int primary key,
GroupName varchar(50) not null
);

create table Courses (
CourseID int primary key,
CourseName varchar(50) not null
);

create table Lecturers (
LecturerID int primary key,
LecturerName varchar(50) not null
);

create table Plan (
GroupID int not null,
CourseID int not null,
LecturerID int not null
);

create table Marks (
StudentID int not null,
CourseID int not null,
MarkValue int not null,
primary key (StudentID, CourseID)
);

insert into groups (groupid, GroupName) values 
	('1', 'M3436'), ('2', 'M3437'), ('3', 'M3438'), ('4', 'M3439');

insert into students (StudentID, StudentName, GroupID) values 
	(1, 'Лиза Студеникина', 1), (2, 'Андрей Гончар', 1),
	 (3, 'Артем Жолус', 1);

insert into students (StudentID, StudentName, GroupID) values 
	(4, 'Алиса Королева', 2), (5, 'Соня Кочкова', 2),
	 (6, 'Аня Кустарева', 2);

insert into students (StudentID, StudentName, GroupID) values 
	(7, 'Коля Поперечный', 3), (8, 'Арина Александрова', 3),
	 (9, 'Валерия Алферова', 3);

insert into students (StudentID, StudentName, GroupID) values 
	(10, 'Влад Сазанович', 4), (11, 'Дмитрий Якутов', 4),
	 (12, 'Данил Коликов', 4);

insert into lecturers (LecturerID, LecturerName) values 
	(1, 'Андрей Станкевич'), (2, 'Георгий Корнеев'),
	 (3, 'Павел Скаков');

insert into courses (CourseID, CourseName) values 
	(1, 'АСД'), (2, 'Дискретная математика'), (3, 'Базы данных'),
	(4, 'Java Advanced'), (5, 'Архитектура ЭВМ');

insert into marks (StudentID, CourseID, MarkValue) values
	(1, 3, 5), (1, 4, 5);

insert into marks (StudentID, CourseID, MarkValue) values 
	(2, 3, 4), (3, 3, 5);

insert into marks (StudentID, CourseID, MarkValue) values
	(2, 4, 5);

insert into marks (StudentID, CourseID, MarkValue) values 
	(7, 1, 3), (10, 2, 4), (4, 3, 5), (4, 4, 3), (10, 5, 5);

insert into plan (GroupID, CourseID, LecturerID) values (1, 3, 2);
insert into plan (GroupID, CourseID, LecturerID) values (1, 4, 2);
insert into plan (GroupID, CourseID, LecturerID) values (2, 4, 2);
insert into plan (GroupID, CourseID, LecturerID) values (2, 3, 2);
insert into plan (GroupID, CourseID, LecturerID) values (3, 1, 1);
insert into plan (GroupID, CourseID, LecturerID) values (4, 2, 1);
insert into plan (GroupID, CourseID, LecturerID) values (4, 5, 3);

select StudentID, StudentName, GroupID from Students 
	natural join Marks 
	natural join Plan
	natural join Courses where (Courses.CourseName = 'Базы данных');

select * from students except all 
	(select StudentID, StudentName, GroupID from students 
		natural join marks 
		natural join courses where (courses.coursename = 'Базы данных'));

select StudentId, StudentName, GroupId from students 
	natural join plan 
	natural join courses where courses.coursename = 'Базы данных' 
	except all (select StudentId, StudentName, GroupId from students
	natural join plan 
	natural join marks 
	natural join courses where courses.coursename = 'Базы данных');

select StudentId, StudentName, GroupId from students
	natural join marks 
	natural join plan 
	natural join Lecturers where lecturers.LecturerName = 'Георгий Корнеев';

select distinct StudentId, StudentName, GroupId from students
	natural join plan 
	natural join Lecturers where lecturers.LecturerName = 'Георгий Корнеев'
	except all (select distinct StudentId, StudentName, GroupId from students
	natural join marks 
	natural join plan 
	natural join Lecturers where lecturers.LecturerName = 'Георгий Корнеев');

select StudentId from students
	except all (select StudentId from students
	natural join marks 
	natural join plan 
	natural join Lecturers where lecturers.LecturerName = 'Георгий Корнеев');

select distinct studentid, studentname, students.groupid, markvalue, planlec.courseid from students
	natural join marks
	natural join plan,
	(select distinct courseid from plan natural join lecturers where lecturers.LecturerName = 'Георгий Корнеев') as planlec;

select * from students 
	natural join plan
	natural join marks
	natural join lecturers where lecturers.LecturerName = 'Георгий Корнеев';

select distinct studentid, studentname, students.groupid from students
	natural join marks
	natural join plan,
	(select distinct courseid from plan natural join lecturers where lecturers.LecturerName = 'Георгий Корнеев') as planlec
	except all 
	(select studentid, studentname, withoutpair.groupid from 
	(select distinct studentid, studentname, students.groupid, planlec.courseid from students
	natural join marks
	natural join plan,
	(select distinct courseid from plan natural join lecturers where lecturers.LecturerName = 'Георгий Корнеев') as planlec
	except all
	(select distinct studentid, studentname, students.groupid, courseid from students 
	natural join plan
	natural join marks)) as withoutpair);

select studentname, coursename from students 
	natural join plan
	natural join courses;

select LecturerID, LecturerName, StudentName from Lecturers
	natural join plan
	natural join students;

select distinct sndElem.SN2, StudentName as SN1 from students
	natural join plan
	natural join marks,
	(select StudentName as SN2 from students
	natural join plan
	natural join marks) as sndElem
	except all (
		select distinct SN2, SN1 from 
		(select distinct StudentName as SN1, sndElem.SN2, sndElem.CID2 from students
			natural join plan
			natural join marks,
			(select StudentName as SN2, CourseID as CID2 from students
				natural join plan
				natural join marks) as sndElem
			except all
			(select distinct StudentName as SN1, sndElem.SN2, courseid from students
				natural join plan
				natural join marks
				natural join 
				(select distinct StudentName as SN2, courseid from students
					natural join plan
					natural join marks) as sndElem)) as proj);

select avg(MarkValue) as MarkValue from students
	natural join marks
	natural join plan
	where students.studentid = '1';

select avg(MarkValue) as MarkValue, StudentId from students
	natural join marks
	natural join plan
	group by StudentId;

select avg(MarkValue) as MarkValue, GroupID from
	(select avg(MarkValue) as MarkValue, StudentId, GroupID from students
	natural join marks
	natural join plan
	group by StudentId) as studAvg group by GroupID;

select *, allandpassed.countall - allandpassed.countPassed as countfailed from
	(select t1.studentid as studentid, t1.countall as countall, t2.countPassed as countPassed from
 		(select count(plan.courseid) as countall, StudentID from students
			natural join plan
			group by studentid) as t1,
 		(select allMarks.StudentID, count(allMarks.markvalue) as countPassed from
			(select distinct students.studentid as studentid, plan.courseid as courseid, markvalue from students
				natural join plan
				left join marks on (students.studentid = marks.studentid and marks.courseid = plan.courseid)) as allMarks
			group by studentid) as t2
	where t1.studentid = t2.studentid) as allandpassed;
 
