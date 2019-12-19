DROP VIEW IF EXISTS m_baseball_advanced_stats;

CREATE VIEW m_baseball_advanced_stats AS
  SELECT player_id, g, round(r / g::numeric, 3) AS r_g, round(ab / g::numeric, 3) AS ab_g,
                       round(h / g::numeric, 3) AS h_g, round(doubles / g::numeric, 3) AS doubles_g,
                       round(triples / g::numeric, 3) AS triples_g, round(tb / g::numeric, 3) AS tb_g,
                       round(hr / g::numeric, 3) AS hr_g, round(rbi / g::numeric, 3) AS rbi_g,
                       round(bb / g::numeric, 3) AS bb_g, round(hbp / g::numeric, 3) AS hbp_g,
                       round(sf / g::numeric, 3) AS sf_g, round(sh / g::numeric, 3) AS sh_g,
                       round(k / g::numeric, 3) AS k_g, round(dp / g::numeric, 3) AS dp_g,
                       round(cs / g::numeric, 3) AS cs_g, round(picked / g::numeric, 3) AS picked_g,
                       round(sb / g::numeric, 3) AS sb_g, round(rbi2out / g::numeric, 3) AS rbi2out_g,
                       round(app / g::numeric, 3) AS app_g, round(gs / g::numeric, 3) AS gs_g,
                       round(ip / g::numeric, 3) AS ip_g, round(cg / g::numeric, 3) AS cg_g,
                       round(h_a / g::numeric, 3) AS h_a_g, round(r_a / g::numeric, 3) AS r_a_g,
                       round(er / g::numeric, 3) AS er_g, round(bb_a / g::numeric, 3) AS bb_a_g,
                       round(so / g::numeric, 3) AS so_g, round(sho / g::numeric, 3) AS sho_g,
                       round(bf / g::numeric, 3) AS bf_g, round(p_oab / g::numeric, 3) AS p_oab_g,
                       round(doubles_a / g::numeric, 3) AS doubles_a_g, round(triples_a / g::numeric, 3) AS triples_a_g,
                       round(bk / g::numeric, 3) AS bk_g, round(hr_a / g::numeric, 3) AS hr_a_g,
                       round(wp / g::numeric, 3) AS wp_g, round(hb / g::numeric, 3) AS hb_g,
                       round(ibb / g::numeric, 3) AS ibb_g, round(inh_run / g::numeric, 3) AS inh_run_g,
                       round(inh_run_score / g::numeric, 3) AS inh_run_score_g, round(sha / g::numeric, 3) AS sha_g,
                       round(sfa / g::numeric, 3) AS sfa_g, round(pitches / g::numeric, 3) AS pitches_g,
                       round(go / g::numeric, 3) AS go_g, round(fo / g::numeric, 3) AS fo_g, round(w / g::numeric, 3) AS w_g,
                       round(l / g::numeric, 3) AS l_g, round(sv / g::numeric, 3) AS sv_g, round(kl / g::numeric, 3) AS kl_g,
                       round(po / g::numeric, 3) AS po_g, round(tc / g::numeric, 3) AS tc_g, round(a / g::numeric, 3) AS a_g,
                       round(e / g::numeric, 3) AS e_g, round(ci / g::numeric, 3) AS ci_g, round(pb / g::numeric, 3) AS pb_g,
                       round(sba / g::numeric, 3) AS sba_g, round(csb / g::numeric, 3) AS csb_g,
                       round(idp / g::numeric, 3) AS idp_g, round(tp / g::numeric, 3) AS tp_g
  FROM m_baseball_cumulative_stats
  WHERE g > 0;
    
ALTER VIEW m_baseball_advanced_stats OWNER TO miners;

COMMENT ON VIEW m_baseball_advanced_stats IS 'NCAA baseball averages per game';

DROP VIEW IF EXISTS m_basketball_advanced_stats;

CREATE VIEW m_basketball_advanced_stats AS
  SELECT player_id, g, round(fgm / g::numeric, 3) AS fgm_g, round(fga / g::numeric, 3) AS fga_g, three_fg,
                       round(three_fga / g::numeric, 3) AS three_fga_g, round(ft / g::numeric, 3) AS ft_g, round(fta / g::numeric, 3) AS fta_g,
                       round(pts / g::numeric, 3) AS pts_g, round(orebs / g::numeric, 3) AS orebs_g, round(drebs / g::numeric, 3) AS drebs_g,
                       round(tot_reb / g::numeric, 3) AS tot_reb_g, round(ast / g::numeric, 3) AS ast_g, round(turn / g::numeric, 3) AS turn_g,
                       round(stl / g::numeric, 3) AS stl_g, round(blk / g::numeric, 3) AS blk_g, round(fouls / g::numeric, 3) AS fouls_g
  FROM m_basketball_cumulative_stats
  WHERE g > 0;
  
