--
-- Find the total attendance for each sport of a university, given university name
-- and year.
--

DROP FUNCTION IF EXISTS uni_sport_attendance(uni_name varchar, year int);

CREATE FUNCTION uni_sport_attendance(uni_name varchar, year int)
RETURNS TABLE(university varchar, sport text, attendance bigint) AS $$
  SELECT
    university.university_name,
    sport.sport_name,
    SUM(game_info.attendance) AS attendance
  FROM university
  JOIN team ON team.university_id = university.university_id
  JOIN sport ON sport.sport_id = team.sport_id
  JOIN game_info ON game_info.home_team_id = team.team_id
  WHERE university.university_name = $1
    AND team.year = $2
  GROUP BY university.university_name,
    sport.sport_name
  ORDER BY attendance DESC;

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION uni_sport_attendance(uni_name varchar, year int) OWNER TO miners;
