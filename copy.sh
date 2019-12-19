#!/bin/sh

user="kelly4kc"

command="psql -U $user -c"
database_info="-h data.cs.jmu.edu -d miners"
directory="/cs/home/stu/kelly4kc/CS474/miners_data"

$command "\copy conference                       from '$directory/all_conferences.csv'                 delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy university                       from '$directory/all_universities.csv'                delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy sport                            from '$directory/all_sports.csv'                      delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy team                             from '$directory/all_teams.csv'                       delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy player                           from '$directory/all_players.csv'                     delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy roster                           from '$directory/all_rosters.csv'                     delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_info                        from '$directory/all_game_infos.csv'                  delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_team_scoring_m_baseball     from '$directory/all_m_baseball_game_periods.csv'     delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_team_scoring_m_basketball   from '$directory/all_m_basketball_game_periods.csv'   delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_team_scoring_m_soccer       from '$directory/all_m_soccer_game_periods.csv'       delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_team_scoring_w_basketball   from '$directory/all_w_basketball_game_periods.csv'   delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_team_scoring_w_field_hockey from '$directory/all_w_field_hockey_game_periods.csv' delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_team_scoring_w_lacrosse     from '$directory/all_w_lacrosse_game_periods.csv'     delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_team_scoring_w_softball     from '$directory/all_w_softball_game_periods.csv'     delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_team_scoring_w_soccer       from '$directory/all_w_soccer_game_periods.csv'       delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_team_scoring_w_volleyball   from '$directory/all_w_volleyball_game_periods.csv'   delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_stats_m_baseball            from '$directory/all_m_baseball_games.csv'            delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_stats_m_basketball          from '$directory/all_m_basketball_games.csv'          delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_stats_m_soccer              from '$directory/all_m_soccer_games.csv'              delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_stats_w_basketball          from '$directory/all_w_basketball_games.csv'          delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_stats_w_soccer              from '$directory/all_w_soccer_games.csv'              delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_stats_w_field_hockey        from '$directory/all_w_field_hockey_games.csv'        delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_stats_w_lacrosse            from '$directory/all_w_lacrosse_games.csv'            delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_stats_w_volleyball          from '$directory/all_w_volleyball_games.csv'          delimiter ',' NULL AS '' CSV HEADER" $database_info;

$command "\copy game_stats_w_softball            from '$directory/all_w_softball_games.csv'            delimiter ',' NULL AS '' CSV HEADER" $database_info;

