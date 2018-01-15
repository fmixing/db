DROP SCHEMA public CASCADE;
CREATE SCHEMA public;


----------Организация

create table Nations (
	NationId int primary key,
	NationName varchar(50) not null
);

create table OlympicGames (
	OlympiadId int primary key,
	OlympiadNo int not null, --номер олимпиады
	Type boolean not null, --Winter 1, Summer 0
	Host int references Nations(NationId), --страна, которая принимала олимпийские игры
	OpeningDate date not null,
	ClosingDate date not null,
	unique (OlympiadNo, Type), --Олимпиада одного типа имеет уникальный номер
	constraint positiveOlympiadNoCheck check (OlympiadNo > 0),
	constraint dateCheck check (OpeningDate <= ClosingDate)
);

--Дисциплины
create table OlympicSports (
	SportId int primary key,
	SportName varchar(50) not null
);

--Для каждой олимпиады для каждой нации своя команда
create table NationTeams (
	NationTeamId int primary key,
	NationId int references Nations(NationId),
	OlympiadId int references OlympicGames(OlympiadId),
	unique (NationId, OlympiadId)
);


--В общем случае в сборной может быть несколько человек с одим именем, 
--так что при запросах по имени будет выводиться информация по имени и id
create table Athletes (
	AthleteId int not null,
	NationTeamId int references NationTeams(NationTeamId), --в рамках олимпиады у человека имя не меняется,
	AthleteName varchar(50) not null,                      --не интересует, что происходит между олимпиадами
	AthleteSex boolean not null, --false - Men
	primary key (AthleteId, NationTeamId)
);


create table NationTeamMembers (
	NationTeamId int references NationTeams(NationTeamId),
	AthleteId int not null, --не уникальный, так как спортсмен может участовать в нескольких видах спорта (в теории)
	SportId int references OlympicSports(SportId),
	primary key (NationTeamId, AthleteId, SportId)
);
alter table NationTeamMembers 
add constraint fk1 foreign key (AthleteId, NationTeamId) references Athletes(AthleteId, NationTeamId);


------------Типы соревнований

--Олимпиады, на которых был определенный вид спорта
create table SportOlympiads (
	SportId int references OlympicSports(SportId),
	OlympiadId int references OlympicGames(OlympiadId),
	primary key (SportId, OlympiadId)
);


create table EventType (
	EventTypeId int primary key,
	Type varchar(4) not null -- "MIX" - смешанный, "M" - мужской, "W" - женский, "TW/TM/TMIX" - командный
);


--у некоторого спорта нет ивентов, в таком случае будет продублировано в этой таблице название спорта. Сделано для удобства
create table SportEvents (
	SportId int references OlympicSports(SportId),
	EventId int primary key,
	EventName varchar(50) not null,
	EventTypeId int references EventType(EventTypeId),
	unique (EventName, EventTypeId)
);


--Олимпиады, на которых был определенный вид спорта
create table EventOlympiads (
	EventId int references SportEvents(EventId),
	OlympiadId int references OlympicGames(OlympiadId),
	primary key (EventId, OlympiadId)
);


-----------Конкретные соревнования в определенных играх

create table Teams (
	TeamId int primary key,
	NationTeamId int references NationTeams(NationTeamId)
);


--команда из одного человека будет считаться индивидуальным зачетом
create table TeamMembers (
	TeamId int references Teams(TeamId),
	AthleteId int not null,
	NationTeamId int not null,
	primary key (TeamId, AthleteId, NationTeamId)
);
alter table TeamMembers 
add constraint fk2 foreign key (AthleteId, NationTeamId) references Athletes(AthleteId, NationTeamId);


create table Competition (
	EndingDate date not null,
	CompetitionId int primary key,
	OlympiadId int references OlympicGames(OlympiadId),
	EventId int references SportEvents(EventId),
	unique (OlympiadId, EventId)
);


create table CompetitionPlacing (
	CompetitionId int references Competition(CompetitionId),
	TeamId int references Teams(TeamId), -- команда
	Place int not null,
	constraint positivePlaceCheck check (Place > 0),
	primary key (CompetitionId, TeamId)
);

--Индексы на основные ключи уже существуют (https://www.postgresql.org/docs/current/static/indexes-unique.html)

--Часто хотим узнавать id олимпиады по ее номеру
create index olympicGamesNo on OlympicGames (OlympiadNo);

--Часто интересуют нации, дисциплины и имена спортсменов по реальным названиям
create index nationsNames on Nations (NationName);
create index athletesNames on Athletes (AthleteName);
create index eventsNames ON SportEvents (EventName);

--Для поиска событий по дню будет удобен индекс
create index competitionsDates ON Competition (EndingDate);





