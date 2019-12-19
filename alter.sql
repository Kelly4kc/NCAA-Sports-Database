ALTER TABLE conference ADD PRIMARY KEY (conference_id);

ALTER TABLE university ADD PRIMARY KEY (university_id);

ALTER TABLE sport ADD PRIMARY KEY (sport_id);

ALTER TABLE team ADD PRIMARY KEY (team_id);
ALTER TABLE team ADD FOREIGN KEY (sport_id) REFERENCES sport;
ALTER TABLE team ADD FOREIGN KEY (conference_id) REFERENCES conference;
ALTER TABLE team ADD FOREIGN KEY (university_id) REFERENCES university;

ALTER TABLE player ADD PRIMARY KEY (player_id);

ALTER TABLE roster ADD PRIMARY KEY (player_id, team_id);
ALTER TABLE roster ADD FOREIGN KEY (player_id) REFERENCES player;

ALTER TABLE game_info ADD PRIMARY KEY (game_id);
ALTER TABLE game_info ADD FOREIGN KEY (away_team_id) REFERENCES team(team_id);
ALTER TABLE game_info ADD FOREIGN KEY (home_team_id) REFERENCES team(team_id);

ALTER TABLE game_team_scoring_m_baseball ADD PRIMARY KEY (game_id, team_id);
ALTER TABLE game_team_scoring_m_baseball ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_team_scoring_m_baseball ADD FOREIGN KEY (team_id) REFERENCES team;

ALTER TABLE game_team_scoring_m_basketball ADD PRIMARY KEY (game_id, team_id);
ALTER TABLE game_team_scoring_m_basketball ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_team_scoring_m_basketball ADD FOREIGN KEY (team_id) REFERENCES team;

ALTER TABLE game_team_scoring_m_soccer ADD PRIMARY KEY (game_id, team_id);
ALTER TABLE game_team_scoring_m_soccer ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_team_scoring_m_soccer ADD FOREIGN KEY (team_id) REFERENCES team;

ALTER TABLE game_team_scoring_w_basketball ADD PRIMARY KEY (game_id, team_id);
ALTER TABLE game_team_scoring_w_basketball ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_team_scoring_w_basketball ADD FOREIGN KEY (team_id) REFERENCES team;

ALTER TABLE game_team_scoring_w_field_hockey ADD PRIMARY KEY (game_id, team_id);
ALTER TABLE game_team_scoring_w_field_hockey ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_team_scoring_w_field_hockey ADD FOREIGN KEY (team_id) REFERENCES team;

ALTER TABLE game_team_scoring_w_lacrosse ADD PRIMARY KEY (game_id, team_id);
ALTER TABLE game_team_scoring_w_lacrosse ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_team_scoring_w_lacrosse ADD FOREIGN KEY (team_id) REFERENCES team;

ALTER TABLE game_team_scoring_w_softball ADD PRIMARY KEY (game_id, team_id);
ALTER TABLE game_team_scoring_w_softball ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_team_scoring_w_softball ADD FOREIGN KEY (team_id) REFERENCES team;

ALTER TABLE game_team_scoring_w_soccer ADD PRIMARY KEY (game_id, team_id);
ALTER TABLE game_team_scoring_w_soccer ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_team_scoring_w_soccer ADD FOREIGN KEY (team_id) REFERENCES team;

ALTER TABLE game_team_scoring_w_volleyball ADD PRIMARY KEY (game_id, team_id);
ALTER TABLE game_team_scoring_w_volleyball ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_team_scoring_w_volleyball ADD FOREIGN KEY (team_id) REFERENCES team;

ALTER TABLE game_stats_m_baseball ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_stats_m_baseball ADD FOREIGN KEY (player_id) REFERENCES player;

ALTER TABLE game_stats_m_basketball ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_stats_m_basketball ADD FOREIGN KEY (player_id) REFERENCES player;

ALTER TABLE game_stats_m_soccer ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_stats_m_soccer ADD FOREIGN KEY (player_id) REFERENCES player;

ALTER TABLE game_stats_w_basketball ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_stats_w_basketball ADD FOREIGN KEY (player_id) REFERENCES player;

ALTER TABLE game_stats_w_field_hockey ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_stats_w_field_hockey ADD FOREIGN KEY (player_id) REFERENCES player;

ALTER TABLE game_stats_w_lacrosse ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_stats_w_lacrosse ADD FOREIGN KEY (player_id) REFERENCES player;

ALTER TABLE game_stats_w_softball ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_stats_w_softball ADD FOREIGN KEY (player_id) REFERENCES player;

ALTER TABLE game_stats_w_soccer ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_stats_w_soccer ADD FOREIGN KEY (player_id) REFERENCES player;

ALTER TABLE game_stats_w_volleyball ADD FOREIGN KEY (game_id) REFERENCES game_info;
ALTER TABLE game_stats_w_volleyball ADD FOREIGN KEY (player_id) REFERENCES player;
ALTER TABLE game_stats_w_volleyball ADD FOREIGN KEY (player_id) REFERENCES player;