ALTER VIEW m_basketball_advanced_stats OWNER TO miners;

COMMENT ON VIEW m_basketball_advanced_stats IS 'NCAA mens basketball averages per game';

DROP VIEW IF EXISTS m_soccer_advanced_stats;

CREATE VIEW m_soccer_advanced_stats AS
  SELECT player_id, g, round(goals / g::numeric, 3) AS goals_g, round(assists / g::numeric, 3) AS assists_g,
                       round(shatt / g::numeric, 3) AS shatt_g, round(sog / g::numeric, 3) AS sog_g, round(fouls / g::numeric, 3) AS fouls_g,
                       round(red_cards / g::numeric, 3) AS red_cards_g, round(yellow_cards / g::numeric, 3) AS yellow_cards_g,
                       round(gc / g::numeric, 3) AS gc_g, round(goalie_gp / g::numeric, 3) AS goalie_gp_g, round(ggs / g::numeric, 3) AS ggs_g,
                       round(ga / g::numeric, 3) AS ga_g, round(saves / g::numeric, 3) AS saves_g, round(shutouts / g::numeric, 3) AS shutouts_g,
                       round(g_wins / g::numeric, 3) AS g_wins_g, round(g_loss / g::numeric, 3) AS g_loss_g,
                       round(dsaves / g::numeric, 3) AS dsaves_g, round(corners / g::numeric, 3) AS corners_g, round(gwg / g::numeric, 3) AS gwg_g
  FROM m_soccer_cumulative_stats
  WHERE g > 0;

ALTER VIEW m_soccer_advanced_stats OWNER TO miners;

COMMENT ON VIEW m_soccer_advanced_stats IS 'NCAA mens soccer averages per game';

DROP VIEW IF EXISTS w_basketball_advanced_stats;

CREATE VIEW w_basketball_advanced_stats AS
  SELECT player_id, g, round(fgm / g::numeric, 3) AS fgm_g, round(fga / g::numeric, 3) AS fga_g,
                       round(three_fg / g::numeric, 3) AS three_fg_g, round(three_fga / g::numeric, 3) AS three_fga_g,
                       round(ft / g::numeric, 3) AS ft_g, round(fta / g::numeric, 3) AS fta_g, round(pts / g::numeric, 3) AS pts_g,
                       round(orebs / g::numeric, 3) AS orebs_g, round(drebs / g::numeric, 3) AS drebs_g, round(tot_reb / g::numeric, 3) AS tot_reb_g,
                       round(ast / g::numeric, 3) AS ast_g, round(turn / g::numeric, 3) AS turn_g, round(stl / g::numeric, 3) AS stl_g,
                       round(blk / g::numeric, 3) AS blk_g, round(pf / g::numeric, 3) AS pf_g
  FROM w_basketball_cumulative_stats
  WHERE g > 0;

ALTER VIEW w_basketball_advanced_stats OWNER TO miners;

COMMENT ON VIEW w_basketball_advanced_stats IS 'NCAA womens basketball averages per game';

DROP VIEW IF EXISTS w_field_hockey_advanced_stats;

CREATE VIEW w_field_hockey_advanced_stats AS
  SELECT player_id, g, round(goals / g::numeric, 3) AS goals_g, round(ast / g::numeric, 3) AS ast_g,
                       round(shatt / g::numeric, 3) AS shatt_g, sog, round(fouls / g::numeric, 3) AS fouls_g,
                       round(rc / g::numeric, 3) AS rc_g, round(yc / g::numeric, 3) AS yc_g,
                       round(gc / g::numeric, 3) AS gc_g, round(ggp / g::numeric, 3) AS ggp_g,
                       round(ggs / g::numeric, 3) AS ggs_g, round(ga / g::numeric, 3) AS ga_g,
                       round(sv / g::numeric, 3) AS sv_g, round(sho / g::numeric, 3) AS sho_g,
                       round(g_wins / g::numeric, 3) AS g_wins_g, round(g_loss / g::numeric, 3) AS g_loss_g,
                       round(dsv / g::numeric, 3) AS dsv_g, round(corners / g::numeric, 3) AS corners_g
  FROM w_field_hockey_cumulative_stats
  WHERE g > 0;

