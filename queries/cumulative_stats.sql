DROP FUNCTION IF EXISTS public.m_baseball_cumulative_stats(integer, character varying);

CREATE FUNCTION public.m_baseball_cumulative_stats(
    year integer,
    university character varying
    )
    RETURNS TABLE(player_name character varying, g bigint, r bigint, ab bigint, h bigint, doubles bigint,
        triples bigint, tb bigint, hr bigint, rbi bigint, bb bigint, hbp bigint,
        sf bigint, sh bigint, k bigint, dp bigint, cs bigint, picked bigint,
        sb bigint, rbi2out bigint, app bigint, gs bigint,
        ip numeric, cg bigint, h_a bigint,
        r_a bigint, er bigint, bb_a bigint, so bigint, sho bigint, bf bigint,
        p_oab bigint, doubles_a bigint, triples_a bigint, bk bigint,
        hr_a bigint, wp bigint, hb bigint, ibb bigint, inh_run bigint,
        inh_run_score bigint, sha bigint, sfa bigint, pitches bigint,
        go bigint, fo bigint, w bigint, l bigint, sv bigint, kl bigint, po bigint,
        tc bigint, a bigint, e bigint, ci bigint, pb bigint, sba bigint, csb bigint,
        idp bigint, tp bigint)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT player_name, count(*) AS g, sum(r) AS r, sum(ab) AS ab, sum(h) AS h, sum(doubles) AS doubles,
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
    FROM game_stats_m_baseball AS g
    	JOIN game_info AS gi ON g.game_id = gi.game_id
      JOIN team AS at ON gi.away_team_id = at.team_id
      JOIN team AS ht ON gi.home_team_id = ht.team_id
      JOIN university AS au ON at.university_id = au.university_id
      JOIN university AS hu ON ht.university_id = hu.university_id
      JOIN player AS p ON g.player_id = p.player_id
      JOIN roster AS r ON r.player_id = p.player_id AND (at.team_id = r.team_id OR ht.team_id = r.team_id)
      JOIN team AS rt ON rt.team_id = r.team_id
      JOIN university AS ru ON ru.university_id = rt.university_id
    WHERE ((at.year = $1 AND au.university_name = $2)
    	OR (ht.year = $1 AND hu.university_name = $2))
      AND ru.university_name = $2
    GROUP BY p.player_id, p.player_name
    ORDER BY player_name
$BODY$;

ALTER FUNCTION public.m_baseball_cumulative_stats(integer, character varying)
    OWNER TO miners;
    
DROP FUNCTION IF EXISTS public.m_basketball_cumulative_stats(integer, character varying);

CREATE FUNCTION public.m_basketball_cumulative_stats(
    year integer,
    university character varying
    )
    RETURNS TABLE(player_name character varying, g bigint, fgm bigint, fga bigint, three_fg bigint,
      three_fga bigint, ft bigint, fta bigint, pts bigint, orebs bigint,
      drebs bigint, tot_reb bigint, ast bigint, turn bigint, stl bigint,
      blk bigint, fouls bigint)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT player_name, count(*) AS g, sum(fgm) AS fgm, sum(fga) AS fga, sum(three_fg) AS three_fg,
      sum(three_fga) AS three_fga, sum(ft) AS ft, sum(fta) AS fta, sum(pts) AS pts, sum(orebs) AS orebs,
      sum(drebs) AS drebs, sum(tot_reb) AS tot_reb, sum(ast) AS ast, sum(turn) AS turn, sum(stl) AS stl,
      sum(blk) AS blk, sum(fouls) AS fouls
  FROM game_stats_m_basketball AS g
    	JOIN game_info AS gi ON g.game_id = gi.game_id
      JOIN team AS at ON gi.away_team_id = at.team_id
      JOIN team AS ht ON gi.home_team_id = ht.team_id
      JOIN university AS au ON at.university_id = au.university_id
      JOIN university AS hu ON ht.university_id = hu.university_id
      JOIN player AS p ON g.player_id = p.player_id
      JOIN roster AS r ON r.player_id = p.player_id AND (at.team_id = r.team_id OR ht.team_id = r.team_id)
      JOIN team AS rt ON rt.team_id = r.team_id
      JOIN university AS ru ON ru.university_id = rt.university_id
    WHERE ((at.year = $1 AND au.university_name = $2)
    	OR (ht.year = $1 AND hu.university_name = $2))
      AND ru.university_name = $2
    GROUP BY p.player_id, p.player_name
    ORDER BY player_name
