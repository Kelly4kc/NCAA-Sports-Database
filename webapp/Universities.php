<?php

class Universities {

    public function __construct() {
        $con = Database::open();
        pg_close($con);
    }

    public static function getUniversities() {
        $schoolsResult = Functions::schools();
        $schoolArray = array();
        $outArray = array();
        $i = 1;
        while ($row = pg_fetch_row($schoolsResult)) {
            $schoolArray['id'] = $i;
            $schoolArray['text'] = $row[0];
            array_push($outArray, $schoolArray);
            $i++;
        }
        return $outArray;
    }

}
