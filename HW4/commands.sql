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
CourseName varchar(50) not null
);

create table Lecturers (
LecturerID int primary key,
LecturerName varchar(50) not null
);

create table TeachingProcess (
StudentID int not null,
CourseID int not null,
LecturerID int not null,
MarkValue int not null,
primary key (StudentID, CourseID)
);

alter table teachingprocess 
add constraint fk2 foreign key (studentid) references students(studentid);

alter table teachingprocess 
add constraint fk3 foreign key (courseid) references courses(courseid);

alter table teachingprocess 
add constraint fk4 foreign key (lecturerid) references lecturers(lecturerid);

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

insert into courses (CourseID, CourseName) values 
	(1, 'АСД'), (2, 'Дискретная математика'), (3, 'Парадигмы программирования'),
	(4, 'Java Advanced'), (5, 'Архитектура ЭВМ');

insert into teachingprocess (StudentID, CourseID, LecturerID, MarkValue) values
	(1, 1, 1, 3), (2, 2, 1, 5), (3, 3, 2, 2), (3, 4, 2, 3), (4, 5, 3, 4);

select * from teachingprocess natural join lecturers ;

select students.StudentID, students.StudentName, groups.GroupID, 
	TeachingProcess.MarkValue, Courses.CourseName from students 
	inner join TeachingProcess on students.StudentID = teachingprocess.StudentID 
	inner join Groups on students.StudentID = groups.GroupID
	inner join Courses on teachingprocess.CourseID = Courses.CourseID;
