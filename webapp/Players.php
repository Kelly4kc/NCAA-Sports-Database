<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Players
 *
 * @author elmorema
 */
class Players {

    public static function beginPlays($univ = '', $year = '') {
        echo '<form action="#" method="get">';
        echo '<input type="text" name="university" list = "schools" id="chooseSchool" value="' . $univ . '" placeholder="Please enter a university">';
        echo '<datalist id = "schools">';
        $schoolResult = Functions::schools();
        while ($row = pg_fetch_row($schoolResult)) {
            echo '<option value = "' . $row[0] . '">';
        }
        echo '</datalist>';
        echo '<div class="styled-select slate">';
        echo '<select name="year" class="select-style">'; // Open your drop down box
        if ($year == '') {
            echo '<option value=""hidden >Select a year</option>';
        } else {
            echo '<option selected>' . $year . '</option>';
        }
        $con = Database::open();
        $sql = 'SELECT DISTINCT year FROM team ORDER BY year';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", [])
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        while ($row = pg_fetch_row($rs)) {
            echo '<option value="' . $row[0] . '">' . $row[0] . '</option>';
        }
        echo '</select>'; // Close your drop down box
        echo '</div>';
        echo '<input type="submit" name="submitPlayers" value="Submit" />';
        echo '</form>';
    }

    public static function plays($university, $year) {
        if ($university === '' || $year === '' || $university === NULL || $year === NULL) {
            ?>
            <script type="text/javascript">
                alert("Please enter a valid university and year");
                window.location.href = "/?Players";
            </script>
            <?php
        }
        $univ = $university;
        $year = $year;
        Players::beginPlays($university, $year);
        echo '<br>';
        echo '<center><h2>Players for each sport at ' . $univ . ', ' . $year . '</h2></center>';
        echo '<br>';
        $sports = Functions::uni_sport($univ, (int) $year);
        $divCounter = 1;
        $tables = [];
        echo '<div id="tbl_div">';
        while ($row = pg_fetch_row($sports)) {
            $players = Functions::uni_players($univ, (int) $year, $row[0]);
            echo '<div id="' . $divCounter . '">';
            echo '<table  border="1" cellpadding="2" id="' . $row[0] . 'table" class="fixed_header">';
            echo '<caption>' . $row[0] . '</caption>';
            echo '<tr>';
            echo '<th>Name</th>';
            echo '<th>Class</th>';
            echo '</tr>';

            $divCounter++;
            array_push($tables, $row[0]);

            while ($row2 = pg_fetch_row($players)) {
                if ($row2[0] == 'Team') {
                    continue;
                }
                echo '<tr>';
                echo '<td>' . $row2[0] . '</td>';
                echo '<td>' . $row2[1] . '</td>';
                echo '</tr>';
            }
            echo '</table>';
            echo '</div>';
        }
        echo '</div>';
        $currentDiv = 1;
        echo '<div class="centered">';
        echo '<div class="styled-select slate">';
        echo '<select class="select-style" onchange="change_tbl(this.value)">';
        echo '<option value="">Select a sport</option>';
        foreach ($tables as $value) {
            echo '<option value="' . $currentDiv . '">' . $value . '</option>';
            $currentDiv++;
        }
        echo '</select>';
        echo '</div>';
        echo '</div>';
        ?>

        <script type="text/javascript">
            function change_tbl(dhi) {
                if (dhi === '') {
                    return;
                }
                $('#tbl_div > div').css('display', 'none');
                $('#' + dhi).css('display', 'block');
            }
        </script>
        <?php
    }

}
