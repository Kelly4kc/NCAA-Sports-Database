<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Conference
 *
 * @author elmorema
 */
class Conference {

    public static function beginConfers($conference = '', $year = '') {
        echo '<form action="#" method="get">';
        echo '<div class="styled-select slate">';
        echo '<select name="conference" class="select-style">'; // Open your drop down box
        if($conference == '') {
            echo '<option value=""hidden >Select a conference</option>';
        }
        else {
            echo '<option selected>' . $conference . '</option>';
        }
        $con = Database::open();
        $sql = 'SELECT conference_name FROM conference ORDER BY conference_name';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", [])
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        while ($row = pg_fetch_row($rs)) {
            echo '<option value="' . $row[0] . '">' . $row[0] . '</option>';
        }
        echo '</select>';
        echo '</div>';
        echo '<div class="styled-select slate">';
        echo '<select name="year" class="select-style">'; // Open your drop down box
        if($year == '') {
            echo '<option value=""hidden >Select a year</option>';
        }
        else {
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
        echo '<input type="submit" name="submitConference" value="Submit" />';
        echo '</form>';
    }

    public static function confers($conference, $year) {
        if ($conference === '' || $year === '' || $conference === NULL || $year === NULL) {
            ?>
            <script type="text/javascript">
                alert("Please enter a valid conference and year");
                window.location.href = "/?Conference";
            </script>
            <?php
        }
        $selected_val = $conference;
        $year = $year;
        Conference::beginConfers($conference, $year);
        echo '<center><br>';
        echo '<h3>Universities in the ' . $selected_val . ', ' . $year . '</h3>';
        $univs = Functions::uni_conference($selected_val, (int) $year);
        echo '<table border="1" cellpadding="2" id="' . $selected_val . 'table" class="zui-table">';
        echo '<tr>';
        echo '<th>Name</th>';
        echo '</tr>';
        while ($row = pg_fetch_row($univs)) {
            echo '<tr>';
            echo '<td>' . $row[0] . '</td>';
            echo "<td><a href='?university=" . $row[0] . "&year=" . $_GET['year'] . "&submitAttendance=Submit#'><center>Attendance</center></a></td>";
            echo "<td><a href='?university=" . $row[0] . "&year=" . $_GET['year'] . "&submitPlayers=Submit#'><center>Players</center></a></td>";

            echo '</tr>';
        }
        echo '</table>';
    }

}