ALTER VIEW w_field_hockey_advanced_stats OWNER TO miners;

COMMENT ON VIEW m_baseball_advanced_stats IS 'NCAA field hockey averages per game';

DROP VIEW IF EXISTS w_lacrosse_advanced_stats;

CREATE VIEW w_lacrosse_advanced_stats AS
  SELECT player_id, g, round(fouls / g::numeric, 3) AS fouls_g, round(goals / g::numeric, 3) AS goals_g,
                       round(assists / g::numeric, 3) AS assists_g, round(points / g::numeric, 3) AS points_g,
                       round(shots / g::numeric, 3) AS shots_g, sog, round(ground_balls / g::numeric, 3) AS ground_balls_g,
                       round(ct / g::numeric, 3) AS ct_g, round(goals_allowed / g::numeric, 3) AS goals_allowed_g,
                       round(saves / g::numeric, 3) AS saves_g, round(w / g::numeric, 3) AS w_g,
                       round(l / g::numeric, 3) AS l_g, round(rc / g::numeric, 3) AS rc_g, round(yc / g::numeric, 3) AS yc_g,
                       round(draw_controls / g::numeric, 3) AS draw_controls_g
  FROM w_lacrosse_cumulative_stats
  WHERE g > 0;

ALTER VIEW w_lacrosse_advanced_stats OWNER TO miners;

COMMENT ON VIEW w_lacrosse_advanced_stats IS 'NCAA womens lacrosse averages per game';

DROP VIEW IF EXISTS w_softball_advanced_stats;

CREATE VIEW w_softball_advanced_stats AS
  SELECT player_id, g, round(ab / g::numeric, 3) AS ab_g, round(r / g::numeric, 3) AS r_g, round(h / g::numeric, 3) AS h_g,
                       round(doubles / g::numeric, 3) AS doubles_g, round(triples / g::numeric, 3) AS triples_g,
                       round(tb / g::numeric, 3) AS tb_g, round(hr / g::numeric, 3) AS hr_g, round(ibb / g::numeric, 3) AS ibb_g,
                       round(bb / g::numeric, 3) AS bb_g, round(hbp / g::numeric, 3) AS hbp_g, round(rbi / g::numeric, 3) AS rbi_g,
                       round(sf / g::numeric, 3) AS sf_g, round(sh / g::numeric, 3) AS sh_g, round(k / g::numeric, 3) AS k_g,
                       round(kl / g::numeric, 3) AS kl_g, round(dp / g::numeric, 3) AS dp_g, round(gdp / g::numeric, 3) AS gdp_g,
                       round(tp / g::numeric, 3) AS tp_g, round(sb / g::numeric, 3) AS sb_g, round(cs / g::numeric, 3) AS cs_g,
                       round(picked / g::numeric, 3) AS picked_g, round(go / g::numeric, 3) AS go_g, round(fo / g::numeric, 3) AS fo_g,
                       round(app / g::numeric, 3) AS app_g, round(gs / g::numeric, 3) AS gs_g, round(ip / g::numeric, 3) AS ip_g,
                       round(ha / g::numeric, 3) AS ha_g, round(ra / g::numeric, 3) AS ra_g, round(er / g::numeric, 3) AS er_g,
                       round(bb_a / g::numeric, 3) AS bb_a_g, round(so / g::numeric, 3) AS so_g, round(sho / g::numeric, 3) AS sho_g,
                       round(bf / g::numeric, 3) AS bf_g, round(p_oab / g::numeric, 3) AS p_oab_g, round(doubles_a / g::numeric, 3) AS doubles_a_g,
                       round(triples_a / g::numeric, 3) AS triples_a_g, round(hr_a / g::numeric, 3) AS hr_a_g, round(cso / g::numeric, 3) AS cso_g,
                       round(wp / g::numeric, 3) AS wp_g, round(bk / g::numeric, 3) AS bk_g, round(hb / g::numeric, 3) AS hb_g,
                       round(sol / g::numeric, 3) AS sol_g, round(ibb_a / g::numeric, 3) AS ibb_a_g, cg, round(inh_run / g::numeric, 3) AS inh_run_g,
                       round(inh_run_score / g::numeric, 3) AS inh_run_score_g, round(sha / g::numeric, 3) AS sha_g, round(sfa / g::numeric, 3) AS sfa_g,
                       round(cia / g::numeric, 3) AS cia_g, round(pitches / g::numeric, 3) AS pitches_g, round(go_a / g::numeric, 3) AS go_a_g,
                       round(fo_a / g::numeric, 3) AS fo_a_g, round(w / g::numeric, 3) AS w_g, round(l / g::numeric, 3) AS l_g,
                       round(sv / g::numeric, 3) AS sv_g, round(po / g::numeric, 3) AS po_g, round(a / g::numeric, 3) AS a_g,
                       round(e / g::numeric, 3) AS e_g, round(ci / g::numeric, 3) AS ci_g, round(pb / g::numeric, 3) AS pb_g,
                       round(sba / g::numeric, 3) AS sba_g, round(csb / g::numeric, 3) AS csb_g, round(tc / g::numeric, 3) AS tc_g,
                       round(idp / g::numeric, 3) AS idp_g, round(itp / g::numeric, 3) AS itp_g
  FROM w_softball_cumulative_stats
  WHERE g > 0;

