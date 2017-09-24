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

alter table students 
add constraint fk1 foreign key (groupid) references groups(groupid);

create table Courses (
CourseID int primary key,
CourseName varchar(50) not null,
LecturerID int not null
);

create table Lecturers (
LecturerID int primary key,
LecturerName varchar(50) not null
);

alter table courses 
add constraint fk2 foreign key (lecturerid) references lecturers(lecturerid);

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

select * from students natural join groups ;

insert into lecturers (LecturerID, LecturerName) values 
	(1, 'Андрей Станкевич'), (2, 'Георгий Корнеев'),
	 (3, 'Павел Скаков');

insert into courses (CourseID, CourseName, LecturerID) values 
	(1, 'АСД', 1), (2, 'Дискретная математика', 1), (3, 'Парадигмы программирования', 2),
	(4, 'Java Advanced', 2), (5, 'Архитектура ЭВМ', 3);

select * from courses natural join lecturers ;

insert into Marks (StudentID, CourseID, MarkValue) values 
	(1, 1, 3), (1, 2, 4), (4, 3, 5), (9, 4, 2), (10, 5, 5);

select students.StudentID, students.StudentName, 
	Marks.MarkValue, Courses.CourseName from students 
	inner join Marks on students.StudentID = Marks.StudentID 
	inner join Courses on Marks.CourseID = Courses.CourseID;


