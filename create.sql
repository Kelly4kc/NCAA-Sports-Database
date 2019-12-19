DROP TABLE IF EXISTS conference;

CREATE TABLE conference
(
    conference_id integer NOT NULL,
    conference_name character varying NOT NULL
);

ALTER TABLE conference OWNER TO miners;

COMMENT ON TABLE conference IS 'all conferences in the NCAA';

DROP TABLE IF EXISTS university;

CREATE TABLE university
(
  university_id integer NOT NULL,
  university_name character varying NOT NULL,
  city character varying NOT NULL,
  state character varying NOT NULL
);

ALTER TABLE university OWNER TO miners;

COMMENT ON TABLE university IS 'all universities in the NCAA';

DROP TABLE IF EXISTS sport;

CREATE TABLE sport
(
  sport_id integer NOT NULL,
  sport_code varchar(3) NOT NULL,
  sport_name character varying NOT NULL
);

ALTER TABLE sport OWNER TO miners;

COMMENT ON TABLE sport IS 'all sports on the ncaa stats website';

DROP TABLE IF EXISTS team;

CREATE TABLE team
(
  team_id integer NOT NULL,
  year integer NOT NULL,
  sport_id integer NOT NULL,
  division integer NOT NULL,
  conference_id integer NOT NULL,
  university_id integer NOT NULL
);

ALTER TABLE team OWNER TO miners;

COMMENT ON TABLE team IS 'all teams in the NCAA from 2012';

DROP TABLE IF EXISTS player;

CREATE TABLE player
(
  player_id integer NOT NULL,
  player_name character varying NOT NULL
);

ALTER TABLE player OWNER TO miners;

COMMENT ON TABLE player IS 'all players in all NCAA teams';

DROP TABLE IF EXISTS roster;

CREATE TABLE roster
(
    player_id integer NOT NULL,
    team_id integer NOT NULL,
    jersey_num integer NOT NULL,
    class character varying NOT NULL,
    position character varying NULL
);

ALTER TABLE roster OWNER TO miners;

COMMENT ON TABLE roster IS 'roster for NCAA sports teams';

DROP TABLE IF EXISTS game_info;

CREATE TABLE game_info
(
    game_id integer NOT NULL,
    date date NOT NULL,
    away_team_id integer NOT NULL,
    home_team_id integer NOT NULL,
    location character varying NULL,
    attendance integer NULL,
    officials character varying NULL
);

ALTER TABLE game_info OWNER TO miners;

COMMENT ON TABLE game_info IS 'info about each NCAA game';

DROP TABLE IF EXISTS game_team_scoring_m_baseball;

CREATE TABLE game_team_scoring_m_baseball
(
    game_id integer NOT NULL,
    team_id integer NOT NULL,
    num_innings integer NOT NULL,
    score integer NOT NULL,
    inning_1 integer NOT NULL,
    inning_2 integer NOT NULL,
    inning_3 integer NOT NULL,
    inning_4 integer NOT NULL,
    inning_5 integer NULL,
    inning_6 integer NULL,
    inning_7 integer NULL,
    inning_8 integer NULL,
    inning_9 integer NULL,
    inning_10 integer NULL,
    inning_11 integer NULL,
    inning_12 integer NULL,
    inning_13 integer NULL,
    inning_14 integer NULL,
    inning_15 integer NULL,
    inning_16 integer NULL,
    inning_17 integer NULL,
    inning_18 integer NULL,
    inning_19 integer NULL,
    inning_20 integer NULL,
    inning_21 integer NULL,
    inning_22 integer NULL,
    inning_23 integer NULL
);

ALTER TABLE game_team_scoring_m_baseball OWNER TO miners;

COMMENT ON TABLE game_team_scoring_m_baseball IS 'all ncaa baseball games team scoring';

DROP TABLE IF EXISTS game_team_scoring_m_basketball;

CREATE TABLE game_team_scoring_m_basketball
(
    game_id integer NOT NULL,
    team_id integer NOT NULL,
    num_periods integer NOT NULL,
    score integer NOT NULL,
    half_1 integer NOT NULL,
    half_2 integer NULL,
    overtime_1 integer NULL,
    overtime_2 integer NULL,
    overtime_3 integer NULL,
    overtime_4 integer NULL,
    overtime_5 integer NULL
);

ALTER TABLE game_team_scoring_m_basketball OWNER TO miners;

