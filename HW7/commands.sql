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

alter table Plan 
add constraint fk1 foreign key (groupid) references groups(groupid) on delete cascade on update cascade;

alter table Plan 
add constraint fk2 foreign key (courseid) references courses(courseid) on delete cascade on update cascade;

alter table Plan 
add constraint fk3 foreign key (lecturerid) references lecturers(lecturerid) on delete cascade on update cascade;

alter table marks 
add constraint fk4 foreign key (studentid) references students(studentid) on delete cascade on update cascade;

alter table marks 
add constraint fk5 foreign key (courseid) references courses(courseid) on delete cascade on update cascade;

insert into groups (groupid, GroupName) values 
	('1', 'M3436'), ('2', 'M3437'), ('3', 'M3438'), ('4', 'M3439');

insert into students (StudentID, StudentName, GroupID) values 
	(1, 'Лиза Студеникина', 1), (2, 'Артем Жолус', 1);

insert into students (StudentID, StudentName, GroupID) values 
	(4, 'Алиса Королева', 2), (5, 'Соня Кочкова', 2);

insert into students (StudentID, StudentName, GroupID) values 
	(7, 'Коля Поперечный', 3);

insert into students (StudentID, StudentName, GroupID) values 
	(10, 'Влад Сазанович', 4);

insert into lecturers (LecturerID, LecturerName) values 
	(1, 'Андрей Станкевич'), (2, 'Георгий Корнеев'),
	 (3, 'Павел Скаков');

insert into courses (CourseID, CourseName) values 
	(1, 'АСД'), (2, 'Дискретная математика'), (3, 'Базы данных'),
	(4, 'Java Advanced'), (5, 'Архитектура ЭВМ');

insert into plan (GroupID, CourseID, LecturerID) values (1, 3, 2);
insert into plan (GroupID, CourseID, LecturerID) values (1, 4, 2);
insert into plan (GroupID, CourseID, LecturerID) values (1, 1, 1);
insert into plan (GroupID, CourseID, LecturerID) values (1, 2, 1);

insert into plan (GroupID, CourseID, LecturerID) values (2, 4, 2);
insert into plan (GroupID, CourseID, LecturerID) values (2, 3, 2);
insert into plan (GroupID, CourseID, LecturerID) values (2, 1, 1);
insert into plan (GroupID, CourseID, LecturerID) values (2, 2, 1);

insert into plan (GroupID, CourseID, LecturerID) values (3, 1, 1);
insert into plan (GroupID, CourseID, LecturerID) values (3, 2, 1);
insert into plan (GroupID, CourseID, LecturerID) values (3, 5, 3);

insert into plan (GroupID, CourseID, LecturerID) values (4, 2, 1);
insert into plan (GroupID, CourseID, LecturerID) values (4, 5, 3);
insert into plan (GroupID, CourseID, LecturerID) values (4, 1, 1);

insert into marks (StudentID, CourseID, MarkValue) values
	(1, 3, 100), (1, 4, 100), (2, 3, 100), (2, 4, 100), 
	(1, 1, 61), (2, 2, 95);

insert into marks (StudentID, CourseID, MarkValue) values 
	(4, 3, 82), (5, 3, 80), (5, 4, 100);

insert into marks (StudentID, CourseID, MarkValue) values
	(7, 1, 65), (7, 2, 76);

insert into marks (StudentID, CourseID, MarkValue) values 
	(10, 2, 80), (10, 5, 100), (10, 1, 100);

-- merge into marks using 
-- 	(select StudentID, CourseID from Students natural join plan) as R
-- 	on R.StudentID = Marks.StudentID and R.CourseID = Marks.StudentID
-- 	when not matched then insert (R.StudentID, R.CourseID, 20);

insert into marks 
	(select StudentID, CourseID, 0 from Students natural join plan) 
	on conflict do nothing;

select * from marks order by studentid ASC;

-- 1. Напишите запрос, удаляющий всех студентов, не имеющих долгов.

select * from Students where StudentID not in 
	(select StudentID from marks where 
		MarkValue <= 60);

-- 2. Напишите запрос, удаляющий всех студентов, имеющих 3 и более долгов.

select * from Students where StudentID in 
	(select StudentID from marks where 
		MarkValue <= 60
	group by (StudentID)
	having count(StudentID) >= 3);

-- 3. Напишите запрос, удаляющий все группы, в которых нет студентов.

select * from groups where GroupID not in 
	(select GroupID from Students);


-- 4. Создайте view Losers в котором для каждого студента, имеющего долги указано их количество.

create view Losers as 
	select StudentID, count(MarkValue) from Marks where
		MarkValue <= 60
	group by (StudentID);

-- 5. Создайте таблицу LoserT, в которой содержится та же информация, что во view Losers. 
-- Эта таблица должна автоматически обновляться при изменении таблицы с баллами.

create table LoserT (
	StudentID int primary key,
	Count int
);

create or replace function updateLoserTProcedure() returns trigger as $$
    begin
    	truncate table LoserT;
    	insert into LoserT (select * from Losers);
    	return new;
    end;
    $$ LANGUAGE plpgsql;


create trigger updateLoserT 
	after delete or insert or update on Marks
	for each row 
	execute procedure updateLoserTProcedure();

-- update marks set MarkValue=85 where studentid = 4 and courseid = 4; -- изменяет таблицу LoserT

-- 6. Отключите автоматическое обновление таблицы LoserT.

drop trigger if exists updateLoserT on Marks;


-- 8. Добавьте проверку того, что все студенты одной группы изучают один и тот же набор курсов.

create or replace function checkMarks() returns trigger as $$
    begin
    	if exists (select * from Marks 
			where not exists 
				(select * from Plan where
					Plan.CourseID = Marks.CourseID and
					Plan.GroupID = (select GroupID from Students where Students.StudentID = Marks.StudentID)))
    	then
    		raise exception 'Студент не должен иметь оценок по курсам, которые он не проходил';
    	end if;
    	return new;
    end;
    $$ LANGUAGE plpgsql;


create trigger checkMarks 
	after delete or insert or update on Marks
	for each row 
	execute procedure checkMarks();

-- insert into marks (StudentID, CourseID, MarkValue) values (4, 5, 100); -- вызывает ошибку

-- 9. Создайте триггер, не позволяющий уменьшить баллы студента по предмету. При попытке такого изменения, баллы изменяться не должны

create or replace function checkLoweringScore() returns trigger as $$
    begin
    	if new.MarkValue < old.MarkValue then
    		return old;
    	end if;
    	return new;
    end;
    $$ LANGUAGE plpgsql;


create trigger checkLoweringScore 
	before update on Marks
	for each row
	execute procedure checkLoweringScore();

-- update marks set MarkValue = 80 where StudentID = 4 and CourseID = 3; - ничего не делает
