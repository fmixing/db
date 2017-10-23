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
	(5, 4, 5);

insert into marks (StudentID, CourseID, MarkValue) values
	(4, 5, 2);

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
insert into plan (GroupID, CourseID, LecturerID) values (2, 5, 3);

insert into plan (GroupID, CourseID, LecturerID) values (3, 1, 1);
insert into plan (GroupID, CourseID, LecturerID) values (4, 2, 1);
insert into plan (GroupID, CourseID, LecturerID) values (4, 5, 3);


select StudentID, StudentName, GroupID from Students 
	where exists
	(select Marks.StudentID from Marks where 
	Marks.MarkValue = 5 and 
	Marks.StudentID = Students.StudentID and
	Marks.CourseID in
	(select distinct CourseID from Plan where
		Plan.GroupID = Students.GroupID and
		Plan.CourseID in 
		(select Courses.CourseID from Courses where 
			Courses.CourseName = 'Базы данных'))); 

select StudentID, StudentName, GroupID from Students 
	where exists
	(select Marks.StudentID from Marks where 
	Marks.MarkValue = 5 and 
	Marks.StudentID = Students.StudentID and
	Marks.CourseID in 
		(select Courses.CourseID from Courses where 
			Courses.CourseName = 'Базы данных')); 
--1
select StudentID, StudentName, GroupID from Students 
	where StudentID in
	(select Marks.StudentID from Marks where 
	Marks.MarkValue = 5 and 
	Marks.CourseID in 
		(select Courses.CourseID from Courses where 
			Courses.CourseName = 'Базы данных')); 

--2a
select StudentID, StudentName, GroupID from Students 
	where StudentID not in
	(select Marks.StudentID from Marks where 
	Marks.CourseID in 
		(select Courses.CourseID from Courses where 
			Courses.CourseName = 'Базы данных')); 

--2b
select StudentID, StudentName, GroupID from Students where
		Students.StudentID not in
		(select Marks.StudentID from Marks where 
			Marks.StudentID = Students.StudentID and
			Marks.CourseID in 
			(select Courses.CourseID from Courses where 
				Courses.CourseName = 'Базы данных'))
		and Students.GroupID in 
			(select GroupID from Plan where
				Plan.CourseID in 
				(select Courses.CourseID from Courses where 
					Courses.CourseName = 'Базы данных'));

--3
select StudentID, StudentName, GroupID from Students 
	where StudentID in
	(select Marks.StudentID from Marks where 
		Marks.CourseID in 
		(select CourseID from Plan where 
			LecturerID in 
			(select LecturerID from Lecturers where
				Lecturers.LecturerName = 'Георгий Корнеев'))); 

--4
select StudentID from Students 
	where Students.StudentID not in
	(select Marks.StudentID from Marks where 
		Marks.CourseID in 
		(select CourseID from Plan where 
			LecturerID in 
			(select LecturerID from Lecturers where
				Lecturers.LecturerName = 'Георгий Корнеев'))); 

--5
select StudentID, StudentName, GroupID from Students 
	where exists
	(select distinct Marks.StudentID from Marks where
		Marks.StudentID = Students.StudentID and
		Marks.CourseID in (select distinct CourseID from Plan where 
			LecturerID in 
			(select LecturerID from Lecturers where
				Lecturers.LecturerName = 'Георгий Корнеев'))
		and Marks.CourseID <> any (select CourseID from Marks where Marks.StudentID = Students.StudentID));

select StudentID from Students where
	not exists (select * from (select distinct CourseID from Plan where 
		LecturerID in 
		(select LecturerID from Lecturers where
			Lecturers.LecturerName = 'Георгий Корнеев') and 
		CourseID not in (
			select distinct Marks.CourseID from Marks where
				Marks.StudentID = Students.StudentID and
				Marks.CourseID in (select distinct CourseID from Plan where 
					LecturerID in 
					(select LecturerID from Lecturers where
						Lecturers.LecturerName = 'Георгий Корнеев')))) as aaa);
--6

select Students.StudentName, Courses.CourseName from Students, Courses 
	where Students.GroupID in
	(select GroupID from Plan where 
		Courses.CourseID = Plan.CourseID);

select distinct Students.StudentName, Courses.CourseName from Students, Courses, Plan
	where Courses.CourseID = Plan.CourseID and Students.GroupID = Plan.GroupID;

--7

select distinct Lecturers.LecturerName, Students.StudentName from Students, Lecturers 
	where Students.GroupID in
	(select GroupID from Plan where
		Lecturers.LecturerID = Plan.LecturerID);

select distinct Lecturers.LecturerName, Students.StudentName from Students, Lecturers, Plan
	where Lecturers.LecturerID = Plan.LecturerID and Students.GroupID = Plan.GroupID;

--8
select S1.StudentName, S2.StudentName from Students as S1, Students as S2
	where not exists
	(select * from Marks where
		Marks.StudentID = S1.StudentID and
		Marks.CourseID not in (select CourseID from Marks where Marks.StudentID = S2.StudentID))
	and exists (select CourseID from Marks where Marks.StudentID = S1.StudentID);