COMMENT ON TABLE game_team_scoring_m_basketball IS 'all ncaa mens basketball games team scoring';

DROP TABLE IF EXISTS game_team_scoring_m_soccer;

CREATE TABLE game_team_scoring_m_soccer
(
    game_id integer NOT NULL,
    team_id integer NOT NULL,
    num_periods integer NOT NULL,
    score integer NOT NULL,
    half_1 integer NOT NULL,
    half_2 integer NULL,
    overtime_1 integer NULL,
    overtime_2 integer NULL,
    overtime_3 integer NULL
);

ALTER TABLE game_team_scoring_m_soccer OWNER TO miners;

COMMENT ON TABLE game_team_scoring_m_soccer IS 'all ncaa mens soccer games team scoring';

DROP TABLE IF EXISTS game_team_scoring_w_basketball;

CREATE TABLE game_team_scoring_w_basketball
(
    game_id integer NOT NULL,
    team_id integer NOT NULL,
    num_periods integer NOT NULL,
    score integer NOT NULL,
    quarter_1 integer NOT NULL,
    quarter_2 integer NOT NULL,
    quarter_3 integer NULL,
    quarter_4 integer NULL,
    overtime_1 integer NULL,
    overtime_2 integer NULL,
    overtime_3 integer NULL,
    overtime_4 integer NULL,
    overtime_5 integer NULL
);

ALTER TABLE game_team_scoring_w_basketball OWNER TO miners;

COMMENT ON TABLE game_team_scoring_w_basketball IS 'all ncaa womens basketball games team scoring';

DROP TABLE IF EXISTS game_team_scoring_w_field_hockey;

CREATE TABLE game_team_scoring_w_field_hockey
(
    game_id integer NOT NULL,
    team_id integer NOT NULL,
    num_periods integer NOT NULL,
    score integer NOT NULL,
    half_1 integer NOT NULL,
    half_2 integer NULL,
    overtime_1 integer NULL,
    overtime_2 integer NULL,
    overtime_3 integer NULL
);

ALTER TABLE game_team_scoring_w_field_hockey OWNER TO miners;

COMMENT ON TABLE game_team_scoring_w_field_hockey IS 'all ncaa field hockey games team scoring';

DROP TABLE IF EXISTS game_team_scoring_w_lacrosse;

CREATE TABLE game_team_scoring_w_lacrosse
(
    game_id integer NOT NULL,
    team_id integer NOT NULL,
    num_periods integer NOT NULL,
    score integer NOT NULL,
    half_1 integer NOT NULL,
    half_2 integer NULL,
    overtime_1 integer NULL,
    overtime_2 integer NULL,
    overtime_3 integer NULL,
    overtime_4 integer NULL,
    overtime_5 integer NULL
);

ALTER TABLE game_team_scoring_w_lacrosse OWNER TO miners;

COMMENT ON TABLE game_team_scoring_w_lacrosse IS 'all ncaa womens lacrosse games team scoring';

DROP TABLE IF EXISTS game_team_scoring_w_softball;

CREATE TABLE game_team_scoring_w_softball
(
    game_id integer NOT NULL,
    team_id integer NOT NULL,
    num_innings integer NOT NULL,
    score integer NOT NULL,
    inning_1 integer NULL,
    inning_2 integer NULL,
    inning_3 integer NULL,
    inning_4 integer NULL,
    inning_5 integer NULL,
    inning_6 integer NULL,
    inning_7 integer NULL,
    inning_8 integer NULL,
    inning_9 integer NULL,
    inning_10 integer NULL,
    inning_11 integer NULL,
    inning_12 integer NULL,
    inning_13 integer NULL,
    inning_14 integer NULL,
    inning_15 integer NULL,
    inning_16 integer NULL,
    inning_17 integer NULL,
    inning_18 integer NULL,
    inning_19 integer NULL
);

ALTER TABLE game_team_scoring_w_softball OWNER TO miners;

COMMENT ON TABLE game_team_scoring_w_softball IS 'all ncaa softball games team scoring';

DROP TABLE IF EXISTS game_team_scoring_w_soccer;

CREATE TABLE game_team_scoring_w_soccer
(
    game_id integer NOT NULL,
    team_id integer NOT NULL,
    num_periods integer NOT NULL,
    score integer NOT NULL,
    half_1 integer NOT NULL,
    half_2 integer NULL,
    overtime_1 integer NULL,
    overtime_2 integer NULL,
    overtime_3 integer NULL
);

