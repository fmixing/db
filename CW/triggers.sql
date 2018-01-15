create or replace function createCompetition() returns trigger as $$
    begin
    	if not exists (select * from EventOlympiads where OlympiadId = new.OlympiadId and EventId = new.EventId) 
    	then
    		raise exception 'В олимпиаде не было события с таким EventId';
    	end if;
    	if not exists (select * from SportOlympiads where OlympiadId = new.OlympiadId and 
    		SportId = (select SportId from SportEvents where EventId = new.EventId)) 
    	then
    		raise exception 'В олимпиаде не было события с таким EventId';
    	end if;
    	return new;
    end;
    $$ LANGUAGE plpgsql;


create trigger createCompetition 
	after insert or update on Competition
	for each row 
	execute procedure createCompetition();

-- insert into Competition (EndingDate, CompetitionId, OlympiadId, EventId) values
-- 	('2008-08-16', 17, 26, 99); --7.5 km --Ошибка

-- insert into Competition (EndingDate, CompetitionId, OlympiadId, EventId) values
-- 	('2008-08-16', 17, 26, 1); --7.5 km --Все нормально


create or replace function createEventOlympiads() returns trigger as $$
    begin
    	if not exists (select * from SportOlympiads where OlympiadId = new.OlympiadId and 
    		SportId = (select SportId from SportEvents where EventId = new.EventId)) 
    	then
    		raise exception 'В олимпиаде не было спорта, к которому относится данное событие';
    	end if;
    	return new;
    end;
    $$ LANGUAGE plpgsql;


create trigger createEventOlympiads 
	after delete or insert or update on EventOlympiads
	for each row 
	execute procedure createEventOlympiads();

--insert into EventOlympiads (EventId, OlympiadId) values
-- (1, 26); -- Все нормально

-- insert into EventOlympiads (EventId, OlympiadId) values
-- (98, 26); --ошибка

create or replace function createCompetitionPlacing() returns trigger as $$
	declare
		SportId_ int;
		EventTypeId_ int;
		Sex boolean;
    begin
    	select SportId into SportId_ from SportEvents where 
    		EventId = (select EventId from Competition where CompetitionId = new.CompetitionId);
    	select EventTypeId into EventTypeId_ from SportEvents where 
    		EventId = (select EventId from Competition where CompetitionId = new.CompetitionId);


    	if exists (select * from NationTeamMembers natural join 
    		(select AthleteId, NationTeamId from TeamMembers where TeamId = new.TeamId) as b
    		where SportId != SportId_)
    	then
    		raise exception 'Не все атлеты участвуют в виде спорта в команде';
    	end if;


		
    	if exists (select * from Athletes natural join (select AthleteId, NationTeamId from TeamMembers where TeamId = new.TeamId) as b 
    		where (AthleteSex = false and EventTypeId_ in (2, 4)) or (AthleteSex = true and EventTypeId_ in (1, 3)))
		then
    		raise exception 'Не все атлеты имеют подходящий пол для данного вида соревнования';
    	end if;

    	return new;
    end;
    $$ LANGUAGE plpgsql;


create trigger createCompetitionPlacing 
	after insert or update on CompetitionPlacing
	for each row 
	execute procedure createCompetitionPlacing();

-- insert into CompetitionPlacing (CompetitionId, TeamId, Place) values (11, 2, 1); --Ошибка участие в виде спорта
-- insert into CompetitionPlacing (CompetitionId, TeamId, Place) values (11, 11, 4); --Ошибка пол
-- insert into CompetitionPlacing (CompetitionId, TeamId, Place) values (11, 30, 1); --Все нормально


create or replace function createOlympicGames() returns trigger as $$
	begin
		if exists (select * from OlympicGames where 
			(new.OpeningDate BETWEEN OpeningDate and ClosingDate) and Type = new.Type or
			(new.ClosingDate BETWEEN OpeningDate and ClosingDate) and Type = new.Type)
		then
			raise exception 'Время проведения олимпийских игр не должно перекрываться';
		end if;
		return new;
	end;
	$$ LANGUAGE plpgsql;


create trigger createOlympicGames 
	before insert or update on OlympicGames
	for each row 
	execute procedure createOlympicGames();

-- insert into OlympicGames (OlympiadId, OlympiadNo, Type, Host, OpeningDate, ClosingDate) values (100, 50, false, 33, '1896-04-05', '1896-04-10');
-- insert into OlympicGames (OlympiadId, OlympiadNo, Type, Host, OpeningDate, ClosingDate) values (100, 50, false, 33, '1896-04-07', '1896-04-20');