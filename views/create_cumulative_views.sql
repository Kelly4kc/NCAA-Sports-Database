DROP VIEW IF EXISTS m_baseball_cumulative_stats;

CREATE VIEW m_baseball_cumulative_stats AS
    SELECT player_id, count(*) AS g, sum(r) AS r, sum(ab) AS ab, sum(h) AS h, sum(doubles) AS doubles,
        sum(triples) AS triples, sum(tb) AS tb, sum(hr) AS hr, sum(rbi) AS rbi, sum(bb) AS bb, sum(hbp) AS hbp,
        sum(sf) AS sf, sum(sh) AS sh, sum(k) AS k, sum(dp) AS dp, sum(cs) AS cs, sum(picked) AS picked,
        sum(sb) AS sb, sum(rbi2out) AS rbi2out, sum(app) AS app, sum(gs) AS gs,
        round(sum(round(ip) + (10 * (ip - round(ip)) / 3))::numeric, 2) AS ip, sum(cg) AS cg, sum(h_a) AS h_a,
        sum(r_a) AS r_a, sum(er) AS er, sum(bb_a) AS bb_a, sum(so) AS so, sum(sho) AS sho, sum(bf) AS bf,
        sum(p_oab) AS p_oab, sum(doubles_a) AS doubles_a, sum(triples_a) AS triples_a, sum(bk) AS bk,
        sum(hr_a) AS hr_a, sum(wp) AS wp, sum(hb) AS hb, sum(ibb) AS ibb, sum(inh_run) AS inh_run,
        sum(inh_run_score) AS inh_run_score, sum(sha) AS sha, sum(sfa) AS sfa, sum(pitches) AS pitches,
        sum(go) AS go, sum(fo) AS fo, sum(w) AS w, sum(l) AS l, sum(sv) AS sv, sum(kl) AS kl, sum(po) AS po,
        sum(tc) AS tc, sum(a) AS a, sum(e) AS e, sum(ci) AS ci, sum(pb) AS pb, sum(sba) AS sba, sum(csb) AS csb,
        sum(idp) AS idp, sum(tp) AS tp
    FROM game_stats_m_baseball
    GROUP BY player_id;
    
ALTER VIEW m_baseball_cumulative_stats OWNER TO miners;

COMMENT ON VIEW m_baseball_cumulative_stats IS 'NCAA baseball cumulative stats';

DROP VIEW IF EXISTS m_basketball_cumulative_stats;

CREATE VIEW m_basketball_cumulative_stats AS
  SELECT player_id, count(*) AS g, sum(fgm) AS fgm, sum(fga) AS fga, sum(three_fg) AS three_fg,
      sum(three_fga) AS three_fga, sum(ft) AS ft, sum(fta) AS fta, sum(pts) AS pts, sum(orebs) AS orebs,
      sum(drebs) AS drebs, sum(tot_reb) AS tot_reb, sum(ast) AS ast, sum(turn) AS turn, sum(stl) AS stl,
      sum(blk) AS blk, sum(fouls) AS fouls
  FROM game_stats_m_basketball
  GROUP BY player_id;
  
ALTER VIEW m_basketball_cumulative_stats OWNER TO miners;

COMMENT ON VIEW m_basketball_cumulative_stats IS 'NCAA mens basketball cumulative stats';

DROP VIEW IF EXISTS m_soccer_cumulative_stats;

CREATE VIEW m_soccer_cumulative_stats AS
  SELECT player_id, count(*) AS g, sum(goals) AS goals, sum(assists) AS assists, sum(shatt) AS shatt,
      sum(sog) AS sog, sum(fouls) AS fouls, sum(red_cards) AS red_cards, sum(yellow_cards) AS yellow_cards,
      sum(gc) AS gc, sum(goalie_gp) AS goalie_gp, sum(ggs) AS ggs, sum(ga) AS ga, sum(saves) AS saves,
      sum(shutouts) AS shutouts, sum(g_wins) AS g_wins, sum(g_loss) AS g_loss, sum(dsaves) AS dsaves,
      sum(corners) AS corners, sum(gwg) AS gwg
  FROM game_stats_m_soccer
  GROUP BY player_id;