$BODY$;

ALTER FUNCTION public.m_basketball_cumulative_stats(integer, character varying)
    OWNER TO miners;
    
DROP FUNCTION IF EXISTS public.m_soccer_cumulative_stats(integer, character varying);

CREATE FUNCTION public.m_soccer_cumulative_stats(
    year integer,
    university character varying
    )
    RETURNS TABLE(player_name character varying, g bigint, goals bigint, assists bigint, shatt bigint,
      sog bigint, fouls bigint, red_cards bigint, yellow_cards bigint,
      gc bigint, goalie_gp bigint, ggs bigint, ga bigint, saves bigint,
      shutouts bigint, g_wins bigint, g_loss bigint, dsaves bigint,
      corners bigint, gwg bigint)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT player_name, count(*) AS g, sum(goals) AS goals, sum(assists) AS assists, sum(shatt) AS shatt,
      sum(sog) AS sog, sum(fouls) AS fouls, sum(red_cards) AS red_cards, sum(yellow_cards) AS yellow_cards,
      sum(gc) AS gc, sum(goalie_gp) AS goalie_gp, sum(ggs) AS ggs, sum(ga) AS ga, sum(saves) AS saves,
      sum(shutouts) AS shutouts, sum(g_wins) AS g_wins, sum(g_loss) AS g_loss, sum(dsaves) AS dsaves,
      sum(corners) AS corners, sum(gwg) AS gwg
    FROM game_stats_m_soccer AS g
    	JOIN game_info AS gi ON g.game_id = gi.game_id
      JOIN team AS at ON gi.away_team_id = at.team_id
      JOIN team AS ht ON gi.home_team_id = ht.team_id
      JOIN university AS au ON at.university_id = au.university_id
      JOIN university AS hu ON ht.university_id = hu.university_id
      JOIN player AS p ON g.player_id = p.player_id
      JOIN roster AS r ON r.player_id = p.player_id AND (at.team_id = r.team_id OR ht.team_id = r.team_id)
      JOIN team AS rt ON rt.team_id = r.team_id
      JOIN university AS ru ON ru.university_id = rt.university_id
    WHERE ((at.year = $1 AND au.university_name = $2)
    	OR (ht.year = $1 AND hu.university_name = $2))
      AND ru.university_name = $2
    GROUP BY p.player_id, p.player_name
    ORDER BY player_name
$BODY$;

ALTER FUNCTION public.m_soccer_cumulative_stats(integer, character varying)
    OWNER TO miners;
    
DROP FUNCTION IF EXISTS public.w_basketball_cumulative_stats(integer, character varying);

CREATE FUNCTION public.w_basketball_cumulative_stats(
    year integer,
    university character varying
    )
    RETURNS TABLE(player_name character varying, g bigint, fgm bigint, fga bigint, three_fg bigint,
      three_fga bigint, ft bigint, fta bigint, pts bigint, orebs bigint,
      drebs bigint, tot_reb bigint, ast bigint, turn bigint, stl bigint,
      blk bigint, pf bigint)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT player_name, count(*) AS g, sum(fgm) AS fgm, sum(fga) AS fga, sum(three_fg) AS three_fg,
      sum(three_fga) AS three_fga, sum(ft) AS ft, sum(fta) AS fta, sum(pts) AS pts, sum(orebs) AS orebs,
      sum(drebs) AS drebs, sum(tot_reb) AS tot_reb, sum(ast) AS ast, sum(turn) AS turn, sum(stl) AS stl,
      sum(blk) AS blk, sum(pf) AS pf
    FROM game_stats_w_basketball AS g
    	JOIN game_info AS gi ON g.game_id = gi.game_id
      JOIN team AS at ON gi.away_team_id = at.team_id
      JOIN team AS ht ON gi.home_team_id = ht.team_id
      JOIN university AS au ON at.university_id = au.university_id
      JOIN university AS hu ON ht.university_id = hu.university_id
      JOIN player AS p ON g.player_id = p.player_id
      JOIN roster AS r ON r.player_id = p.player_id AND (at.team_id = r.team_id OR ht.team_id = r.team_id)
      JOIN team AS rt ON rt.team_id = r.team_id
      JOIN university AS ru ON ru.university_id = rt.university_id
    WHERE ((at.year = $1 AND au.university_name = $2)
    	OR (ht.year = $1 AND hu.university_name = $2))
      AND ru.university_name = $2
    GROUP BY p.player_id, p.player_name
    ORDER BY player_name