ALTER VIEW w_softball_advanced_stats OWNER TO miners;

COMMENT ON VIEW w_softball_advanced_stats IS 'NCAA softball averages per game';

DROP VIEW IF EXISTS w_soccer_advanced_stats;

CREATE VIEW w_soccer_advanced_stats AS
  SELECT player_id, g, round(goals / g::numeric, 3) AS goals_g, round(assists / g::numeric, 3) AS assists_g, round(shatt / g::numeric, 3) AS shatt_g,
                       round(sog / g::numeric, 3) AS sog_g, round(fouls / g::numeric, 3) AS fouls_g, round(red_cards / g::numeric, 3) AS red_cards_g,
                       round(yellow_cards / g::numeric, 3) AS yellow_cards_g, round(gc / g::numeric, 3) AS gc_g,
                       round(goal_app / g::numeric, 3) AS goal_app_g, round(ggs / g::numeric, 3) AS ggs_g,
                       round(ga / g::numeric, 3) AS ga_g, round(saves / g::numeric, 3) AS saves_g, round(shutouts / g::numeric, 3) AS shutouts_g,
                       round(g_wins / g::numeric, 3) AS g_wins_g, round(g_loss / g::numeric, 3) AS g_loss_g, round(dsaves / g::numeric, 3) AS dsaves_g,
                       round(corners / g::numeric, 3) AS corners_g
  FROM w_soccer_cumulative_stats
  WHERE g > 0;

ALTER VIEW w_soccer_advanced_stats OWNER TO miners;

COMMENT ON VIEW w_soccer_advanced_stats IS 'NCAA womens soccer averages per game';

DROP VIEW IF EXISTS w_volleyball_advanced_stats;

CREATE VIEW w_volleyball_advanced_stats AS
  SELECT player_id, g, round(s / g::numeric, 3) AS s_g, round(mp / g::numeric, 3) AS mp_g, round(ms / g::numeric, 3) AS ms_g,
                       round(kills / g::numeric, 3) AS kills_g, round(errors / g::numeric, 3) AS errors_g,
                       round(total_attacks / g::numeric, 3) AS total_attacks_g, round(hit_pct::numeric, 3) AS hit_pct_g,
                       round(assists / g::numeric, 3) AS assists_g, round(aces / g::numeric, 3) AS aces_g,
                       round(serr / g::numeric, 3) AS serr_g, round(digs / g::numeric, 3) AS digs_g, round(rerr / g::numeric, 3) AS rerr_g,
                       round(block_solos / g::numeric, 3) AS block_solos_g, round(block_assists / g::numeric, 3) AS block_assists_g,
                       round(berr / g::numeric, 3) AS berr_g, round(pts::numeric / g::numeric, 3) AS pts_g, round(bhe / g::numeric, 3) AS bhe_g
  FROM w_volleyball_cumulative_stats
  WHERE g > 0;

ALTER VIEW w_volleyball_advanced_stats OWNER TO miners;

COMMENT ON VIEW w_volleyball_advanced_stats IS 'NCAA womens volleyball averages per game';