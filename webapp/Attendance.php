<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Attendance
 *
 * @author elmorema
 */
class Attendance {

    public static function beginAttendGraph($univ = '', $year = '') {
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
        echo '<input type="submit" name="submitAttendance" value="Submit" />';
        echo '</form>';
    }

    public static function attendGraph($university = '', $year = '') {
        if ($university === '' || $year === '' || $university === NULL || $year === NULL) {
            ?>
            <script type="text/javascript">
                alert("Please enter a valid university and year");
                window.location.href = "/?Attendance";
            </script>
            <?php
        }
        $univ = $university;
        $year = $year;
        Attendance::beginAttendGraph($university, $year);
        $attendanceResult = Functions::uni_sport_attendance($univ, (int) $year);
        $googleChart = array();
        while ($row = pg_fetch_row($attendanceResult)) {
            $googleChart[] = $row;
        }
        ?>
        <script type="text/javascript">
            var attendanceChart = <?php echo json_encode($googleChart); ?>;
            for (var i = 0; i < attendanceChart.length; i++) {
                attendanceChart[i][1] = parseInt(attendanceChart[i][1]);
            }
        </script>

        <?php
        echo '<br>';
        echo '<h3>Attendance count for each sport at ' . $univ . ', ' . $year . '</h3>';
        echo '<br>';
        ?>

        <table border="1" cellpadding="3" id="attendanceTable" bgcolor="#FFFFFF">
            <tr>
                <th>Sport</th>
                <th>Total Attendance</th>
                <td rowspan="12">
                    <div id="attendancePiechart" style="width: 500px; height: 300px;"></div>
                    <div id="attendanceColumnchart" style="width: 750px; height: 500px;"></div>
                </td>
            </tr>
            <script type="text/javascript">
                var table = document.getElementById("attendanceTable");
                for (var i = 0; i < attendanceChart.length; i++) {
                    // Create an empty <tr> element and add it to the table:
                    var row = table.insertRow(i + 1);

                    // Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);

                    // Add some text to the new cells:
                    cell1.innerHTML = attendanceChart[i][0];
                    cell2.innerHTML = attendanceChart[i][1];
                }
            </script>
        </table>

        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                attendanceChart.unshift(["Sport", "Total Attendance"]);
                var data = google.visualization.arrayToDataTable(attendanceChart);

                var options = {
                    chartArea: {width: '90%', height: '90%'},
                    title: 'Attendance by Sport'
                };

                var chart = new google.visualization.PieChart(document.getElementById('attendancePiechart'));

                chart.draw(data, options);
            }
        </script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['bar']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable(attendanceChart);

                var options = {
                    chart: {
                    }
                };

                var chart = new google.charts.Bar(document.getElementById('attendanceColumnchart'));

                chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        </script>
        <?php
    }

}
