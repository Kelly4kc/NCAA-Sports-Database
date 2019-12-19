<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of WinPercentage
 *
 * @author miners
 */
class WinPercentage {

    public function showWinning() {
        ?>
        <div class="sidenav">
            <a href="?Baseball">Baseball</a>
            <a href="?Basketball">Basketball</a>
            <a href="?Soccer">Soccer</a>
        </div>
        <?php
    }

    public function WinMultiple($sport) {
        WinPercentage::showWinning();
        $univs = Functions::winningPercentageConference($sport);
        $row = '';
        if ($sport == "game_team_scoring_m_baseball" || $sport == "game_team_scoring_m_basketball" || $sport == "game_team_scoring_m_soccer") {
            echo '<center><h2>Men</h2></center>';
        }
        echo '<div id="tbl_divwin">';
        $rowcounter = 0;
        while ($temp = pg_fetch_row($univs)) {
            if ($temp[0] == $row) {
                echo '<tr>';
                echo '<td>' . $temp[1] . '</td>';
                echo '<td>' . $temp[2] . '</td>';
                echo '</tr>';
            } else {
                $row = $temp[0];
                $rowcounter++;
                echo '<table  border="1" cellpadding="2" id="' . $temp[0] . 'table" class="zui-tablewin">';
                echo '<caption><h4>' . $temp[0] . '</h4></caption>';
                echo '<tr>';
                echo '<th>University</th>';
                echo '<th>Winning Percentage</th>';
                echo '</tr>';
                echo '<tr>';
                echo '<td>' . $temp[1] . '</td>';
                echo '<td>' . $temp[2] . '</td>';
                echo '</tr>';
            }
        }
        echo '</table>';
        echo '</div>';
        if ($sport == "game_team_scoring_m_baseball" || $sport == "game_team_scoring_m_basketball" || $sport == "game_team_scoring_m_soccer") {
            echo '<div id="line"><hr  style="" /><center><h2>Women</h2></center></div>';
            echo '<br>';
            echo '<br>';
        }
    }

    public function WinSingle($opponent, $year, $sport) {

        $univs = Functions::winningPercentageSingle($year, $sport, $opponent);
        $percent = pg_fetch_row($univs);
        return $percent[2];
    }

}