$BODY$;

ALTER FUNCTION public.w_basketball_cumulative_stats(integer, character varying)
    OWNER TO miners;
    
DROP FUNCTION IF EXISTS public.w_field_hockey_cumulative_stats(integer, character varying);

CREATE FUNCTION public.w_field_hockey_cumulative_stats(
    year integer,
    university character varying
    )
    RETURNS TABLE(player_name character varying, g bigint, goals bigint, ast bigint, shatt bigint, sog bigint,
      fouls bigint, rc bigint, yc bigint, gc bigint, ggp bigint, ggs bigint, ga bigint,
      sv bigint, sho bigint, g_wins bigint, g_loss bigint, dsv bigint, corners bigint)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT player_name, count(*) AS g, sum(goals) AS goals, sum(ast) AS ast, sum(shatt) AS shatt, sum(sog) AS sog,
      sum(fouls) AS fouls, sum(rc) AS rc, sum(yc) AS yc, sum(gc) AS gc, sum(ggp) AS ggp, sum(ggs) AS ggs, sum(ga) AS ga,
      sum(sv) AS sv, sum(sho) AS sho, sum(g_wins) AS g_wins, sum(g_loss) AS g_loss, sum(dsv) AS dsv, sum(corners) AS corners
    FROM game_stats_w_field_hockey AS g
    	JOIN game_info AS gi ON g.game_id = gi.game_id
      JOIN team AS at ON gi.away_team_id = at.team_id
      JOIN team AS ht ON gi.home_team_id = ht.team_id
      JOIN university AS au ON at.university_id = au.university_id
      JOIN university AS hu ON ht.university_id = hu.university_id
      JOIN player AS p ON g.player_id = p.player_id
      JOIN roster AS r ON r.player_id = p.player_id AND (at.team_id = r.team_id OR ht.team_id = r.team_id)
      JOIN team AS rt ON rt.team_id = r.team_id
      JOIN university AS ru ON ru.university_id = rt.university_id
    WHERE ((at.year = $1 AND au.university_name = $2)
    	OR (ht.year = $1 AND hu.university_name = $2))
      AND ru.university_name = $2
    GROUP BY p.player_id, p.player_name
    ORDER BY player_name
$BODY$;

ALTER FUNCTION public.w_field_hockey_cumulative_stats(integer, character varying)
    OWNER TO miners;
    
DROP FUNCTION IF EXISTS public.w_lacrosse_cumulative_stats(integer, character varying);

CREATE FUNCTION public.w_lacrosse_cumulative_stats(
    year integer,
    university character varying
    )
    RETURNS TABLE(player_name character varying, g bigint, fouls bigint, goals bigint, assists bigint,
      points bigint, shots bigint, sog bigint, ground_balls bigint, ct bigint,
      goals_allowed bigint, saves bigint, w bigint, l bigint, rc bigint, yc bigint,
      draw_controls bigint)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT player_name, count(*) AS g, sum(fouls) AS fouls, sum(goals) AS goals, sum(assists) AS assists,
      sum(points) AS points, sum(shots) AS shots, sum(sog) AS sog, sum(ground_balls) AS ground_balls, sum(ct) AS ct,
      sum(goals_allowed) AS goals_allowed, sum(saves) AS saves, sum(w) AS w, sum(l) AS l, sum(rc) AS rc, sum(yc) AS yc,
      sum(draw_controls) AS draw_controls
    FROM game_stats_w_lacrosse AS g
    	JOIN game_info AS gi ON g.game_id = gi.game_id
      JOIN team AS at ON gi.away_team_id = at.team_id
      JOIN team AS ht ON gi.home_team_id = ht.team_id
      JOIN university AS au ON at.university_id = au.university_id
      JOIN university AS hu ON ht.university_id = hu.university_id
      JOIN player AS p ON g.player_id = p.player_id
      JOIN roster AS r ON r.player_id = p.player_id AND (at.team_id = r.team_id OR ht.team_id = r.team_id)
      JOIN team AS rt ON rt.team_id = r.team_id
      JOIN university AS ru ON ru.university_id = rt.university_id
    WHERE ((at.year = $1 AND au.university_name = $2)
    	OR (ht.year = $1 AND hu.university_name = $2))
      AND ru.university_name = $2
    GROUP BY p.player_id, p.player_name
    ORDER BY player_name
