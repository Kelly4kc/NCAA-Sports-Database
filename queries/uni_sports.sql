-- 
-- Lists all sports a university offers for the given year.
--

CREATE OR REPLACE FUNCTION public.uni_sports(
	uni_name character varying,
	year integer)
    RETURNS TABLE(name character varying, sport character varying) 
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$

  SELECT
    DISTINCT university.university_name,
    sport.sport_name
  FROM university
  JOIN team ON team.university_id = university.university_id
  JOIN sport ON sport.sport_id = team.sport_id
  WHERE university.university_name = $1
    AND team.year = $2

$BODY$;

ALTER FUNCTION public.uni_sports(character varying, integer)
    OWNER TO miners;
