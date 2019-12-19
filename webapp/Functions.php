<?php

class Functions {

    public function __construct() {
        $con = Database::open();
        pg_close($con);
    }

    public static function schedule($university, $sport, $year) {
        $con = Database::open();
        $sql = 'SELECT * FROM schedule($1, $2, $3) ORDER BY dat';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array($university, $sport, $year))
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function uni_conference($conference, $year) {
        $con = Database::open();
        $sql = 'SELECT * FROM uni_conference($1, $2)';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array($conference, $year))
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function uni_players($university, $year, $sport) {
        $con = Database::open();
        //$sql = 'SELECT sport, count(sport) as c FROM uni_players($1, $2) GROUP BY sport ORDER BY count(sport) DESC';
        $sql = 'SELECT player, class FROM uni_players($1, $2) WHERE sport = $3 ORDER BY player ASC';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array($university, $year, $sport))
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function uni_sport($university, $year) {
        $con = Database::open();
        $sql = 'SELECT sport FROM uni_sports($1, $2)';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array($university, $year))
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function uni_sport_attendance($university, $year) {
        $con = Database::open();
        $sql = 'SELECT sport, attendance FROM uni_sport_attendance($1, $2) ORDER BY attendance DESC, sport';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array($university, $year))
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function schools() {
        $con = Database::open();
        $sql = 'SELECT university_name FROM university ORDER BY university_name ASC';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array())
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function cumulativeStatistics($university, $year, $sport) {
        $sport_string = Functions::sportToSportString($sport);
        $con = Database::open();
        $sql = 'SELECT * FROM ' . $sport_string . '_cumulative_stats($2, $1)';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array($university, $year))
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function selectAllSports() {
        $con = Database::open();
        $sql = 'SELECT sport_name FROM sport ORDER BY sport_name';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", [])
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function selectAllYears() {
        $con = Database::open();
        $sql = 'SELECT DISTINCT year FROM team ORDER BY year';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", [])
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function getTableHeaders($table_name) {
        $con = Database::open();
        $sql = 'SELECT column_name FROM information_schema.columns WHERE table_schema ='
                . "'public' AND table_name = $1";
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array($table_name))
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function sportToSportString($sport) {
        switch ($sport) {
            case "Baseball":
                $sport_string = "m_baseball";
                break;
            case "Football":
                $sport_string = "m_football";
                break;
            case "Men's Basketball":
                $sport_string = "m_basketball";
                break;
            case "Men's Ice Hockey":
                $sport_string = "m_ice_hockey";
                break;
            case "Men's Lacrosse":
                $sport_string = "m_lacrosse";
                break;
            case "Men's Soccer":
                $sport_string = "m_soccer";
                break;
            case "Men's Volleyball":
                $sport_string = "m_volleyball";
                break;
            case "Women's Basketball":
                $sport_string = "w_basketball";
                break;
            case "Women's Field Hockey":
                $sport_string = "w_field_hockey";
                break;
            case "Women's Ice Hockey":
                $sport_string = "w_ice_hockey";
                break;
            case "Women's Lacrosse":
                $sport_string = "w_lacrosse";
                break;
            case "Women's Soccer":
                $sport_string = "w_soccer";
                break;
            case "Women's Softball":
                $sport_string = "w_softball";
                break;
            case "Women's Volleyball":
                $sport_string = "w_volleyball";
                break;
        }
        return $sport_string;
    }
    public static function sportToSportScoreString($sport) {
        $sport_string = '';
        switch ($sport) {
            case "Baseball":
                $sport_string = "game_team_scoring_m_baseball";
                break;
            case "Football":
                $sport_string = "game_team_scoring_m_football";
                break;
            case "Men's Basketball":
                $sport_string = "game_team_scoring_m_basketball";
                break;
            case "Men's Ice Hockey":
                $sport_string = "game_team_scoring_m_ice_hockey";
                break;
            case "Men's Lacrosse":
                $sport_string = "game_team_scoring_m_lacrosse";
                break;
            case "Men's Soccer":
                $sport_string = "game_team_scoring_m_soccer";
                break;
            case "Men's Volleyball":
                $sport_string = "game_team_scoring_m_volleyball";
                break;
            case "Women's Basketball":
                $sport_string = "game_team_scoring_w_basketball";
                break;
            case "Women's Field Hockey":
                $sport_string = "game_team_scoring_w_field_hockey";
                break;
            case "Women's Ice Hockey":
                $sport_string = "game_team_scoring_w_ice_hockey";
                break;
            case "Women's Lacrosse":
                $sport_string = "game_team_scoring_w_lacrosse";
                break;
            case "Women's Soccer":
                $sport_string = "game_team_scoring_w_soccer";
                break;
            case "Women's Softball":
                $sport_string = "game_team_scoring_w_softball";
                break;
            case "Women's Volleyball":
                $sport_string = "game_team_scoring_w_volleyball";
                break;
        }
        return $sport_string;
    }
    
    public static function sportToSportWinPCTFunctionName($sport) {
        $sport_string = '';
        switch ($sport) {
            case "Baseball":
                $sport_string = "all_m_baseball_winning_pcts";
                break;
            case "Football":
                $sport_string = "all_m_football_winning_pcts";
                break;
            case "Men's Basketball":
                $sport_string = "all_m_basketball_winning_pcts";
                break;
            case "Men's Ice Hockey":
                $sport_string = "all_m_ice_hockey_winning_pcts";
                break;
            case "Men's Lacrosse":
                $sport_string = "all_m_lacrosse_winning_pcts";
                break;
            case "Men's Soccer":
                $sport_string = "all_m_soccer_winning_pcts";
                break;
            case "Men's Volleyball":
                $sport_string = "all_m_volleyball_winning_pcts";
                break;
            case "Women's Basketball":
                $sport_string = "all_w_basketball_winning_pcts";
                break;
            case "Women's Field Hockey":
                $sport_string = "all_w_field_hockey_winning_pcts";
                break;
            case "Women's Ice Hockey":
                $sport_string = "all_w_ice_hockey_winning_pcts";
                break;
            case "Women's Lacrosse":
                $sport_string = "all_w_lacrosse_winning_pcts";
                break;
            case "Women's Soccer":
                $sport_string = "all_w_soccer_winning_pcts";
                break;
            case "Women's Softball":
                $sport_string = "all_w_softball_winning_pcts";
                break;
            case "Women's Volleyball":
                $sport_string = "all_w_volleyball_winning_pcts";
                break;
        }
        return $sport_string;
    }

    public static function winningPercentageConference($sport) {
        $con = Database::open();
        $sql = 'SELECT *
FROM (SELECT c.conference_name, wins.university_name, ROUND(wins.win*1.0/(1.0*total.total), 2) AS percent, RANK() OVER (
            PARTITION BY c.conference_id
            ORDER BY ROUND(wins.win*1.0/(1.0*total.total), 2)DESC, wins.university_name)  win_rank
                FROM (
                SELECT u.university_name, t.year, t.conference_id, COUNT(*) AS win
                FROM '. $sport . ' AS m
                JOIN '. $sport . ' AS b ON m.game_id = b.game_id
                JOIN team AS t ON t.team_id = m.team_id
                JOIN team AS s ON s.team_id = b.team_id
                JOIN university AS u ON u.university_id = t.university_id
                JOIN university AS u2 ON u2.university_id = s.university_id
                WHERE m.team_id != b.team_id AND t.year = 2017 AND m.score > b.score
                GROUP BY u.university_name, t.year, t.conference_id) AS wins
                JOIN (SELECT u.university_name, t.year, COUNT(*) AS total
                FROM '. $sport . ' AS m
                JOIN '. $sport . ' AS b ON m.game_id = b.game_id
                JOIN team AS t ON t.team_id = m.team_id
                JOIN team AS s ON s.team_id = b.team_id
                JOIN university AS u ON u.university_id = t.university_id
                JOIN university AS u2 ON u2.university_id = s.university_id
                WHERE m.team_id != b.team_id AND t.year = 2017
                GROUP BY u.university_name, t.year) AS total ON total.university_name = wins.university_name
                JOIN conference AS c ON wins.conference_id = c.conference_id
                WHERE wins.university_name = total.university_name
                ORDER BY c.conference_name, percent DESC) winners
		WHERE winners.win_rank <= 3';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array())
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

    public static function winningPercentageSingle($year, $sport, $university) {
        $con = Database::open();
        $function = Functions::sportToSportWinPCTFunctionName($sport);
        $sql = 'SELECT * FROM ' . $function .'($1, $2)';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array($university, $year))
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        return $rs;
    }

}