ALTER TABLE game_team_scoring_w_soccer OWNER TO miners;

COMMENT ON TABLE game_team_scoring_w_soccer IS 'all ncaa womens soccer games team scoring';

DROP TABLE IF EXISTS game_team_scoring_w_volleyball;

CREATE TABLE game_team_scoring_w_volleyball
(
    game_id integer NOT NULL,
    team_id integer NOT NULL,
    num_sets integer NOT NULL,
    score integer NOT NULL,
    set_1 integer NOT NULL,
    set_2 integer NULL,
    set_3 integer NULL,
    set_4 integer NULL,
    set_5 integer NULL
);

ALTER TABLE game_team_scoring_w_volleyball OWNER TO miners;

COMMENT ON TABLE game_team_scoring_w_volleyball IS 'all ncaa womens volleyball games team scoring';

DROP TABLE IF EXISTS game_stats_m_baseball;

CREATE TABLE game_stats_m_baseball
(
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    pos character varying null,
    g integer NOT NULL, 
    r integer NOT NULL, 
    ab integer NOT NULL, 
    h integer NOT NULL, 
    doubles integer NOT NULL, 
    triples integer NOT NULL, 
    tb integer NOT NULL, 
    hr integer NOT NULL, 
    rbi integer NOT NULL, 
    bb integer NOT NULL, 
    hbp integer NOT NULL, 
    sf integer NOT NULL, 
    sh integer NOT NULL, 
    k integer NOT NULL, 
    dp integer NOT NULL, 
    cs integer NOT NULL, 
    picked integer NOT NULL, 
    sb integer NOT NULL, 
    rbi2out integer NOT NULL,
    app integer NOT NULL,
    gs integer NOT NULL,
    ip real NOT NULL,
    cg integer NOT NULL,
    h_a integer NOT NULL,
    r_a integer NOT NULL,
    er integer NOT NULL,
    bb_a integer NOT NULL,
    so integer NOT NULL,
    sho integer NOT NULL,
    bf integer NOT NULL,           
    p_oab integer NOT NULL,
    doubles_a integer NOT NULL,
    triples_a integer NOT NULL,
    bk integer NOT NULL,
    hr_a integer NOT NULL,
    wp integer NOT NULL,
    hb integer NOT NULL,
    ibb integer NOT NULL,
    inh_run integer NOT NULL,
    inh_run_score integer NOT NULL,
    sha integer NOT NULL,
    sfa integer NOT NULL,            
    pitches integer NOT NULL,
    go integer NOT NULL,
    fo integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    sv integer NOT NULL,
    ord_appeared integer NOT NULL,
    kl integer NOT NULL,
    po integer NOT NULL,
    tc integer NOT NULL,
    a integer NOT NULL,
    e integer NOT NULL,
    ci integer NOT NULL,
    pb integer NOT NULL,
    sba integer NOT NULL,
    csb integer NOT NULL,
    idp integer NOT NULL,
    tp integer NOT NULL
);

ALTER TABLE game_stats_m_baseball OWNER TO miners;

COMMENT ON TABLE game_stats_m_baseball IS 'all NCAA baseball player game stats';

DROP TABLE IF EXISTS game_stats_m_basketball;

CREATE TABLE game_stats_m_basketball
(
  game_id integer NOT NULL,
  player_id integer NOT NULL,
  pos character varying null, 
  mp character varying NULL, 
  fgm integer NOT NULL, 
  fga integer NOT NULL, 
  three_fg integer NOT NULL, 
  three_fga integer NOT NULL, 
  ft integer NOT NULL, 
  fta integer NOT NULL, 
  pts integer NOT NULL, 
  orebs integer NULL, 
  drebs integer NULL, 
  tot_reb integer NOT NULL, 
  ast integer NOT NULL, 
  turn integer NOT NULL, 
  stl integer NOT NULL, 
  blk integer NOT NULL, 
  fouls integer NOT NULL
);

ALTER TABLE game_stats_m_basketball OWNER TO miners;

COMMENT ON TABLE game_stats_m_basketball IS 'all NCAA mens basketball player game stats';

DROP TABLE IF EXISTS game_stats_m_soccer;