ALTER VIEW m_soccer_cumulative_stats OWNER TO miners;

COMMENT ON VIEW m_soccer_cumulative_stats IS 'NCAA mens soccer cumulative stats';

DROP VIEW IF EXISTS w_basketball_cumulative_stats;

CREATE VIEW w_basketball_cumulative_stats AS
  SELECT player_id, count(*) AS g, sum(fgm) AS fgm, sum(fga) AS fga, sum(three_fg) AS three_fg,
      sum(three_fga) AS three_fga, sum(ft) AS ft, sum(fta) AS fta, sum(pts) AS pts, sum(orebs) AS orebs,
      sum(drebs) AS drebs, sum(tot_reb) AS tot_reb, sum(ast) AS ast, sum(turn) AS turn, sum(stl) AS stl,
      sum(blk) AS blk, sum(pf) AS pf
  FROM game_stats_w_basketball
  GROUP BY player_id;

ALTER VIEW w_basketball_cumulative_stats OWNER TO miners;

COMMENT ON VIEW w_basketball_cumulative_stats IS 'NCAA womens basketball cumulative stats';

DROP VIEW IF EXISTS w_field_hockey_cumulative_stats;

CREATE VIEW w_field_hockey_cumulative_stats AS
  SELECT player_id, count(*) AS g, sum(goals) AS goals, sum(ast) AS ast, sum(shatt) AS shatt, sum(sog) AS sog,
      sum(fouls) AS fouls, sum(rc) AS rc, sum(yc) AS yc, sum(gc) AS gc, sum(ggp) AS ggp, sum(ggs) AS ggs, sum(ga) AS ga,
      sum(sv) AS sv, sum(sho) AS sho, sum(g_wins) AS g_wins, sum(g_loss) AS g_loss, sum(dsv) AS dsv, sum(corners) AS corners
  FROM game_stats_w_field_hockey
  GROUP BY player_id;

ALTER VIEW w_field_hockey_cumulative_stats OWNER TO miners;

COMMENT ON VIEW m_baseball_cumulative_stats IS 'NCAA field hockey cumulative stats';

DROP VIEW IF EXISTS w_lacrosse_cumulative_stats;

CREATE VIEW w_lacrosse_cumulative_stats AS
  SELECT player_id, count(*) AS g, sum(fouls) AS fouls, sum(goals) AS goals, sum(assists) AS assists,
      sum(points) AS points, sum(shots) AS shots, sum(sog) AS sog, sum(ground_balls) AS ground_balls, sum(ct) AS ct,
      sum(goals_allowed) AS goals_allowed, sum(saves) AS saves, sum(w) AS w, sum(l) AS l, sum(rc) AS rc, sum(yc) AS yc,
      sum(draw_controls) AS draw_controls
  FROM game_stats_w_lacrosse
  GROUP BY player_id;

ALTER VIEW w_lacrosse_cumulative_stats OWNER TO miners;

COMMENT ON VIEW w_lacrosse_cumulative_stats IS 'NCAA womens lacrosse cumulative stats';

DROP VIEW IF EXISTS w_softball_cumulative_stats;

