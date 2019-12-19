<?php
include "Database.php";
include "Functions.php";
include "Attendance.php";
include "Conference.php";
include "Players.php";
include "Universities.php";
include "Schedule.php";
include "Statistics.php";
include "slideshow.php";
include "Requests.php";
include "WinPercentage.php";
?>
<style>
<?php
include 'css/style.css';
if (($_SERVER['REQUEST_URI'] == '/') || isset($_GET['Conference']) || isset($_GET['Attendance']) || isset($_GET['Players']) || isset($_GET['Conference']) || isset($_GET['Statistics']) || isset($_GET['Schedule'])) {
    $bgimg = "images/logo.png";
} else {
    $bgimg = "images/white.png";
}
?>

    body {
        background-image: url('<?php echo $bgimg; ?>');
    }
</style>
<!DOCTYPE html>
<div class="navbar">
    <a href="./">Home</a>
    <a href="?Conference">Conference</a>
    <a href="?Attendance">Attendance</a>
    <a href="?Players">Players</a>
    <a href="?Schedule">Schedule</a>
    <a href="?Winning">Best Winning Conferences</a>
    <a href="?Requests">Requests</a>
    <!--<a href="?Statistics">Statistics</a>--> 
</div>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="jquery-3.4.0.min.js"></script>
</head>
<body>
    <?php
    if (($_SERVER['REQUEST_URI'] == '/')) {
        echo '<div style="float: center;"><center><h3>Hello and welcome to our NCAA Information website. This website has multiple <br> '
        . ' types of interesting data and analyses based <br> off of all of the teams in the NCAA. You can find the '
        . '<br>different kinds of searches provided in the top menu bar, as well'
        . '<br> as requests that have been made for new data. Enjoy our product!</h3></center></div>';
    }
    if (isset($_GET['Attendance'])) {
        Attendance::beginAttendGraph();
    }
    if (isset($_GET['Players'])) {
        Players::beginPlays();
    }
    if (isset($_GET['Conference'])) {
        Conference::beginConfers();
    }
    if (isset($_GET['Schedule'])) {
        Schedule::beginSchedule();
    }
    if (isset($_GET['Statistics'])) {
        Statistics::beginStatistics();
    }
    if (isset($_GET['Requests'])) {
        Requests::showRequests();
    }
    if (isset($_GET['Winning'])) {
                echo'<h1><center>This shows the top 3 Men\'s and Women\'s teams in each conference from one of the top 5 major college sports other than football in the year 2017</center></h1>';
        WinPercentage::showWinning();
    }
    if (isset($_GET['submitConference']) && isset($_GET['conference']) && isset($_GET['year'])) {
        Conference::confers($_REQUEST['conference'], $_REQUEST['year']);
    }
    if (isset($_GET['submitAttendance']) && isset($_GET['university']) && isset($_GET['year'])) {
        Attendance::attendGraph($_REQUEST['university'], $_REQUEST['year']);
    }
    if (isset($_GET['submitPlayers']) && isset($_GET['university']) && isset($_GET['year'])) {
        Players::plays($_REQUEST['university'], $_REQUEST['year']);
    }
    if (isset($_GET['submitSchedule']) && isset($_GET['university']) && isset($_GET['year']) && isset($_GET['sport'])) {
        Schedule::sched($_REQUEST['university'], $_REQUEST['year'], $_REQUEST['sport']);
    }
    if (isset($_GET['submitStatistics']) && isset($_GET['university']) && isset($_GET['year']) && isset($_GET['sport'])) {
        Statistics::stats($_REQUEST['university'], $_REQUEST['year'], $_REQUEST['sport']);
    }
    if (isset($_GET['submitRequest'])){
        NoSchoolData::request();
    }
    //WinPercentage side bar navigation
    if (isset($_GET['Baseball'])) {
        echo'<h1><center>This shows the top 3 Men\'s and Women\'s teams in each conference from one of the top 3 major college sports other than football in the year 2017</center></h1>';
        WinPercentage::WinMultiple(Functions::sportToSportScoreString('Baseball'));
        WinPercentage::WinMultiple(Functions::sportToSportScoreString('Women\'s Softball'));

    }
    if (isset($_GET['Basketball'])) {
        echo'<h1><center>This shows the top 3 Men\'s and Women\'s teams in each conference from one of the top 3 major college sports other than football in the year 2017</center></h1>';
        WinPercentage::WinMultiple(Functions::sportToSportScoreString('Men\'s Basketball'));
        WinPercentage::WinMultiple(Functions::sportToSportScoreString('Women\'s Basketball'));
    }
    if (isset($_GET['Soccer'])) {
        echo'<h1><center>This shows the top 3 Men\'s and Women\'s teams in each conference from one of the top 3 major college sports other than football in the year 2017</center></h1>';
        WinPercentage::WinMultiple(Functions::sportToSportScoreString('Men\'s Soccer'));
        WinPercentage::WinMultiple(Functions::sportToSportScoreString('Women\'s Soccer'));
    }
    ?>
</body>
