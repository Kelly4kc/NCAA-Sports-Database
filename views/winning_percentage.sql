DROP MATERIALIZED VIEW IF EXISTS m_baseball_winning_pcts;

CREATE MATERIALIZED VIEW m_baseball_winning_pcts AS
    SELECT t.year, conference_name, university_name, ROUND(wins.win*1.0/(1.0*total.total), 2) AS percent
    FROM (SELECT t.team_id, t.year, t.conference_id, COUNT(*) AS win
          FROM game_team_scoring_m_baseball AS m
            JOIN game_team_scoring_m_baseball AS b ON m.game_id = b.game_id
            JOIN team AS t ON t.team_id = m.team_id
            JOIN team AS s ON s.team_id = b.team_id
          WHERE m.team_id != b.team_id AND m.score > b.score
          GROUP BY t.team_id, t.year, t.conference_id) AS wins
      JOIN (SELECT t.team_id, t.year, COUNT(*) AS total
            FROM game_team_scoring_m_baseball AS m
              JOIN game_team_scoring_m_baseball AS b ON m.game_id = b.game_id
              JOIN team AS t ON t.team_id = m.team_id
              JOIN team AS s ON s.team_id = b.team_id
            WHERE m.team_id != b.team_id
            GROUP BY t.team_id, t.year) AS total ON total.team_id = wins.team_id
      JOIN conference AS c ON wins.conference_id = c.conference_id
      JOIN team AS t ON wins.team_id = t.team_id
      JOIN university AS u ON t.university_id = u.university_id
    WHERE total.team_id = wins.team_id
    ORDER BY conference_name, university_name, year, percent DESC;

ALTER MATERIALIZED VIEW m_baseball_winning_pcts OWNER TO miners;

COMMENT ON MATERIALIZED VIEW m_baseball_winning_pcts IS 'NCAA baseball winning percentages';

DROP MATERIALIZED VIEW IF EXISTS m_basketball_winning_pcts;

CREATE MATERIALIZED VIEW m_basketball_winning_pcts AS
    SELECT t.year, conference_name, university_name, ROUND(wins.win*1.0/(1.0*total.total), 2) AS percent
    FROM (SELECT t.team_id, t.year, t.conference_id, COUNT(*) AS win
          FROM game_team_scoring_m_basketball AS m
            JOIN game_team_scoring_m_basketball AS b ON m.game_id = b.game_id
            JOIN team AS t ON t.team_id = m.team_id
            JOIN team AS s ON s.team_id = b.team_id
          WHERE m.team_id != b.team_id AND m.score > b.score
          GROUP BY t.team_id, t.year, t.conference_id) AS wins
      JOIN (SELECT t.team_id, t.year, COUNT(*) AS total
            FROM game_team_scoring_m_basketball AS m
              JOIN game_team_scoring_m_basketball AS b ON m.game_id = b.game_id
              JOIN team AS t ON t.team_id = m.team_id
              JOIN team AS s ON s.team_id = b.team_id
            WHERE m.team_id != b.team_id
            GROUP BY t.team_id, t.year) AS total ON total.team_id = wins.team_id
      JOIN conference AS c ON wins.conference_id = c.conference_id
      JOIN team AS t ON wins.team_id = t.team_id
      JOIN university AS u ON t.university_id = u.university_id
    WHERE total.team_id = wins.team_id
    ORDER BY conference_name, university_name, year, percent DESC;

ALTER MATERIALIZED VIEW m_basketball_winning_pcts OWNER TO miners;

COMMENT ON MATERIALIZED VIEW m_basketball_winning_pcts IS 'NCAA men''s basketball winning percentages';

DROP MATERIALIZED VIEW IF EXISTS m_soccer_winning_pcts;