CREATE TABLE game_stats_m_soccer
(
  game_id integer NOT NULL,
  player_id integer NOT NULL,
  pos character varying null, 
  goals integer NOT NULL, 
  assists integer NOT NULL, 
  shatt integer NOT NULL, 
  sog integer NOT NULL, 
  fouls integer NOT NULL, 
  red_cards integer NOT NULL, 
  yellow_cards integer NOT NULL, 
  gc integer NOT NULL, 
  goalie_gp integer NOT NULL, 
  ggs integer NOT NULL, 
  goalie_min_plyd character varying NOT NULL, 
  ga integer NOT NULL, 
  saves integer NOT NULL, 
  shutouts integer NOT NULL, 
  g_wins integer NOT NULL, 
  g_loss integer NOT NULL, 
  dsaves integer NOT NULL, 
  corners integer NOT NULL, 
  gwg integer NULL
);

ALTER TABLE game_stats_m_soccer OWNER TO miners;

COMMENT ON TABLE game_stats_m_soccer IS 'all NCAA mens soccer player game stats';

DROP TABLE IF EXISTS game_stats_w_basketball;

CREATE TABLE game_stats_w_basketball
(
  game_id integer NOT NULL,
  player_id integer NOT NULL,
  pos character varying null, 
  mp character varying NULL, 
  fgm integer NOT NULL, 
  fga integer NOT NULL, 
  three_fg integer NOT NULL, 
  three_fga integer NOT NULL, 
  ft integer NOT NULL, 
  fta integer NOT NULL, 
  pts integer NOT NULL, 
  orebs integer NULL, 
  drebs integer NULL, 
  tot_reb integer NOT NULL, 
  ast integer NOT NULL, 
  turn integer NOT NULL, 
  stl integer NOT NULL, 
  blk integer NOT NULL, 
  pf integer NOT NULL
);

ALTER TABLE game_stats_w_basketball OWNER TO miners;

COMMENT ON TABLE game_stats_w_basketball IS 'all NCAA womens basketball player game stats';

DROP TABLE IF EXISTS game_stats_w_field_hockey;

CREATE TABLE game_stats_w_field_hockey
(
  game_id integer NOT NULL,
  player_id integer NOT NULL,
  pos character varying null, 
  goals integer NOT NULL, 
  ast integer NOT NULL, 
  shatt integer NOT NULL, 
  sog integer NOT NULL, 
  fouls integer NOT NULL, 
  rc integer NOT NULL, 
  yc integer NOT NULL, 
  gc integer NOT NULL, 
  ggp integer NOT NULL, 
  ggs integer NOT NULL, 
  min character varying NOT NULL, 
  ga integer NOT NULL, 
  sv integer NOT NULL, 
  sho integer NOT NULL, 
  g_wins integer NOT NULL, 
  g_loss integer NOT NULL, 
  dsv integer NOT NULL, 
  corners integer NOT NULL
);

ALTER TABLE game_stats_w_field_hockey OWNER TO miners;

COMMENT ON TABLE game_stats_m_baseball IS 'all NCAA field hockey player game stats';

DROP TABLE IF EXISTS game_stats_w_lacrosse;

CREATE TABLE game_stats_w_lacrosse
(
  game_id integer NOT NULL,
  player_id integer NOT NULL,
  pos character varying null,
  fouls integer NULL, 
  goals integer NOT NULL, 
  assists integer NOT NULL, 
  points integer NOT NULL, 
  shots integer NOT NULL, 
  sog integer NOT NULL, 
  ground_balls integer NOT NULL, 
  ct integer NOT NULL, 
  g_min character varying NOT NULL, 
  goals_allowed integer NOT NULL, 
  saves integer NOT NULL, 
  w integer NOT NULL, 
  l integer NOT NULL, 
  rc integer NOT NULL, 
  yc integer NOT NULL, 
  draw_controls integer NOT NULL
);

ALTER TABLE game_stats_w_lacrosse OWNER TO miners;

COMMENT ON TABLE game_stats_w_lacrosse IS 'all NCAA womens lacrosse player game stats';

DROP TABLE IF EXISTS game_stats_w_softball;

