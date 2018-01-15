-----------------Запросы

--Информация по олимпиаде: по олимпиаде - страны-участницы и количество медалей

CREATE VIEW OlympiadInfo AS
select OlympiadNo, Type, NationName, b2.medals from OlympicGames 
	natural join NationTeams 
	natural join 
	(select NationName, NationTeamId, sum(b1.allMedals) as medals from Nations natural join
		(select NationId, b.allMedals, NationTeamId from NationTeams natural join
			(select NationTeamId, count(*) as allMedals from Teams where TeamId in 
				(select TeamId from CompetitionPlacing where Place in (1, 2, 3))
			group by NationTeamId) as b) as b1
		group by NationTeamId, NationName) as b2;

select * from OlympiadInfo;

--По олимпиадам лучшая команда в них

select * from OlympiadInfo order by olympiadno, medals desc limit 1;

--Число медалей по странам за историю игр

select NationName, sum(b1.allMedals) from Nations natural join
	(select NationId, b.allMedals from NationTeams natural join
		(select NationTeamId, count(*) as allMedals from Teams where TeamId in 
			(select TeamId from CompetitionPlacing where Place in (1, 2, 3))
		group by NationTeamId) as b) as b1
	group by NationName;

--Количество золотых медалей по стране

select count(*) from CompetitionPlacing where 
	TeamId in 
		(select TeamId from Teams where 
			NationTeamId in 
				(select NationTeamId from NationTeams where 
					NationId = (select NationId from Nations where NationName = 'Russia')))
	and Place = 1;

--Получение по стране, типу и номеру олимпийских игр число золотых медалей: NationName, Type, Num

select count(*) from CompetitionPlacing where 
	TeamId in 
		(select TeamId from Teams where 
			NationTeamId = 
				(select NationTeamId from NationTeams where 
					NationId = (select NationId from Nations where NationName = 'Russia') and 
					OlympiadId = (select OlympiadId from OlympicGames where OlympiadNo = 29 and Type = false)))
	and Place = 1;

--Все олимпийские игры, проходящие в стране

select * from OlympicGames where Host = (select NationId from Nations where NationName = 'United States');

--По странам количество проходящих в них игр

select NationName, count(*) as TotalGamesCount from OlympicGames 
	natural join Nations 
		where Host = NationId
	group by NationName
	order by TotalGamesCount desc;

--Какие места занимал спортсмен с первой даты по вторую: StartDate, EndDate, Name

select AthleteId, 'Valeriy Borchin' as AthleteName, Place, EndingDate, EventName from SportEvents natural join
	(select AthleteId, Place, EndingDate, EventId from Competition 
		natural join CompetitionPlacing 
		natural join TeamMembers where 
			AthleteId in (select AthleteId from Athletes where 
				AthleteName = 'Valeriy Borchin')
			and
			NationTeamId in (select NationTeamId from NationTeams where 
				OlympiadId in (select OlympiadId from OlympicGames where 
					OpeningDate >= '2008-08-07' and
					OpeningDate <= '2008-08-22'))
			and EndingDate >= '2008-08-07' and EndingDate <= '2008-08-22') as b;


-- Получить по имени спортсмена его медали (т.е. 1 2 3 места)

select AthleteId, 'Valeriy Borchin' as AthleteName, Place, EndingDate, EventName from SportEvents natural join
	(select AthleteId, Place, EndingDate, EventId from Competition 
		natural join CompetitionPlacing 
		natural join TeamMembers where 
		AthleteId in
			(select AthleteId from Athletes where 
				AthleteName = 'Valeriy Borchin')
		and Place in (1, 2, 3)) as b; 

-- Информация по событию на олимпиаде: Num, EventName, Type = {M, W, TM, TW, TMIX, MIX}

select NationName, Place, EndingDate from Nations natural join
	(select Place, EndingDate, NationId from NationTeams natural join
		(select Place, EndingDate, NationTeamId from Teams natural join
			(select TeamId, Place, EndingDate from CompetitionPlacing natural join
				Competition where
					EventId in (select EventId from SportEvents where 
						EventName = '20 km walk'
						and EventTypeId = (select EventTypeId from EventType where Type = 'M'))
					and
					OlympiadId in (select OlympiadId from OlympicGames where OlympiadNo = 29)
					order by (CompetitionId, Place)) as b) as b2) as b1;

-- На каких играх страна выступила впервые

select * from OlympicGames where OlympiadId in
	(select OlympiadId from NationTeams where 
			NationId = (select NationId from Nations where NationName = 'Russia'))
	order by OpeningDate
	limit 1;

-- Все события в определенынй день

select EventName from SportEvents where EventId in 
	(select EventId from Competition where EndingDate = '2008-08-24');



create table UpdateResults (
	CompetitionId int not null,
	NationName varchar(50) not null,
	AthleteName varchar(50) not null, --Unique
	Result int not null
);


insert into UpdateResults values 
	(1, 'Russia', 'Denis Nizhegorodov', 1),
	(1, 'Russia', 'Valeriy Borchin', 2), 
	(1, 'United States', 'LaShawn Merritt', 4), 
	(1, 'China', 'Wang Hao', 4);


--Updating func

create or replace function UpdateResultsProcedure(CompetitionId_ int, NationName_ varchar(50), AthleteName_ varchar(50), Result int) 
	returns void as $$
	declare
		OlympiadId_ int;
		TeamId_ int;
		MaxVal int;
		NationTeamId_ int;
		AthleteId_ int;
	begin 	
		select NationTeamId into NationTeamId_ from NationTeams where 
				OlympiadId = (select OlympiadId from Competition where CompetitionId = CompetitionId_) and 
				NationId = (select NationId from Nations where NationName = NationName_);
		select AthleteId into AthleteId_ from Athletes where NationTeamId = NationTeamId_ and AthleteName = AthleteName_;

		select TeamId into TeamId_ from TeamMembers where TeamId in 
			(select TeamId from CompetitionPlacing where CompetitionId = CompetitionId_) and
			AthleteId = AthleteId_;


		if exists (select * from TeamMembers where TeamId in 
			(select TeamId from CompetitionPlacing where CompetitionId = CompetitionId_) and
			AthleteId = AthleteId_)
		then
			update CompetitionPlacing set Place = Result where TeamId = TeamId_;
		else
			select max(TeamId) into MaxVal from Teams;

			insert into Teams values ((MaxVal + 1), NationTeamId_);
			insert into TeamMembers values (MaxVal, 
				(select AthleteId from Athletes where NationTeamId = NationTeamId_ and AthleteName = AthleteName_), NationTeamId_);

			insert into CompetitionPlacing (CompetitionId, TeamId, Place) values (CompetitionId_, (MaxVal + 1), Result);
		end if;

	end;
	$$ LANGUAGE plpgsql;