CREATE MATERIALIZED VIEW m_soccer_winning_pcts AS
    SELECT t.year, conference_name, university_name, ROUND(wins.win*1.0/(1.0*total.total), 2) AS percent
    FROM (SELECT t.team_id, t.year, t.conference_id, COUNT(*) AS win
          FROM game_team_scoring_m_soccer AS m
            JOIN game_team_scoring_m_soccer AS b ON m.game_id = b.game_id
            JOIN team AS t ON t.team_id = m.team_id
            JOIN team AS s ON s.team_id = b.team_id
          WHERE m.team_id != b.team_id AND m.score > b.score
          GROUP BY t.team_id, t.year, t.conference_id) AS wins
      JOIN (SELECT t.team_id, t.year, COUNT(*) AS total
            FROM game_team_scoring_m_soccer AS m
              JOIN game_team_scoring_m_soccer AS b ON m.game_id = b.game_id
              JOIN team AS t ON t.team_id = m.team_id
              JOIN team AS s ON s.team_id = b.team_id
            WHERE m.team_id != b.team_id
            GROUP BY t.team_id, t.year) AS total ON total.team_id = wins.team_id
      JOIN conference AS c ON wins.conference_id = c.conference_id
      JOIN team AS t ON wins.team_id = t.team_id
      JOIN university AS u ON t.university_id = u.university_id
    WHERE total.team_id = wins.team_id
    ORDER BY conference_name, university_name, year, percent DESC;

ALTER MATERIALIZED VIEW m_soccer_winning_pcts OWNER TO miners;

COMMENT ON MATERIALIZED VIEW m_soccer_winning_pcts IS 'NCAA men''s soccer winning percentages';

DROP MATERIALIZED VIEW IF EXISTS w_basketball_winning_pcts;

CREATE MATERIALIZED VIEW w_basketball_winning_pcts AS
    SELECT t.year, conference_name, university_name, ROUND(wins.win*1.0/(1.0*total.total), 2) AS percent
    FROM (SELECT t.team_id, t.year, t.conference_id, COUNT(*) AS win
          FROM game_team_scoring_w_basketball AS m
            JOIN game_team_scoring_w_basketball AS b ON m.game_id = b.game_id
            JOIN team AS t ON t.team_id = m.team_id
            JOIN team AS s ON s.team_id = b.team_id
          WHERE m.team_id != b.team_id AND m.score > b.score
          GROUP BY t.team_id, t.year, t.conference_id) AS wins
      JOIN (SELECT t.team_id, t.year, COUNT(*) AS total
            FROM game_team_scoring_w_basketball AS m
              JOIN game_team_scoring_w_basketball AS b ON m.game_id = b.game_id
              JOIN team AS t ON t.team_id = m.team_id
              JOIN team AS s ON s.team_id = b.team_id
            WHERE m.team_id != b.team_id
            GROUP BY t.team_id, t.year) AS total ON total.team_id = wins.team_id
      JOIN conference AS c ON wins.conference_id = c.conference_id
      JOIN team AS t ON wins.team_id = t.team_id
      JOIN university AS u ON t.university_id = u.university_id
    WHERE total.team_id = wins.team_id
    ORDER BY conference_name, university_name, year, percent DESC;

ALTER MATERIALIZED VIEW w_basketball_winning_pcts OWNER TO miners;

COMMENT ON MATERIALIZED VIEW w_basketball_winning_pcts IS 'NCAA women''s basketball winning percentages';

DROP MATERIALIZED VIEW IF EXISTS w_field_hockey_winning_pcts;

CREATE MATERIALIZED VIEW w_field_hockey_winning_pcts AS
    SELECT t.year, conference_name, university_name, ROUND(wins.win*1.0/(1.0*total.total), 2) AS percent
    FROM (SELECT t.team_id, t.year, t.conference_id, COUNT(*) AS win
          FROM game_team_scoring_w_field_hockey AS m
            JOIN game_team_scoring_w_field_hockey AS b ON m.game_id = b.game_id
            JOIN team AS t ON t.team_id = m.team_id
            JOIN team AS s ON s.team_id = b.team_id
          WHERE m.team_id != b.team_id AND m.score > b.score
          GROUP BY t.team_id, t.year, t.conference_id) AS wins
      JOIN (SELECT t.team_id, t.year, COUNT(*) AS total
            FROM game_team_scoring_w_field_hockey AS m
              JOIN game_team_scoring_w_field_hockey AS b ON m.game_id = b.game_id
              JOIN team AS t ON t.team_id = m.team_id
              JOIN team AS s ON s.team_id = b.team_id
            WHERE m.team_id != b.team_id
            GROUP BY t.team_id, t.year) AS total ON total.team_id = wins.team_id
      JOIN conference AS c ON wins.conference_id = c.conference_id
      JOIN team AS t ON wins.team_id = t.team_id
      JOIN university AS u ON t.university_id = u.university_id
    WHERE total.team_id = wins.team_id
    ORDER BY conference_name, university_name, year, percent DESC;