CREATE VIEW w_softball_cumulative_stats AS
  SELECT player_id, count(*) AS g, sum(ab) AS ab, sum(r) AS r, sum(h) AS h, sum(doubles) AS doubles,
      sum(triples) AS triples, sum(tb) AS tb, sum(hr) AS hr, sum(ibb) AS ibb, sum(bb) AS bb, sum(hbp) AS hbp,
      sum(rbi) AS rbi, sum(sf) AS sf, sum(sh) AS sh, sum(k) AS k, sum(kl) AS kl, sum(dp) AS dp, sum(gdp) AS gdp,
      sum(tp) AS tp, sum(sb) AS sb, sum(cs) AS cs, sum(picked) AS picked, sum(go) AS go, sum(fo) AS fo, sum(app) AS app,
      sum(gs) AS gs, round(sum(round(ip) + (10 * (ip - round(ip)) / 3))::numeric, 2) AS ip, sum(ha) AS ha, sum(ra) AS ra,
      sum(er) AS er, sum(bb_a) AS bb_a, sum(so) AS so, sum(sho) AS sho, sum(bf) AS bf, sum(p_oab) AS p_oab,
      sum(doubles_a) AS doubles_a, sum(triples_a) AS triples_a, sum(hr_a) AS hr_a, sum(cso) AS cso, sum(wp) AS wp, sum(bk) AS bk,
      sum(hb) AS hb, sum(sol) AS sol, sum(ibb_a) AS ibb_a, sum(cg) AS cg, sum(inh_run) AS inh_run, sum(inh_run_score) AS inh_run_score,
      sum(sha) AS sha, sum(sfa) AS sfa, sum(cia) AS cia, sum(pitches) AS pitches, sum(go_a) AS go_a, sum(fo_a) AS fo_a, sum(w) AS w,
      sum(l) AS l, sum(sv) AS sv, sum(po) AS po, sum(a) AS a, sum(e) AS e, sum(ci) AS ci, sum(pb) AS pb, sum(sba) AS sba, sum(csb) AS csb,
      sum(tc) AS tc, sum(idp) AS idp, sum(itp) AS itp
  FROM game_stats_w_softball
  GROUP BY player_id;

ALTER VIEW w_softball_cumulative_stats OWNER TO miners;

COMMENT ON VIEW w_softball_cumulative_stats IS 'NCAA softball cumulative stats';

DROP VIEW IF EXISTS w_soccer_cumulative_stats;

CREATE VIEW w_soccer_cumulative_stats AS
  SELECT player_id, count(*) AS g, sum(goals) AS goals, sum(assists) AS assists, sum(shatt) AS shatt, sum(sog) AS sog,
      sum(fouls) AS fouls, sum(red_cards) AS red_cards, sum(yellow_cards) AS yellow_cards, sum(gc) AS gc, sum(goal_app) AS goal_app,
      sum(ggs) AS ggs, sum(ga) AS ga, sum(saves) AS saves, sum(shutouts) AS shutouts, sum(g_wins) AS g_wins, sum(g_loss) AS g_loss,
      sum(dsaves) AS dsaves, sum(corners) AS corners
  FROM game_stats_w_soccer
  GROUP BY player_id;

ALTER VIEW w_soccer_cumulative_stats OWNER TO miners;

COMMENT ON VIEW w_soccer_cumulative_stats IS 'NCAA womens soccer cumulative stats';

DROP VIEW IF EXISTS w_volleyball_cumulative_stats;

CREATE VIEW w_volleyball_cumulative_stats AS
  SELECT player_id, count(*) AS g, sum(s) AS s, sum(mp) AS mp, sum(ms) AS ms, sum(kills) AS kills, sum(errors) AS errors,
      sum(total_attacks) AS total_attacks, avg(hit_pct) AS hit_pct, sum(assists) AS assists, sum(aces) AS aces, sum(serr) AS serr,
      sum(digs) AS digs, sum(rerr) AS rerr, sum(block_solos) AS block_solos, sum(block_assists) AS block_assists, sum(berr) AS berr,
      sum(pts) AS pts, sum(bhe) AS bhe
  FROM game_stats_w_volleyball
  GROUP BY player_id;

ALTER VIEW w_volleyball_cumulative_stats OWNER TO miners;

COMMENT ON VIEW w_volleyball_cumulative_stats IS 'NCAA womens volleyball cumulative stats';