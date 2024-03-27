create table teams(
	id serial primary key,
	name varchar(255) not null,
	stadium varchar(255),
	division varchar(255),
	conference varchar(255),
	head_coach varchar(255),
	active boolean
);

create table players(
	id serial primary key,
	name varchar(255) not null,
	position varchar(255),
	salary integer,
	team_id integer references teams
);

-- 1. List the names of all NFL teams'
select name from teams;


-- 2. List the stadium name and head coach of all NFC teams
select stadium, head_coach from teams;


-- 3. List the head coaches of the AFC South
select head_coach from teams where division = 'South' and conference = 'AFC';

-- 4. The total number of players in the NFL
select count(*) from players;


-- 5. The team names and head coaches of the NFC North and AFC East
select name, head_coach from teams where (division = 'East' and conference = 'AFC') or (division = 'North' and conference = 'NFC');


-- 6. The 50 players with the highest salaries
select * from players order by salary desc limit 50;


-- 7. The average salary of all NFL players
select avg(salary) from players;


-- 8. The names and positions of players with a salary above 10_000_000
select name, position from players where salary > 10000000;


-- 9. The player with the highest salary in the NFL
select * from players where salary = (select max(salary) from players);


-- 10. The name and position of the first 100 players with the lowest salaries
select name, position from players order by salary limit 100;


-- 11. The average salary for a DE in the nfl
select avg(salary) from players where position = 'DE';

