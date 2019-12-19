<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Requests
 *
 * @author miners
 */
class Requests {

    Public Function showRequests() {
        ?>
        <!DOCTYPE html>
        <html>
            <head>
                <meta charset="UTF-8">
                <title>Requests</title>
            </head>

            <body>
                <h2> Requests </h2>
                <form>
                    <?php
                    $con = Database::open();
                    $sql = 'SELECT * FROM Requests';
                    pg_prepare($con, "", $sql);
                    $rs = pg_execute($con, "", array());
                    pg_close($con);
                    echo "<center><h4>These are all of the Requests that have been submitted to our team.<br>"
                    . " The 'Done?' column is letting the users know if our team has reviewed the request or not </h4><br>";
                    echo "<table class='fixed_header' border='1'";
                    echo "<tr><th border=1>University</th><th>Year</th><th>Sport</th><th>Done?</th></tr>";
                    while ($row = pg_fetch_array($rs, null, PGSQL_ASSOC)) {
                        echo "\n\t<tr>\n";
                        foreach ($row as $col) {
                            echo "<td><center>$col</center></td>\n";
                        }
                    }
                    echo"</center>"
                    ?>



                </form>
            </body>
        </html>
        <?php
    }

}
