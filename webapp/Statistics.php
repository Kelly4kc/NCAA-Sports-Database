<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Page that shows the statistics of players.
 *
 * @author kelly4kc
 */
class Statistics {

    public static function beginStatistics($univ = '', $year = '', $sport = '') {
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
            echo '<option selected value =' . $year . '>' . ((int)($year) - 1) . '-' . $year . '</option>';
        }
        $con = Database::open();
        $sql = 'SELECT DISTINCT year FROM team ORDER BY year';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", [])
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        
        while ($row = pg_fetch_row($rs)) {
            echo '<option value="' . $row[0] . '">' . ((int)($row[0]) - 1) . '-' . $row[0] . '</option>';
        }
        echo '</select>'; // Close your drop down box
        echo '</div>';
        echo '<div class="styled-select slate">';
        echo '<select name="sport" class="select-style">'; // Open your drop down box
        if ($sport == '') {
            echo '<option value=""hidden >Select a sport</option>';
        } else {
            echo '<option selected>' . $sport . '</option>';
        }
                $con = Database::open();
        $sql = 'SELECT sport_name FROM sport ORDER BY sport_name';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", [])
                or die("Query failed: " . pg_last_error());
        pg_close($con);
        while ($row = pg_fetch_row($rs)) {
            if ($row[0] == 'Football') {
                continue;
            }
            echo '<option value="' . $row[0] . '">' . $row[0] . '</option>';
        }
        echo '</select>';
        echo '</div>';
        echo '<input type="submit" name="submitStatistics" value="Submit" />';
        echo '</form>';
    }

    public static function stats($university, $year, $sport) {
        if ($university === '' || $year === '' || $university === NULL || $year === NULL) {
            ?>
            <script type="text/javascript">
                alert("Please enter a valid university and year");
                window.location.href = "/?Statistics";
            </script>
            <?php
        }
        Statistics::beginStatistics($university, $year, $sport);
        echo '<br>';
        echo '<h3>' . $sport . ' Statistics at ' . $university . ' in ' . $year . '</h3>';
        echo '<br>';
        $stats = Functions::cumulativeStatistics($university, $year, $sport);
        echo '<table  border="2" cellpadding="2">';
        $first = true;
        while ($row = pg_fetch_row($stats)) {
            if ($first) {
                $i = 0;
                echo '<tr>';
                while ($i < sizeof($row)) {
                    echo '<th>' . pg_field_name($stats, $i) . '</th>';
                    $i++;
                }
                echo '</tr>';
                $first = false;
            }
            echo '<tr>';
            foreach ($row as $column) {
                echo '<td>' . $column . '</td>';
            }
            echo '</tr>';
        }
        echo '</table>';
        /*$first = true;
        $header = array();
        $data = array();
        while ($row = pg_fetch_row($stats)) {
            if ($first) {
                $i = 0;
                while ($i < sizeof($row)) {
                    $header[] = pg_field_name($stats, $i);
                    $i++;
                }
                $first = false;
            }
            $data[] = $row;
        }
        ?>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages':['table']});
            var data = new google.visualization.DataTable();
            var header = <?php echo json_encode($header); ?>
            for each (var column in header) {
                data.addColumn('string', column);
            }    
            data.addRows(<?php echo json_encode($data); ?>);

            var table = new google.visualization.Table(document.getElementById('table_div'));

            table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
        </script>
        <?php */
    }

}
