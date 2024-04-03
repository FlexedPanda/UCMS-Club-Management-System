<?php
ob_start();
include('dbconnect.php');
include('session.php');
include('navbar.php');
?>

<!doctype html>
<html lang="en">

<head>
    <title>HomePage</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-image: url('misc/campus.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }

        img {
            width: 75px;
            height: auto;
        }

        hr {
            border: 1px solid grey;
        }

        html {
            overflow: scroll;
            overflow-x: hidden;
        }

        ::-webkit-scrollbar {
            width: 0;
            background: transparent;
        }

        ::-webkit-scrollbar-thumb {
            background: #FF0000;
        }
    </style>
</head>

<body>
    <?php

    //Announcement 
    if ($_GET["rqst"] == "announcement") {
        if ($_SESSION["view"] == "Member" || $_SESSION["view"] == "Panel") {
            $sql = "SELECT * FROM give_announcement WHERE Department = '" . $_SESSION["dept"] . "' OR Club = '" . $_SESSION["club"] . "'";
            $rows = mysqli_query($conn, $sql);
        } else {
            $sql = "SELECT * FROM give_announcement";
            $rows = mysqli_query($conn, $sql);
        }

        echo '<div class="container mt-5">';
        while ($row = mysqli_fetch_assoc($rows)) {
            echo
            "<div class='row-md-12'>
                <div class='col-md-6'>
                    <h4 class='text-center text-light bg-dark m-3 p-3' style='border-radius: .5rem;'>
                        " . $row['Department'] . " Department<hr>" . $row['Message'] . " 
                    </h4>
                </div>
            </div>";
        }
        echo '</div>';

        //Event List
    } else if ($_GET["rqst"] == "eventlist") {
        $sql1 = "SELECT * FROM approved_event";
        $rows1 = mysqli_query($conn, $sql1);

        if ($_SESSION["view"] == "Member" || $_SESSION["view"] == "Panel") {
            echo '<div class="container">';
            echo '<div class="row mt-5 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                $sql2 = "SELECT * FROM participate WHERE Event_ID = " . $row["Event_ID"] . " AND Member_ID = " . $_SESSION["id"] . "";
                $rows2 = mysqli_query($conn, $sql2);
                if (mysqli_num_rows($rows2) == 0) {
                    echo
                    '<div class="col-md-4 p-2">
                        <div class="card text-light bg-dark" style="border-radius: .5rem;">
                            <div class="card-body">
                                <center><img class="card-text" src="misc/dlogo.png"></center>
                                <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                                <h4 class="card-title text-center py-2">' . $row["Name"] . '</h4>
                                <p class="card-text m-2 pl-2"><b>Event Date :</b>  ' . $row["Date"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                                <form class="form-inline pl-2" method="GET">
                                    <button class="btn btn-outline-light mt-2" name="participate" value="' . $row["Event_ID"] . '">Participate</button>
                                    <button class="btn btn-secondary mt-2 ml-3" name="leave" value="' . $row["Event_ID"] . '" disabled>Leave</button>
                                    <input type="hidden" name="rqst" value="">
                                </form>
                            </div>
                        </div>
                    </div>';
                } else {
                    echo
                    '<div class="col-md-4 p-2">
                        <div class="card text-light bg-dark" style="border-radius: .5rem;">
                            <div class="card-body">
                                <center><img class="card-text" src="misc/dlogo.png"></center>
                                <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                                <h4 class="card-title text-center py-2">' . $row["Name"] . '</h4>
                                <p class="card-text m-2 pl-2"><b>Date :</b>  ' . $row["Date"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                                <form class="form-inline pl-2" method="GET">
                                    <button class="btn btn-secondary mt-2" name="participate" value="' . $row["Event_ID"] . '" disabled>Participated</button>
                                    <button class="btn btn-outline-light mt-2 ml-3" name="leave" value="' . $row["Event_ID"] . '">Leave</button>
                                    <input type="hidden" name="rqst" value="">
                                </form>
                            </div>
                        </div>
                    </div>';
                }
            }
            echo '</div>';
            echo '</div>';
        } else if ($_SESSION["view"] == "Oca") {
            echo '<div class="container">';
            echo '<div class="row mt-5 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                $sql3 = "SELECT * FROM provide_fund WHERE Event_ID = " . $row["Event_ID"] . " AND OCA_ID = " . $_SESSION["id"] . "";
                $rows3 = mysqli_query($conn, $sql3);
                if (mysqli_num_rows($rows3) == 0) {
                    echo
                    '<div class="col-md-4 p-2">
                        <div class="card text-light bg-dark" style="border-radius: .5rem;">
                            <div class="card-body">
                                <center><img class="card-text" src="misc/dlogo.png"></center>
                                <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                                <h4 class="card-title text-center py-2">' . $row["Name"] . '</h4>
                                <p class="card-text m-2 pl-2"><b>Event Date :</b>  ' . $row["Date"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                                <form class="form-inline m-2 pl-2" method="GET">
                                    <laber for="inputFund"><b>Fund Event : </b></label>
                                    <input type="number" class="mt-2 py-1" id="inputFund" name="amount" placeholder="Enter Amount"><br>
                                    <button class="btn btn-outline-light mt-2" name="provide_fund" value="' . $row["Event_ID"] . '">Fund</button>
                                    <button class="btn btn-secondary mt-2 ml-2" name="change_fund" value="' . $row["Event_ID"] . '" disabled>Cancel</button>
                                    <input type="hidden" name="rqst" value="">
                                </form>
                            </div>
                        </div>
                    </div>';
                } else {
                    echo
                    '<div class="col-md-4 p-2">
                        <div class="card text-light bg-dark" style="border-radius: .5rem;">
                            <div class="card-body">
                                <center><img class="card-text" src="misc/dlogo.png"></center>
                                <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                                <h4 class="card-title text-center py-2">' . $row["Name"] . '</h4>
                                <p class="card-text m-2 pl-2"><b>Date :</b>  ' . $row["Date"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                                <form class="form-inline pl-2" method="GET">
                                <laber for="inputFund"><b>Fund Event : </b></label>
                                <input type="number" class="mt-2 py-1" id="inputFund" name="amount" placeholder="'.$row3["Amount"].' Fund Provided" disabled><br>
                                <button class="btn btn-outline-light mt-2" name="provide_fund" value="' . $row["Event_ID"] . '" disabled>Fund</button>
                                <button class="btn btn-secondary mt-2 ml-2" name="change_fund" value="' . $row["Event_ID"] . '">Cancel</button>
                                <input type="hidden" name="rqst" value="">
                                </form>
                            </div>
                        </div>
                    </div>';
                }
            }
            echo '</div>';
            echo '</div>';
        }else if ($_SESSION["view"] == "Sponsor") {
            echo '<div class="container">';
            echo '<div class="row mt-5 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                $sql4 = "SELECT * FROM give_fund WHERE Event_ID = " . $row["Event_ID"] . " AND Sponsor = '" . $_SESSION["name"] . "'";
                $rows4 = mysqli_query($conn, $sql4);
                if (mysqli_num_rows($rows4) == 0) {
                    echo
                    '<div class="col-md-4 p-2">
                        <div class="card text-light bg-dark" style="border-radius: .5rem;">
                            <div class="card-body">
                                <center><img class="card-text" src="misc/dlogo.png"></center>
                                <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                                <h4 class="card-title text-center py-2">' . $row["Name"] . '</h4>
                                <p class="card-text m-2 pl-2"><b>Event Date :</b>  ' . $row["Date"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                                <form class="form-inline pl-2" method="GET">
                                    <button class="btn btn-outline-light mt-2" name="participate" value="' . $row["Event_ID"] . '">Participate</button>
                                    <button class="btn btn-secondary mt-2 ml-3" name="leave" value="' . $row["Event_ID"] . '" disabled>Leave</button>
                                    <input type="hidden" name="rqst" value="">
                                </form>
                            </div>
                        </div>
                    </div>';
                } else {
                    echo
                    '<div class="col-md-4 p-2">
                        <div class="card text-light bg-dark" style="border-radius: .5rem;">
                            <div class="card-body">
                                <center><img class="card-text" src="misc/dlogo.png"></center>
                                <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                                <h4 class="card-title text-center py-2">' . $row["Name"] . '</h4>
                                <p class="card-text m-2 pl-2"><b>Date :</b>  ' . $row["Date"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                                <p class="card-text m-2 pl-2"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                                <form class="form-inline pl-2" method="GET">
                                    <button class="btn btn-secondary mt-2" name="participate" value="' . $row["Event_ID"] . '" disabled>Participated</button>
                                    <button class="btn btn-outline-light mt-2 ml-3" name="leave" value="' . $row["Event_ID"] . '">Leave</button>
                                    <input type="hidden" name="rqst" value="">
                                </form>
                            </div>
                        </div>
                    </div>';
                }
            }
            echo '</div>';
            echo '</div>';
        } else {
            echo '<div class="container">';
            echo '<div class="row mt-3 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                echo
                '<div class="col-md-4 p-2">
                    <div class="card text-light bg-dark" style="border-radius: .5rem;">
                        <div class="card-body">
                            <center><img class="card-text" src="misc/dlogo.png"></center>
                            <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                            <h4 class="card-title text-center py-2">' . $row["Name"] . '</h4>
                            <p class="card-text m-2 pl-2"><b>Date :</b>  ' . $row["Date"] . '</p>
                            <p class="card-text m-2 pl-2"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                            <p class="card-text m-2 pl-2"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                        </div>
                    </div>
                </div>';
            }
            echo '</div>';
            echo '</div>';
        }

        //Event Participate
    } else if (isset($_GET["participate"])) {
        $event_id = $_GET["participate"];
        $member_id = $_SESSION["id"];

        $chksql = "SELECT * FROM approved_event WHERE Event_ID = $event_id";
        $rows = mysqli_query($conn, $chksql);
        $row = mysqli_fetch_assoc($rows);
        $capacity = $row["Capacity"];
        $participants = $row["Participants"];

        if ($participants >= 0 && $participants < $capacity) {
            $sql1 = "INSERT INTO participate VALUES ($member_id, $event_id)";
            $rows1 = mysqli_query($conn, $sql1);

            $sql2 = "UPDATE participate p, approved_event a, club c SET a.Participants = a.Participants + 1, a.Earnings = a.Earnings + a.Entry_Fee, c.Club_Reserve = c.Club_Reserve + a.Entry_Fee WHERE p.Event_ID = a.Event_ID AND a.Club = c.Name AND p.Member_ID = $member_id";
            $rows2 = mysqli_query($conn, $sql2);

            header("Location: profile.php?mssg=Joined Event Successfully");
            exit();
        }

        //Event Leave
    } else if (isset($_GET["leave"])) {
        $event_id = $_GET["leave"];
        $member_id = $_SESSION["id"];

        $chksql = "SELECT * FROM approved_event WHERE Event_ID = $event_id";
        $rows = mysqli_query($conn, $chksql);
        $row = mysqli_fetch_assoc($rows);
        $participants = $row["Participants"];

        if ($participants > 0) {
            $sql1 = "UPDATE participate p, approved_event a, club c SET a.Participants = a.Participants - 1, a.Earnings = a.Earnings - a.Entry_Fee, c.Club_Reserve = c.Club_Reserve - a.Entry_Fee WHERE p.Event_ID = a.Event_ID AND a.Club = c.Name AND p.Member_ID = $member_id";
            $rows1 = mysqli_query($conn, $sql1);

            $sql2 = "DELETE FROM participate WHERE Member_ID = $member_id AND Event_ID = $event_id";
            $rows2 = mysqli_query($conn, $sql2);

            header("Location: profile.php?mssg=Left Event Successfully");
            exit();
        }

        //Department List
    } else if ($_GET["rqst"] == "deptlist") {
        $sql = "SELECT * FROM department";
        $rows = mysqli_query($conn, $sql);

        echo
        '<div class="container mt-5" style="border: .5rem; ">
            <table class="table table-dark table-bordered table-striped table-hover text-center">
            
            <h5 class="text-light bg-dark mt-5 mb-0 p-3 text-center"><center><img src="misc/dlogo.png"></center>Departments</h5>
                <thead>
                    <tr>
                        <th>Department</th>
                        <th>Head</th>
                        <th>Designation</th>
                        <th>Email</th>
                        <th>Established</th>
                    </tr>
                </thead>';

        while ($row = mysqli_fetch_assoc($rows)) {
            echo
            '<tr>
                <td>' . $row["Name"] . '</td>
                <td>' . $row["Head"] . '</td>
                <td>' . $row["Designation"] . '</td>
                <td>' . $row["Email"] . '</td>
                <td>' . $row["Established"] . '</td>
            </tr>';
        }
        echo '</table>';
        echo '</div>';

        //Club List
    } else if ($_GET["rqst"] == "clublist") {
        $sql = "SELECT * FROM club";
        $rows = mysqli_query($conn, $sql);

        echo
        '<div class="container mt-5">
            <table class="table table-dark table-bordered table-striped table-hover text-center">
            <h5 class="text-light bg-dark mt-5 mb-0 p-3 text-center"><center><img src="misc/dlogo.png"></center>Clubs</h5>
                <thead>
                    <tr>
                        <th>Club</th>
                        <th>Advisor</th>
                        <th>Advisor Email</th>
                        <th>President</th>
                        <th>Advisor Email</th>
                        <th>Established</th>
                    </tr>
                </thead>';

        while ($row = mysqli_fetch_assoc($rows)) {
            echo
            '<tr>
                <td>' . $row["Name"] . '</td>
                <td>' . $row["Advisor"] . '</td>
                <td>' . $row["Advisor_Email"] . '</td>
                <td>' . $row["President"] . '</td>
                <td>' . $row["President_Email"] . '</td>
                <td>' . $row["Established"] . '</td>
            </tr>';
        }
        echo '</table>';
        echo '</div>';

        //Club Event
    } else if ($_GET["rqst"] == "clubevent") {
        $sql1 = "SELECT * FROM approved_event WHERE Club = '" . $_SESSION["club"] . "'";
        $rows1 = mysqli_query($conn, $sql1);

        if ($_SESSION["view"] == "Member") {
            echo '<div class="container-fluid">';
            echo '<div class="row mt-5 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                $sql2 = "SELECT * FROM participate WHERE Event_ID = " . $row["Event_ID"] . " AND Member_ID = " . $_SESSION["id"] . "";
                $rows2 = mysqli_query($conn, $sql2);
                if (mysqli_num_rows($rows2) == 0) {
                    echo
                    '<div class="col-md-4 mt-5">
                        <div class="card mt-5" style="border-radius: .5rem;">
                            <div class="card-body">
                            <center><img src="misc/logo.png"></center>
                                <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                                <h3 class="card-title py-2 text-center">' . $row["Name"] . '</h3>
                                <h6 class="card-text m-2 pl-4 text-dark"><b>Date :</b>  ' . $row["Date"] . '</h6>
                                <h6 class="card-text m-2 pl-4 text-dark"><b>Venue :</b>  ' . $row["Venue"] . '</h6>
                                <h6 class="card-text m-2 pl-4 text-dark"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</h6>
                                <h6 class="card-text m-2 pl-4 text-dark"><b>Participants :</b>  ' . $row["Participants"] . ' person</h6>
                                <form class="form-inline ml-4 mt-3" method="GET">
                                    <button class="btn btn-primary" name="participate" value="' . $row["Event_ID"] . '">Participate</button>
                                    <button class="btn btn-dark ml-2" name="leave" value="' . $row["Event_ID"] . '" disabled>Leave</button>
                                    <input type="hidden" name="rqst" value="">
                                </form>
                            </div>
                        </div>
                    </div>';
                } else {
                    echo
                    '<div class="col-md-4 mt-5">
                        <div class="card mt-5" style="border-radius: .5rem;">
                            <div class="card-body">
                            <center><img src="misc/logo.png"></center>
                                <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                                <h3 class="card-title py-2 text-center">' . $row["Name"] . '</h3>
                                <h6 class="card-text m-2 pl-4 text-dark"><b>Date :</b>  ' . $row["Date"] . '</h6>
                                <h6 class="card-text m-2 pl-4 text-dark"><b>Venue :</b>  ' . $row["Venue"] . '</h6>
                                <h6 class="card-text m-2 pl-4 text-dark"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</h6>
                                <h6 class="card-text m-2 pl-4 text-dark"><b>Participants :</b>  ' . $row["Participants"] . ' person</h6>
                                <form class="form-inline ml-4 mt-3" method="GET">
                                    <button class="btn btn-dark" name="participate" value="' . $row["Event_ID"] . '" disabled>Participated</button>
                                    <button class="btn btn-danger ml-2" name="leave" value="' . $row["Event_ID"] . '">Leave</button>
                                    <input type="hidden" name="rqst" value="">
                                </form>
                            </div>
                        </div>
                    </div>';
                }
            }
            echo '</div>';
            echo '</div>';
        } else if ($_SESSION["view"] == "Panel") {
            echo '<div class="container-fluid">';
            echo '<div class="row mt-5 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                $sql3 = "SELECT * FROM participate WHERE Event_ID = " . $row["Event_ID"] . " AND Member_ID = " . $_SESSION["id"] . "";
                $rows3 = mysqli_query($conn, $sql3);
                if (mysqli_num_rows($rows3) == 0) {
                    echo
                    '<div class="col-md-4 mt-5">
                        <div class="card" style="border-radius: .5rem;">
                            <div class="card-body">
                            <center><img src="misc/logo.png"></center>
                                <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                                <h3 class="card-title py-2 text-center">' . $row["Name"] . '</h3>
                                <h6 class="card-text pl-5 text-dark"><b>Event ID :</b>  ' . $row["Event_ID"] . '</h6>
                                <h6 class="card-text pl-5 text-dark"><b>Date :</b>  ' . $row["Date"] . '</h6>
                                <h6 class="card-text pl-5 text-dark"><b>Venue :</b>  ' . $row["Venue"] . '</h6>
                                <h6 class="card-text pl-5 text-dark"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</h6>
                                <h6 class="card-text pl-5 text-dark"><b>Capacity :</b>  ' . $row["Capacity"] . ' person</h6>
                                <h6 class="card-text pl-5 text-dark"><b>Participants :</b>  ' . $row["Participants"] . ' person</h6>
                                <form class="form-inline ml-5 mt-3" method="GET">
                                    <button class="btn btn-primary" name="participate" value="' . $row["Event_ID"] . '">Participate</button>
                                    <button class="btn btn-dark ml-2" name="leave" value="' . $row["Event_ID"] . '" disabled>Leave</button>
                                    <input type="hidden" name="rqst" value="">
                                </form>
                            </div>
                        </div>
                    </div>';
                } else {
                    echo
                    '<div class="col-md-4 mt-5">
                        <div class="card" style="border-radius: .5rem;">
                            <div class="card-body">
                            <center><img src="misc/logo.png"></center>
                                <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                                <h3 class="card-title pt-1 pb-3 text-center">' . $row["Name"] . '</h3>
                                <h6 class="card-text pl-5 text-dark"><b>Event ID :</b>  ' . $row["Event_ID"] . '</h6>
                                <h6 class="card-text pl-5 text-dark"><b>Date :</b>  ' . $row["Date"] . '</h6>
                                <h6 class="card-text pl-5 text-dark"><b>Venue :</b>  ' . $row["Venue"] . '</h6>
                                <h6 class="card-text pl-5 text-dark"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</h6>
                                <h6 class="card-text pl-5 text-dark"><b>Capacity :</b>  ' . $row["Capacity"] . ' person</h6>
                                <h6 class="card-text pl-5 text-dark"><b>Participants :</b>  ' . $row["Participants"] . ' person</h6>
                                <form class="form-inline ml-5 mt-3" method="GET">
                                    <button class="btn btn-dark" name="participate" value="' . $row["Event_ID"] . '" disabled>Participated</button>
                                    <button class="btn btn-danger ml-3" name="leave" value="' . $row["Event_ID"] . '">Leave</button>
                                    <input type="hidden" name="rqst" value="">
                                </form>
                            </div>
                        </div>
                    </div>';
                }
            }
            echo '</div>';
            echo '</div>';
        } else {
            echo '<div class="container">';
            echo '<div class="row mt-5 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                echo
                '<div class="col-md-4 mt-5">
                    <div class="card" style="border-radius: .5rem;">
                        <div class="card-body pt-5 pb-5">
                        <center><img src="misc/logo.png"></center>
                            <h6 class="card-title text-center text-secondary">' . $row["Club"] . '</h6>
                            <h3 class="card-title pt-1 pb-3 text-center">' . $row["Name"] . '</h3>
                            <h6 class="card-text pl-5 text-dark"><b>Event ID :</b>  ' . $row["Event_ID"] . '</h6>
                            <h6 class="card-text pl-5 text-dark"><b>Date :</b>  ' . $row["Date"] . '</h6>
                            <h6 class="card-text pl-5 text-dark"><b>Venue :</b>  ' . $row["Venue"] . '</h6>
                            <h6 class="card-text pl-5 text-dark"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</h6>
                            <h6 class="card-text pl-5 text-dark"><b>Capacity :</b>  ' . $row["Capacity"] . ' person</h6>
                            <h6 class="card-text pl-5 text-dark"><b>Participants :</b>  ' . $row["Participants"] . ' person</h6>
                        </div>
                    </div>
                </div>';
            }
            echo '</div>';
            echo '</div>';
        }

        //Club Panel List
    } else if ($_GET["rqst"] == "clubpanel") {
        $sql1 = "SELECT * FROM registered_member WHERE Club = '" . $_SESSION["club"] . "' AND Designation <> 'Member'";
        $rows1 = mysqli_query($conn, $sql1);

        echo
        '<div class="container mt-5">
        <h5 class="text-light bg-dark mt-5 mb-0 p-3 text-center"><center><img src="misc/dlogo.png"></center>Panel Members</h5>
            <table class="table table-dark table-bordered table-striped table-hover text-center">
                <thead>
                    <tr>
                        <th>Panel ID</th>
                        <th>Name</th>
                        <th>Designation</th>
                        <th>Department</th>
                        <th>Session</th>
                        <th>Joined Date</th>
                        <th>Email</th>
                        <th>Contacts</th>
                    </tr>
                </thead>';

        while ($row = mysqli_fetch_assoc($rows1)) {
            $sql2 = "SELECT Contact FROM member_contact WHERE Member_ID = " . $row["Member_ID"] . "";
            $rows2 = mysqli_query($conn, $sql2);

            $temp = array();
            while ($trow = mysqli_fetch_assoc($rows2)) {
                array_push($temp, $trow["Contact"]);
            }
            $contacts = implode(", ", $temp);

            echo
            '<tr>
                <td>' . $row["Member_ID"] . '</td>
                <td>' . $row["Name"] . '</td>
                <td>' . $row["Designation"] . '</td>
                <td>' . $row["Department"] . '</td>
                <td>' . $row["Admitted"] . '</td>
                <td>' . $row["Joined_Date"] . '</td>
                <td>' . $row["Email"] . '</td>
                <td>' . $contacts . '</td>
            </tr>';
        }
        echo '</table>';
        echo '</div>';

        //Club Member List
    } else if ($_GET["rqst"] == "clubmembers") {
        $sql1 = "SELECT * FROM registered_member WHERE Club = '" . $_SESSION["club"] . "' AND Designation = 'Member'";
        $rows1 = mysqli_query($conn, $sql1);

        echo
        '<div class="container-fluid">
        <table class="table table-dark table-bordered table-striped table-hover text-center">
            <h5 class="text-light bg-dark mt-5 mb-0 p-3 text-center"><center><img src="misc/dlogo.png"></center>Club Members</h5>
                <thead>
                    <tr>
                        <th>Member ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Birth Date</th>
                        <th>Department</th>
                        <th>Session</th>
                        <th>Credits</th>
                        <th>Joined Date</th>
                        <th>Email</th>
                        <th>Contacts</th>
                        <th>Password</th>
                        <th>Edit</th>
                    </tr>
                </thead>
            </div>';

        while ($row = mysqli_fetch_assoc($rows1)) {
            $sql2 = "SELECT Contact FROM member_contact WHERE Member_ID = " . $row["Member_ID"] . "";
            $rows2 = mysqli_query($conn, $sql2);

            $temp = array();
            while ($trow = mysqli_fetch_assoc($rows2)) {
                array_push($temp, $trow["Contact"]);
            }
            $contacts = implode(", ", $temp);
            echo
            '<tr>
                <td>' . $row["Member_ID"] . '</td>
                <td>' . $row["Name"] . '</td>
                <td>' . $row["Gender"] . '</td>
                <td>' . $row["Birth_Date"] . '</td>
                <td>' . $row["Department"] . '</td>
                <td>' . $row["Admitted"] . '</td>
                <td>' . $row["Credits"] . '</td>
                <td>' . $row["Joined_Date"] . '</td>
                <td>' . $row["Email"] . '</td>
                <td>' . $contacts . '</td>
                <td>' . $row["Password"] . '</td>
                <td>
                    <form action="update.php" method="GET">
                        <button class="btn btn-outline-light py-0" name="id" value="' . $row["Member_ID"] . '">Edit</button>
                        <input type="hidden" name="rqst" value="">
                    </form>
                </td>
            </tr>';
        }
        echo '</table>';

        //Club Member Edit
    } else if ($_GET["rqst"] == "update") {
        $member_id = $_POST["id"];
        $name = $_POST["name"];
        $gender = $_POST["gender"];
        $dob = $_POST["date"];
        $dept = $_POST["dept"];
        $admit = $_POST["admit"];
        $credit = $_POST["credit"];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $contacts = $_POST["contacts"];

        $sql1 = "UPDATE registered_member SET Name = '$name', Gender = '$gender', Birth_Date = '$dob', Department = '$dept', Admitted = '$admit', Credits = $credit, Email = '$email', Password = '$password' WHERE Member_ID = $member_id";
        $rows1 = mysqli_query($conn, $sql1);

        $sql2 = "DELETE FROM member_contact WHERE Member_ID = $member_id";
        $rows2 = mysqli_query($conn, $sql2);

        $contacts = explode(", ", $contact);
        foreach ($contacts as $contact) {
            $sql3 = "INSERT INTO member_contact VALUES ($member_id, '$contact')";
            $rows3 = mysqli_query($conn, $sql3);
        }

        header("Location: profile.php?mssg=Member Details Updated");
        exit();

        //CLub Member Request
    } else if ($_GET["rqst"] == "pending") {
        $sql1 = "SELECT * FROM unregistered_member m, request_membership r WHERE m.Member_ID = r.Member_ID AND r.Panel_ID = " . $_SESSION["id"] . " AND r.Club = '" . $_SESSION["club"] . "'";
        $rows1 = mysqli_query($conn, $sql1);

        echo
        '<div class="container-fluid">
        <table class="table table-dark table-bordered table-striped table-hover text-center">
        <h5 class="text-light bg-dark mt-5 mb-0 p-3 text-center"><center><img src="misc/dlogo.png"></center>Member Requests</h5>
            <thead>
                <tr>
                    <th>Member ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Birth Date</th>
                    <th>Department</th>
                    <th>Session</th>
                    <th>Credits</th>
                    <th>Email</th>
                    <th>Contacts</th>
                    <th>Password</th>
                    <th>Accept</th>
                    <th>Reject</th>
                </tr>
            </thead>
            </div>';

        while ($row = mysqli_fetch_assoc($rows1)) {
            $sql2 = "SELECT Contact FROM tmember_contact WHERE Member_ID = " . $row["Member_ID"] . "";
            $rows2 = mysqli_query($conn, $sql2);

            $temp = array();
            while ($trow = mysqli_fetch_assoc($rows2)) {
                array_push($temp, $trow["Contact"]);
            }
            $contacts = implode(", ", $temp);
            echo
            '<tr>
                <td>' . $row["Member_ID"] . '</td>
                <td>' . $row["Name"] . '</td>
                <td>' . $row["Gender"] . '</td>
                <td>' . $row["Birth_Date"] . '</td>
                <td>' . $row["Department"] . '</td>
                <td>' . $row["Admitted"] . '</td>
                <td>' . $row["Credits"] . '</td>
                <td>' . $row["Email"] . '</td>
                <td>' . $contacts . '</td>
                <td>' . $row["Password"] . '</td>
                <td>
                    <form method="GET">
                        <button class="btn btn-outline-light py-0" name="accept" value="' . $row["Member_ID"] . '">Accept</button>
                        <input type="hidden" name="rqst" value="">
                    </form>
                </td>
                <td>
                    <form method="GET">
                        <button class="btn btn-outline-light py-0" name="reject" value="' . $row["Member_ID"] . '">Reject</button>
                        <input type="hidden" name="rqst" value="">
                    </form>
                </td>
            </tr>';
        }
        echo '</table>';

        //Member Request Accept
    } else if (isset($_GET["accept"])) {
        //storing unregistered member attributes
        $id = $_GET["accept"];
        $sql1 = "SELECT * FROM unregistered_member WHERE Member_ID = $id";
        $rows1 = mysqli_query($conn, $sql1);
        $row1 = mysqli_fetch_assoc($rows1);

        $member_id = $row1["Member_ID"];
        $name = $row1["Name"];
        $gender = $row1["Gender"];
        $dob = $row1["Birth_Date"];
        $dept = $row1["Department"];
        $admit = $row1["Admitted"];
        $credit = $row1["Credits"];
        $email = $row1["Email"];
        $password = $row1["Password"];
        $club = $_SESSION["club"];
        $joined = date("Y-m-d");
        $desig = "Member";

        //storing unregistered member contacts
        $sql2 = "SELECT Contact FROM tmember_contact WHERE Member_ID = $member_id";
        $rows2 = mysqli_query($conn, $sql2);

        $temp = array();
        while ($row2 = mysqli_fetch_assoc($rows2)) {
            array_push($temp, $row2["Contact"]);
        }
        $tcontacts = implode(", ", $temp);

        //inserting attributes into registered_member
        $sql3 = "INSERT INTO registered_member VALUES ($member_id, '$name', '$gender', '$dob', '$dept', '$admit', $credit, '$club', '$joined', '$desig', '$email', '$password')";
        $rows3 = mysqli_query($conn, $sql3);

        //inserting contacts into registered member contacts
        $contacts = explode(", ", $tcontacts);
        foreach ($contacts as $contact) {
            $sql4 = "INSERT INTO member_contact VALUES ($member_id, '$contact')";
            $rows4 = mysqli_query($conn, $sql4);
        }

        //collecting moderate from request membership
        $sql5 = "SELECT * FROM request_membership WHERE Member_ID = $member_id";
        $rows5 = mysqli_query($conn, $sql5);
        while ($row5 = mysqli_fetch_assoc($rows5)) {
            $panel_id = $row5["Panel_ID"];
            $sql6 = "INSERT INTO moderate VALUES ($member_id, $panel_id)";
            $rows6 = mysqli_query($conn, $sql6);
        }

        //deleting unregistered member request
        $sql7 = "DELETE FROM unregistered_member WHERE Member_ID = $member_id";
        $rows7 = mysqli_query($conn, $sql7);
        header("Location: profile.php?mssg=Member Request Accepted");
        exit();

        //Member Request Reject
    } else if (isset($_GET["reject"])) {
        //unregistered member contacts & request membership gets auto deleted by foreign key constraint
        $id = $_GET["reject"];
        $sql = "DELETE FROM unregistered_member WHERE Member_ID = $id";
        $rows1 = mysqli_query($conn, $sql);

        header("Location: profile.php?mssg=Member Request Rejected");
        exit();

        //Event Request
    } else if ($_GET["rqst"] == "request") {
        $name = $_POST["name"];
        $date = $_POST["date"];
        $venue = $_POST["venue"];
        $entry_fee = $_POST["entry"];
        $club = $_SESSION["club"];

        $chksql = "SELECT * FROM approved_event WHERE Name = '$name' AND Club = '$club'";
        $chkrows = mysqli_query($conn, $chksql);
        if (mysqli_num_rows($chkrows) == 0) {
            if ($entry_fee >= 0) {
                $sql1 = "INSERT INTO unapproved_event VALUES (NULL, '$name', '$date', '$venue', $entry_fee)";
                $rows1 = mysqli_query($conn, $sql1);

                $sql2 = "SELECT * FROM unapproved_event WHERE Name = '$name'";
                $rows2 = mysqli_query($conn, $sql2);
                $row2 = mysqli_fetch_assoc($rows2);
                $event_id = $row2["Event_ID"];
                $member_id = $_SESSION["id"];

                $sql3 = "SELECT * FROM oca";
                $rows3 = mysqli_query($conn, $sql3);
                while ($row3 = mysqli_fetch_assoc($rows3)) {
                    $oca_id = $row3["OCA_ID"];
                    $sql4 = "INSERT INTO request_event VALUES ($event_id, $member_id, $oca_id, '$club')";
                    $rows4 = mysqli_query($conn, $sql4);
                }
            } else {
                header("Location: request.php?error=Invalid Entry Fee/Capacity/Cost");
                exit();
            }
        } else {
            header("Location: request.php?error=Event Already Exists");
            exit();
        }
        header("Location: profile.php?mssg=Event Request Sent");
        exit();

        //Advisor List
    } else if ($_GET["rqst"] == "advisorlist") {
        $sql1 = "SELECT * FROM advisor a, club c WHERE c.Advisor_ID = a.Advisor_ID";
        $rows1 = mysqli_query($conn, $sql1);

        echo
        '<div class="container mt-5">
            <h5 class="text-light bg-dark mt-5 mb-0 p-3 text-center"><center><img src="misc/dlogo.png"></center>Advisors</h5>
                <table class="table table-dark table-bordered table-striped table-hover text-center">
                    <thead>
                        <tr>
                            <th>Advisor ID</th>
                            <th>Name</th>
                            <th>Designation</th>
                            <th>Supervising Club</th>
                            <th>Email</th>
                            <th>Contacts</th>
                        </tr>
                    </thead>';

        while ($row = mysqli_fetch_assoc($rows1)) {
            $sql2 = "SELECT Contact FROM advisor_contact WHERE Advisor_ID = " . $row["Advisor_ID"] . "";
            $rows2 = mysqli_query($conn, $sql2);

            $temp = array();
            while ($trow = mysqli_fetch_assoc($rows2)) {
                array_push($temp, $trow["Contact"]);
            }
            $contacts = implode(", ", $temp);

            echo
            '<tr>
                <td>' . $row["Advisor_ID"] . '</td>
                <td>' . $row["Advisor"] . '</td>
                <td>' . $row["Designation"] . '</td>
                <td>' . $row["Name"] . '</td>
                <td>' . $row["Email"] . '</td>
                <td>' . $contacts . '</td>
            </tr>';
        }
        echo '</table>';
        echo '</div>';

        //OCA Provide Provide
    } else if (isset($_GET["provide_fund"])) {
        $eid = $_GET["provide_fund"];
        $oca_id = $_SESSION["id"];
        $amount = $_GET["amount"];

        echo $eid, $oca_id, $amount;
    }
    ob_end_flush();
    ?>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>