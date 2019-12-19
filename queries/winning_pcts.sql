--
-- Find the winning percentages of all teams for a particular sport
--

CREATE OR REPLACE FUNCTION public.all_m_baseball_winning_pcts(
    university character varying,
    year integer)
    RETURNS TABLE(university character varying, year int4, percent numeric)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT university_name, year, percent
    FROM m_baseball_winning_pcts
    WHERE university_name = $1
        AND year = $2
$BODY$;

ALTER FUNCTION public.all_m_baseball_winning_pcts(character varying, int4)
    OWNER TO miners;
    
CREATE OR REPLACE FUNCTION public.all_m_basketball_winning_pcts(
    university character varying,
    year integer)
    RETURNS TABLE(university character varying, year int4, percent numeric)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT university_name, year, percent
    FROM m_basketball_winning_pcts
    WHERE university_name = $1
        AND year = $2
$BODY$;

ALTER FUNCTION public.all_m_basketball_winning_pcts(character varying, int4)
    OWNER TO miners;
    
CREATE OR REPLACE FUNCTION public.all_m_soccer_winning_pcts(
    university character varying,
    year integer)
    RETURNS TABLE(university character varying, year int4, percent numeric)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT university_name, year, percent
    FROM m_soccer_winning_pcts
    WHERE university_name = $1
        AND year = $2
$BODY$;

ALTER FUNCTION public.all_m_soccer_winning_pcts(character varying, int4)
    OWNER TO miners;
    
CREATE OR REPLACE FUNCTION public.all_w_basketball_winning_pcts(
    university character varying,
    year integer)
    RETURNS TABLE(university character varying, year int4, percent numeric)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT university_name, year, percent
    FROM w_basketball_winning_pcts
    WHERE university_name = $1
        AND year = $2
$BODY$;

ALTER FUNCTION public.all_w_basketball_winning_pcts(character varying, int4)
    OWNER TO miners;
    
CREATE OR REPLACE FUNCTION public.all_w_field_hockey_winning_pcts(
    university character varying,
    year integer)
    RETURNS TABLE(university character varying, year int4, percent numeric)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT university_name, year, percent
    FROM w_field_hockey_winning_pcts
    WHERE university_name = $1
        AND year = $2
$BODY$;

ALTER FUNCTION public.all_w_field_hockey_winning_pcts(character varying, int4)
    OWNER TO miners;
    
CREATE OR REPLACE FUNCTION public.all_w_lacrosse_winning_pcts(
    university character varying,
    year integer)
    RETURNS TABLE(university character varying, year int4, percent numeric)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT university_name, year, percent
    FROM w_lacrosse_winning_pcts
    WHERE university_name = $1
        AND year = $2
$BODY$;

ALTER FUNCTION public.all_w_lacrosse_winning_pcts(character varying, int4)
    OWNER TO miners;    

CREATE OR REPLACE FUNCTION public.all_w_softball_winning_pcts(
    university character varying,
    year integer)
    RETURNS TABLE(university character varying, year int4, percent numeric)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT university_name, year, percent
    FROM w_softball_winning_pcts
    WHERE university_name = $1
        AND year = $2
$BODY$;

ALTER FUNCTION public.all_w_softball_winning_pcts(character varying, int4)
    OWNER TO miners;
    
CREATE OR REPLACE FUNCTION public.all_w_soccer_winning_pcts(
    university character varying,
    year integer)
    RETURNS TABLE(university character varying, year int4, percent numeric)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT university_name, year, percent
    FROM w_soccer_winning_pcts
    WHERE university_name = $1
        AND year = $2
$BODY$;

ALTER FUNCTION public.all_w_soccer_winning_pcts(character varying, int4)
    OWNER TO miners;
    
CREATE OR REPLACE FUNCTION public.all_w_volleyball_winning_pcts(
    university character varying,
    year integer)
    RETURNS TABLE(university character varying, year int4, percent numeric)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT university_name, year, percent
    FROM w_volleyball_winning_pcts
    WHERE university_name = $1
        AND year = $2
$BODY$;

ALTER FUNCTION public.all_w_volleyball_winning_pcts(character varying, int4)
    OWNER TO miners;