$BODY$;

ALTER FUNCTION public.w_lacrosse_cumulative_stats(integer, character varying)
    OWNER TO miners;
    
DROP FUNCTION IF EXISTS public.w_softball_cumulative_stats(integer, character varying);

CREATE FUNCTION public.w_softball_cumulative_stats(
    year integer,
    university character varying
    )
    RETURNS TABLE(player_name character varying, g bigint, ab bigint, r bigint, h bigint, doubles bigint,
      triples bigint, tb bigint, hr bigint, ibb bigint, bb bigint, hbp bigint,
      rbi bigint, sf bigint, sh bigint, k bigint, kl bigint, dp bigint, gdp bigint,
      tp bigint, sb bigint, cs bigint, picked bigint, go bigint, fo bigint, app bigint,
      gs bigint, ip numeric, ha bigint, ra bigint,
      er bigint, bb_a bigint, so bigint, sho bigint, bf bigint, p_oab bigint,
      doubles_a bigint, triples_a bigint, hr_a bigint, cso bigint, wp bigint, bk bigint,
      hb bigint, sol bigint, ibb_a bigint, cg bigint, inh_run bigint, inh_run_score bigint,
      sha bigint, sfa bigint, cia bigint, pitches bigint, go_a bigint, fo_a bigint, w bigint,
      l bigint, sv bigint, po bigint, a bigint, e bigint, ci bigint, pb bigint, sba bigint, csb bigint,
      tc bigint, idp bigint, itp bigint)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT player_name, count(*) AS g, sum(ab) AS ab, sum(r) AS r, sum(h) AS h, sum(doubles) AS doubles,
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
    FROM game_stats_w_softball AS g
    	JOIN game_info AS gi ON g.game_id = gi.game_id
      JOIN team AS at ON gi.away_team_id = at.team_id
      JOIN team AS ht ON gi.home_team_id = ht.team_id
      JOIN university AS au ON at.university_id = au.university_id
      JOIN university AS hu ON ht.university_id = hu.university_id
      JOIN player AS p ON g.player_id = p.player_id
      JOIN roster AS r ON r.player_id = p.player_id AND (at.team_id = r.team_id OR ht.team_id = r.team_id)
      JOIN team AS rt ON rt.team_id = r.team_id
      JOIN university AS ru ON ru.university_id = rt.university_id
    WHERE ((at.year = $1 AND au.university_name = $2)
    	OR (ht.year = $1 AND hu.university_name = $2))
      AND ru.university_name = $2
    GROUP BY p.player_id, p.player_name
    ORDER BY player_name
$BODY$;

ALTER FUNCTION public.w_softball_cumulative_stats(integer, character varying)
    OWNER TO miners;
    
DROP FUNCTION IF EXISTS public.w_soccer_cumulative_stats(integer, character varying);