CREATE TABLE game_stats_w_softball
(
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    pos character varying null, 
    g integer NOT NULL, 
    ab integer NOT NULL, 
    r integer NOT NULL, 
    h integer NOT NULL, 
    doubles integer NOT NULL, 
    triples integer NOT NULL, 
    tb integer NOT NULL, 
    hr integer NOT NULL, 
    ibb integer NOT NULL, 
    bb integer NOT NULL, 
    hbp integer NOT NULL, 
    rbi integer NOT NULL, 
    sf integer NOT NULL, 
    sh integer NOT NULL, 
    k integer NOT NULL, 
    kl integer NOT NULL, 
    dp integer NOT NULL, 
    gdp integer NOT NULL, 
    tp integer NOT NULL, 
    sb integer NOT NULL, 
    cs integer NOT NULL, 
    picked integer NOT NULL, 
    go integer NOT NULL, 
    fo integer NOT NULL,
    app integer NOT NULL,
    gs integer NOT NULL,
    ip real NOT NULL,
    ha integer NOT NULL,
    ra integer NOT NULL,
    er integer NOT NULL,                    
    bb_a integer NOT NULL,
    so integer NOT NULL,
    sho integer NOT NULL,
    bf integer NOT NULL,
    p_oab integer NOT NULL,
    doubles_a integer NOT NULL,
    triples_a integer NOT NULL,
    hr_a integer NULL,
    cso integer NOT NULL,
    wp integer NOT NULL,
    bk integer NOT NULL,
    hb integer NOT NULL,
    sol integer NOT NULL,
    ibb_a integer NOT NULL,                    
    cg integer NOT NULL,
    inh_run integer NOT NULL,
    inh_run_score integer NOT NULL,
    sha integer NOT NULL,
    sfa integer NOT NULL,
    cia integer NOT NULL,
    pitches integer NOT NULL,
    go_a integer NOT NULL,
    fo_a integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    sv integer NOT NULL,                    
    ord_appeared integer NULL,
    po integer NOT NULL,
    a integer NOT NULL,
    e integer NOT NULL,
    ci integer NOT NULL,
    pb integer NOT NULL,
    sba integer NOT NULL,
    csb integer NOT NULL,
    tc integer NOT NULL,
    idp integer NOT NULL,
    itp integer NOT NULL
);

ALTER TABLE game_stats_w_softball OWNER TO miners;

COMMENT ON TABLE game_stats_w_softball IS 'all NCAA softball player game stats';

DROP TABLE IF EXISTS game_stats_w_soccer;

CREATE TABLE game_stats_w_soccer
(
  game_id integer NOT NULL,
  player_id integer NOT NULL,
  pos character varying null, 
  games integer NOT NULL, 
  goals integer NOT NULL, 
  assists integer NOT NULL, 
  shatt integer NOT NULL, 
  sog integer NOT NULL, 
  fouls integer NOT NULL, 
  red_cards integer NOT NULL, 
  yellow_cards integer NOT NULL, 
  gc integer NOT NULL, 
  goal_app integer NOT NULL, 
  ggs integer NOT NULL, 
  goalie_min_plyd character varying NULL, 
  ga integer NOT NULL, 
  saves integer NOT NULL, 
  shutouts integer NOT NULL, 
  g_wins integer NOT NULL, 
  g_loss integer NOT NULL, 
  dsaves integer NOT NULL, 
  corners integer NOT NULL
);

ALTER TABLE game_stats_w_soccer OWNER TO miners;

COMMENT ON TABLE game_stats_w_soccer IS 'all NCAA womens soccer player game stats';

DROP TABLE IF EXISTS game_stats_w_volleyball;

CREATE TABLE game_stats_w_volleyball
(
  game_id integer NOT NULL,
  player_id integer NOT NULL,
  pos character varying null, 
  s integer NOT NULL, 
  mp integer NULL, 
  ms integer NOT NULL, 
  kills integer NOT NULL, 
  errors integer NOT NULL, 
  total_attacks integer NOT NULL, 
  hit_pct real NULL, 
  assists integer NOT NULL, 
  aces integer NOT NULL, 
  serr integer NOT NULL, 
  digs integer NOT NULL, 
  rerr integer NULL, 
  block_solos integer NOT NULL, 
  block_assists integer NOT NULL, 
  berr integer NOT NULL, 
  pts real NOT NULL, 
  bhe integer NOT NULL
);

ALTER TABLE game_stats_w_volleyball OWNER TO miners;

COMMENT ON TABLE game_stats_w_volleyball IS 'all NCAA womens volleyball player game stats';

DROP TABLE IF EXISTS requests;

CREATE TABLE requests
(
    university character varying NULL,
    year integer NULL,
    sport character varying NULL,
    done character varying NOT NULL
);

ALTER TABLE requests OWNER TO miners;

COMMENT ON TABLE requests IS 'Requests for the NCAA database';
    