ALTER MATERIALIZED VIEW w_field_hockey_winning_pcts OWNER TO miners;

COMMENT ON MATERIALIZED VIEW w_field_hockey_winning_pcts IS 'NCAA field hockey winning percentages';

DROP MATERIALIZED VIEW IF EXISTS w_lacrosse_winning_pcts;

CREATE MATERIALIZED VIEW w_lacrosse_winning_pcts AS
    SELECT t.year, conference_name, university_name, ROUND(wins.win*1.0/(1.0*total.total), 2) AS percent
    FROM (SELECT t.team_id, t.year, t.conference_id, COUNT(*) AS win
          FROM game_team_scoring_w_lacrosse AS m
            JOIN game_team_scoring_w_lacrosse AS b ON m.game_id = b.game_id
            JOIN team AS t ON t.team_id = m.team_id
            JOIN team AS s ON s.team_id = b.team_id
          WHERE m.team_id != b.team_id AND m.score > b.score
          GROUP BY t.team_id, t.year, t.conference_id) AS wins
      JOIN (SELECT t.team_id, t.year, COUNT(*) AS total
            FROM game_team_scoring_w_lacrosse AS m
              JOIN game_team_scoring_w_lacrosse AS b ON m.game_id = b.game_id
              JOIN team AS t ON t.team_id = m.team_id
              JOIN team AS s ON s.team_id = b.team_id
            WHERE m.team_id != b.team_id
            GROUP BY t.team_id, t.year) AS total ON total.team_id = wins.team_id
      JOIN conference AS c ON wins.conference_id = c.conference_id
      JOIN team AS t ON wins.team_id = t.team_id
      JOIN university AS u ON t.university_id = u.university_id
    WHERE total.team_id = wins.team_id
    ORDER BY conference_name, university_name, year, percent DESC;

ALTER MATERIALIZED VIEW w_lacrosse_winning_pcts OWNER TO miners;

COMMENT ON MATERIALIZED VIEW w_lacrosse_winning_pcts IS 'NCAA women''s lacrosse winning percentages';

DROP MATERIALIZED VIEW IF EXISTS w_softball_winning_pcts;

CREATE MATERIALIZED VIEW w_softball_winning_pcts AS
    SELECT t.year, conference_name, university_name, ROUND(wins.win*1.0/(1.0*total.total), 2) AS percent
    FROM (SELECT t.team_id, t.year, t.conference_id, COUNT(*) AS win
          FROM game_team_scoring_w_softball AS m
            JOIN game_team_scoring_w_softball AS b ON m.game_id = b.game_id
            JOIN team AS t ON t.team_id = m.team_id
            JOIN team AS s ON s.team_id = b.team_id
          WHERE m.team_id != b.team_id AND m.score > b.score
          GROUP BY t.team_id, t.year, t.conference_id) AS wins
      JOIN (SELECT t.team_id, t.year, COUNT(*) AS total
            FROM game_team_scoring_w_softball AS m
              JOIN game_team_scoring_w_softball AS b ON m.game_id = b.game_id
              JOIN team AS t ON t.team_id = m.team_id
              JOIN team AS s ON s.team_id = b.team_id
            WHERE m.team_id != b.team_id
            GROUP BY t.team_id, t.year) AS total ON total.team_id = wins.team_id
      JOIN conference AS c ON wins.conference_id = c.conference_id
      JOIN team AS t ON wins.team_id = t.team_id
      JOIN university AS u ON t.university_id = u.university_id
    WHERE total.team_id = wins.team_id
    ORDER BY conference_name, university_name, year, percent DESC;