CREATE FUNCTION public.w_soccer_cumulative_stats(
    year integer,
    university character varying
    )
    RETURNS TABLE(player_name character varying, g bigint, goals bigint, assists bigint, shatt bigint, sog bigint,
      fouls bigint, red_cards bigint, yellow_cards bigint, gc bigint, goal_app bigint,
      ggs bigint, ga bigint, saves bigint, shutouts bigint, g_wins bigint, g_loss bigint,
      dsaves bigint, corners bigint)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT player_name, count(*) AS g, sum(goals) AS goals, sum(assists) AS assists, sum(shatt) AS shatt, sum(sog) AS sog,
      sum(fouls) AS fouls, sum(red_cards) AS red_cards, sum(yellow_cards) AS yellow_cards, sum(gc) AS gc, sum(goal_app) AS goal_app,
      sum(ggs) AS ggs, sum(ga) AS ga, sum(saves) AS saves, sum(shutouts) AS shutouts, sum(g_wins) AS g_wins, sum(g_loss) AS g_loss,
      sum(dsaves) AS dsaves, sum(corners) AS corners
    FROM game_stats_w_soccer AS g
    	JOIN game_info AS gi ON g.game_id = gi.game_id
      JOIN team AS at ON gi.away_team_id = at.team_id
      JOIN team AS ht ON gi.home_team_id = ht.team_id
      JOIN university AS au ON at.university_id = au.university_id
      JOIN university AS hu ON ht.university_id = hu.university_id
      JOIN player AS p ON g.player_id = p.player_id
      JOIN roster AS r ON r.player_id = p.player_id AND (at.team_id = r.team_id OR ht.team_id = r.team_id)
      JOIN team AS rt ON rt.team_id = r.team_id
      JOIN university AS ru ON ru.university_id = rt.university_id
    WHERE ((at.year = $1 AND au.university_name = $2)
    	OR (ht.year = $1 AND hu.university_name = $2))
      AND ru.university_name = $2
    GROUP BY p.player_id, p.player_name
    ORDER BY player_name
$BODY$;

ALTER FUNCTION public.w_soccer_cumulative_stats(integer, character varying)
    OWNER TO miners;
    
DROP FUNCTION IF EXISTS public.w_volleyball_cumulative_stats(integer, character varying);

CREATE FUNCTION public.w_volleyball_cumulative_stats(
    year integer,
    university character varying
    )
    RETURNS TABLE(player_name character varying, g bigint, s bigint, mp bigint, ms bigint, kills bigint, errors bigint,
      total_attacks bigint, hit_pct numeric, assists bigint, aces bigint, serr bigint,
      digs bigint, rerr bigint, block_solos bigint, block_assists bigint, berr bigint,
      pts real, bhe bigint)
    LANGUAGE 'sql'

    COST 100
    STABLE STRICT 
    ROWS 1000
AS $BODY$
    SELECT player_name, count(*) AS g, sum(s) AS s, sum(mp) AS mp, sum(ms) AS ms, sum(kills) AS kills, sum(errors) AS errors,
      sum(total_attacks) AS total_attacks, round(avg(hit_pct)::numeric, 2) AS hit_pct, sum(assists) AS assists, sum(aces) AS aces, sum(serr) AS serr,
      sum(digs) AS digs, sum(rerr) AS rerr, sum(block_solos) AS block_solos, sum(block_assists) AS block_assists, sum(berr) AS berr,
      sum(pts) AS pts, sum(bhe) AS bhe
    FROM game_stats_w_volleyball AS g
    	JOIN game_info AS gi ON g.game_id = gi.game_id
      JOIN team AS at ON gi.away_team_id = at.team_id
      JOIN team AS ht ON gi.home_team_id = ht.team_id
      JOIN university AS au ON at.university_id = au.university_id
      JOIN university AS hu ON ht.university_id = hu.university_id
      JOIN player AS p ON g.player_id = p.player_id
      JOIN roster AS r ON r.player_id = p.player_id AND (at.team_id = r.team_id OR ht.team_id = r.team_id)
      JOIN team AS rt ON rt.team_id = r.team_id
      JOIN university AS ru ON ru.university_id = rt.university_id
    WHERE ((at.year = $1 AND au.university_name = $2)
    	OR (ht.year = $1 AND hu.university_name = $2))
      AND ru.university_name = $2
    GROUP BY p.player_id, p.player_name
    ORDER BY player_name
$BODY$;

ALTER FUNCTION public.w_volleyball_cumulative_stats(integer, character varying)
    OWNER TO miners;