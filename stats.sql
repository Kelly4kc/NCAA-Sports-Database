ANALYZE VERBOSE conference;
SELECT count(*) AS conference_cnt FROM conference;

ANALYZE VERBOSE university;
SELECT count(*) AS university_cnt FROM university;

ANALYZE VERBOSE sport;
SELECT count(*) AS sport_cnt FROM sport;

ANALYZE VERBOSE university_sport;
SELECT count(*) AS university_sport_cnt FROM university_sport;

ANALYZE VERBOSE player;
SELECT count(*) AS player_cnt FROM player;

ANALYZE VERBOSE roster;
SELECT count(*) AS roster_cnt FROM roster;

ANALYZE VERBOSE game_info;
SELECT count(*) AS game_info_cnt FROM game_info;


ANALYZE VERBOSE game_team_scoring_m_baseball;
SELECT count(*) AS baseball_team_cnt FROM game_team_scoring_m_baseball;

ANALYZE VERBOSE game_team_scoring_m_basketball;
SELECT count(*) AS m_basketball_team_cnt FROM game_team_scoring_m_basketball;

ANALYZE VERBOSE game_team_scoring_m_soccer;
SELECT count(*) AS m_soccer_team_cnt FROM game_team_scoring_m_soccer;

ANALYZE VERBOSE game_team_scoring_w_basketball;
SELECT count(*) AS w_basketball_team_cnt FROM game_team_scoring_w_basketball;

ANALYZE VERBOSE game_team_scoring_w_field_hockey;
SELECT count(*) AS field_hockey_team_cnt FROM game_team_scoring_w_field_hockey;

ANALYZE VERBOSE game_team_scoring_w_lacrosse;
SELECT count(*) AS w_lacrosse_team_cnt FROM game_team_scoring_w_lacrosse;

ANALYZE VERBOSE game_team_scoring_w_softball;
SELECT count(*) AS softball_team_cnt FROM game_team_scoring_w_softball;

ANALYZE VERBOSE game_team_scoring_w_soccer;
SELECT count(*) AS w_soccer_team_cnt FROM game_team_scoring_w_soccer;

ANALYZE VERBOSE game_team_scoring_w_volleyball;
SELECT count(*) AS w_volleyball_team_cnt FROM game_team_scoring_w_volleyball;

ANALYZE VERBOSE game_stats_m_baseball;
SELECT count(*) AS baseball_player_cnt FROM game_stats_m_baseball;

ANALYZE VERBOSE game_stats_m_basketball;
SELECT count(*) AS basketball_player_cnt FROM game_stats_m_basketball;

ANALYZE VERBOSE game_stats_m_soccer;
SELECT count(*) AS m_soccer_player_cnt FROM game_stats_m_soccer;

ANALYZE VERBOSE game_stats_w_basketball;
SELECT count(*) AS w_basketball_player_cnt FROM game_stats_w_basketball;

ANALYZE VERBOSE game_stats_w_field_hockey;
SELECT count(*) AS field_hockey_player_cnt FROM game_stats_w_field_hockey;

ANALYZE VERBOSE game_stats_w_lacrosse;
SELECT count(*) AS w_lacrosse_player_cnt FROM game_stats_w_lacrosse;

ANALYZE VERBOSE game_stats_w_softball;
SELECT count(*) AS softball_player_cnt FROM game_stats_w_softball;

ANALYZE VERBOSE game_stats_w_soccer;
SELECT count(*) AS w_soccer_player_cnt FROM game_stats_w_soccer;

ANALYZE VERBOSE game_stats_w_volleyball;
SELECT count(*) AS w_volleyball_player_cnt FROM game_stats_w_volleyball;