ALTER MATERIALIZED VIEW w_softball_winning_pcts OWNER TO miners;

COMMENT ON MATERIALIZED VIEW w_softball_winning_pcts IS 'NCAA softball winning percentages';

DROP MATERIALIZED VIEW IF EXISTS w_soccer_winning_pcts;

CREATE MATERIALIZED VIEW w_soccer_winning_pcts AS
    SELECT t.year, conference_name, university_name, ROUND(wins.win*1.0/(1.0*total.total), 2) AS percent
    FROM (SELECT t.team_id, t.year, t.conference_id, COUNT(*) AS win
          FROM game_team_scoring_w_soccer AS m
            JOIN game_team_scoring_w_soccer AS b ON m.game_id = b.game_id
            JOIN team AS t ON t.team_id = m.team_id
            JOIN team AS s ON s.team_id = b.team_id
          WHERE m.team_id != b.team_id AND m.score > b.score
          GROUP BY t.team_id, t.year, t.conference_id) AS wins
      JOIN (SELECT t.team_id, t.year, COUNT(*) AS total
            FROM game_team_scoring_w_soccer AS m
              JOIN game_team_scoring_w_soccer AS b ON m.game_id = b.game_id
              JOIN team AS t ON t.team_id = m.team_id
              JOIN team AS s ON s.team_id = b.team_id
            WHERE m.team_id != b.team_id
            GROUP BY t.team_id, t.year) AS total ON total.team_id = wins.team_id
      JOIN conference AS c ON wins.conference_id = c.conference_id
      JOIN team AS t ON wins.team_id = t.team_id
      JOIN university AS u ON t.university_id = u.university_id
    WHERE total.team_id = wins.team_id
    ORDER BY conference_name, university_name, year, percent DESC;

ALTER MATERIALIZED VIEW w_soccer_winning_pcts OWNER TO miners;

COMMENT ON MATERIALIZED VIEW w_soccer_winning_pcts IS 'NCAA women''s soccer winning percentages';

DROP MATERIALIZED VIEW IF EXISTS w_volleyball_winning_pcts;

CREATE MATERIALIZED VIEW w_volleyball_winning_pcts AS
    SELECT t.year, conference_name, university_name, ROUND(wins.win*1.0/(1.0*total.total), 2) AS percent
    FROM (SELECT t.team_id, t.year, t.conference_id, COUNT(*) AS win
          FROM game_team_scoring_w_volleyball AS m
            JOIN game_team_scoring_w_volleyball AS b ON m.game_id = b.game_id
            JOIN team AS t ON t.team_id = m.team_id
            JOIN team AS s ON s.team_id = b.team_id
          WHERE m.team_id != b.team_id AND m.score > b.score
          GROUP BY t.team_id, t.year, t.conference_id) AS wins
      JOIN (SELECT t.team_id, t.year, COUNT(*) AS total
            FROM game_team_scoring_w_volleyball AS m
              JOIN game_team_scoring_w_volleyball AS b ON m.game_id = b.game_id
              JOIN team AS t ON t.team_id = m.team_id
              JOIN team AS s ON s.team_id = b.team_id
            WHERE m.team_id != b.team_id
            GROUP BY t.team_id, t.year) AS total ON total.team_id = wins.team_id
      JOIN conference AS c ON wins.conference_id = c.conference_id
      JOIN team AS t ON wins.team_id = t.team_id
      JOIN university AS u ON t.university_id = u.university_id
    WHERE total.team_id = wins.team_id
    ORDER BY conference_name, university_name, year, percent DESC;

ALTER MATERIALIZED VIEW w_volleyball_winning_pcts OWNER TO miners;

COMMENT ON MATERIALIZED VIEW w_volleyball_winning_pcts IS 'NCAA women''s volleyball winning percentages';