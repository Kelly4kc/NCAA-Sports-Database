<?php

/**
 * Provides access to the underlying PostgreSQL database.
 */
class Database {

    public static function open() {
        $host = "data.cs.jmu.edu";
        $port = "5432";
        $db = "miners";
        $user = "miners";
        $pass = "c7=kr&9N=YrL%Ac4";

        $con = pg_connect("host=$host port=$port dbname=$db user=$user password=$pass")
               or die("Could not connect: " . pg_last_error());
        return $con;
    }

}
