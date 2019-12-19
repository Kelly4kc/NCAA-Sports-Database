<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of NoSchoolData
 *
 * @author miners
 */
class NoSchoolData {

    public function NoData($university, $year, $sport) {
        ?>
        <center><b>
                <h1> Our Apologies!</h1>
                Sorry, but there is either no team for this year in this university, or the Data is not available.<br>
                If you know there was a team in this year at this university, first check the request page, and if the request<br>
                is not already there, please submit a data request for such team for our team to search for the data that we must have missed.<br><br>
                Thank you for your patience and hope you enjoy our website!
            </b></center>
        <?php

        echo '<center><form action="#" method="get">';
        echo '<input type="text" name="UniversityRequest" placeholder="Please Enter the University Name" value="' . $university . '">';
        echo '<input type="text" name="YearRequest" placeholder="Please Enter the Year" value="' . $year . '">';
        echo '<input type="text" name="SportRequest" placeholder="Please Enter the Sport" value="' . $sport . '">';
        echo '<input type="submit" name="submitRequest" value="Submit Request" />';
        echo '</form></center>';
    }

    public function request() {


        $con = Database::open();
        $sql = 'INSERT INTO requests VALUES($1, $2, $3, $4)';
        pg_prepare($con, "", $sql);
        $rs = pg_execute($con, "", array($_REQUEST['UniversityRequest'], $_REQUEST['YearRequest'], $_REQUEST['SportRequest'], "No"))
                or die("This has already been requested.");
        pg_close($con);
        echo '<h4><center>Thank you for your request! We will get on this request as soon as possible!</center></h4>';
    }

}
