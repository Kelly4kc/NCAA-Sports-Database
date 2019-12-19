-- 
-- List the players for a university sports team
-- given a university name and year.
--

CREATE OR REPLACE FUNCTION public.uni_players(
	uni_name character varying,
	year integer)
    RETURNS TABLE(player character varying, class character varying, sport character varying, university character varying) 
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$

  SELECT
    player.player_name,
	roster.class,
	sport.sport_name,
    university.university_name
	
  FROM university
  JOIN team ON team.university_id = university.university_id
  JOIN sport ON sport.sport_id = team.sport_id
  JOIN roster ON team.team_id = roster.team_id
  JOIN player ON player.player_id = roster.player_id
  WHERE university.university_name = $1
    AND team.year = $2 
  ORDER BY sport.sport_name

$BODY$;

ALTER FUNCTION public.uni_players(character varying, integer)
    OWNER TO miners;
