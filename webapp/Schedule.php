<?php
include "NoSchoolData.php";


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Schedule
 *
 * @author miners
 */
class Schedule {

    public static function beginSchedule($univ = '', $year = '', $sport = '') {
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
        echo '<input type="submit" name="submitSchedule" value="Submit" />';
        echo '</form>';
    }

    public static function sched($university, $year, $sport) {

        if ($university === '' || $year === '' || $sport === '' || $university === NULL || $year === NULL || $sport === NULL) {
            ?>

            <script type="text/javascript">
                alert("Please enter a valid university, year, and sport");
                window.location.href = "/?Schedule";
            </script>
            <?php
        }
        Schedule::beginSchedule($university, $year, $sport);
        ?><html>
            <head>
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                <script type="text/javascript">
            google.charts.load('current', {
                'packages': ['geochart'],
                // Note: you will need to get a mapsApiKey for your project.
                // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
                'mapsApiKey': 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY'
            });
            google.charts.setOnLoadCallback(drawRegionsMap);

            function drawRegionsMap() {
                var data = google.visualization.arrayToDataTable([
                    ['State', 'Number of Games in State']
        <?php
        $schedule = Functions::schedule($university, $sport, (int) $year);
        $stateNum = array();
        $counterIfEmpty = 0;
        while ($row = pg_fetch_row($schedule)) {
            if (isset($stateNum["" . $row[5]]) and $stateNum["" . $row[5]] >= 1) {
                $stateNum["" . $row[5]] = $stateNum["" . $row[5]] + 1;
            } else {
                $stateNum["" . $row[5]] = 1;
            }
            echo ',["' . $row[5] . '", ' . $stateNum["" . $row[5]] . ']';
            if ($row[5] != NULL) {
                $counterIfEmpty = 1;
            }
        }
        ?>
                ]);

                var options = {
                    region: 'US',
                    displayMode: 'regions',
                    resolution: 'provinces',
                };

                var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

                chart.draw(data, options);

            }
                </script>
            </head>
            <body>
                <body>

  </body>
                <?php
                if ($counterIfEmpty == 0) {
                    NoSchoolData::NoData($university, $year, $sport);
                } else {
                    $scheduler = Functions::schedule($university, $sport, (int) $year);
                    echo '<table border="1" style="float:right; position: relative;" cellpadding="2" id="' . $sport . 'table" class="fixed_header"">';
                    echo '<tr>';
                    echo '<th>Opponent</th>';
                    echo '<th>Date</th>';
                    echo '<th>Location</th>';
                    echo '<th>Attendance</th>';
                echo '</tr>';
                    while ($row = pg_fetch_row($scheduler)) {
                        echo '<tr>';
                        echo '<td><div class="tooltip">'.$row[1].'<span class="tooltiptext"><h4>Winning Percentage</h4><br>'.WinPercentage::winSingle($row[1], $year, $sport).'</span>
                        </div></td>';
                        echo '<td>' . $row[2] . '</td>';
                        echo '<td>' . $row[3] . '</td>';
                        echo '<td>' . $row[4] . '</td>';
                        echo '</tr>';
                    }
                    echo '</table>';
                }
                ?>
                <div id="regions_div" style="width: 50%; height: 92%;"></div>

            </body>
        </html>
        <?php
    }

}
?>