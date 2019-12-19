--
-- Find the complete schedule for a team given university, sport, and year.
--

CREATE OR REPLACE FUNCTION public.schedule(
	university character varying,
	sport character varying,
	year integer)
    RETURNS TABLE(university character varying, opponent character varying, dat date, location character varying, attendance integer) 
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$

  select u1.university_name, u2.university_name, g1.date, g1.location, g1.attendance
	from game_info as g1
	join team as away_team on g1.away_team_id = away_team.team_id
	join university as u1 on away_team.university_id = u1.university_id
	join team as home_team on g1.home_team_id = home_team.team_id
	join university as u2 on home_team.university_id = u2.university_id
	join sport as s on s.sport_id = away_team.sport_id
	where u1.university_name = $1
		and s.sport_name = $2
		and away_team.year = $3
    UNION ALL
    select u2.university_name, u1.university_name, g1.date, g1.location, g1.attendance
	from game_info as g1
	join team as away_team on g1.away_team_id = away_team.team_id
	join university as u1 on away_team.university_id = u1.university_id
	join team as home_team on g1.home_team_id = home_team.team_id
	join university as u2 on home_team.university_id = u2.university_id
	join sport as s on s.sport_id = away_team.sport_id
	where u2.university_name = $1
		and s.sport_name = $2
		and away_team.year = $3
$BODY$;

ALTER FUNCTION public.schedule(character varying, character varying, integer)
    OWNER TO miners;
