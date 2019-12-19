--
-- Obtain all of the universities participating in a conference
-- for a given year.
--

CREATE OR REPLACE FUNCTION public.uni_conference(
	conference character varying,
	year integer)
    RETURNS TABLE(university character varying) 
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$

  SELECT
    DISTINCT university.university_name
    
  FROM university
  JOIN team ON team.university_id = university.university_id
  JOIN conference ON team.conference_id = conference.conference_id
  WHERE conference.conference_name = $1
    AND team.year = $2

$BODY$;

ALTER FUNCTION public.uni_conference(character varying, integer)
    OWNER TO miners;
