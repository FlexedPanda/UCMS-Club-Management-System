<?php
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
            border: 1px dashed black;
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
    } else if ($_GET["rqst"] == "eventlist") {
        $sql1 = "SELECT * FROM approved_event";
        $rows1 = mysqli_query($conn, $sql1);

        if ($_SESSION["view"] == "Member" || $_SESSION["view"] == "Panel") {
            echo '<div class="row mt-5 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                $sql2 = "SELECT * FROM participate WHERE Event_ID = " . $row["Event_ID"] . " AND Member_ID = " . $_SESSION["id"] . "";
                $rows2 = mysqli_query($conn, $sql2);
                if (mysqli_num_rows($rows2) == 0) {
                    echo
                    '<div class="col-md-4 p-2">
                        <div class="card text-light bg-dark" style="border-radius: .5rem;">
                            <div class="card-body">
                                <h4 class="card-title text-center">' . $row["Name"] . '</h4>
                                <p class="card-text m-2 pl-5"><b>Club :</b> ' . $row["Club"] . '</p>
                                <p class="card-text m-2 pl-5"><b>Date :</b>  ' . $row["Date"] . '</p>
                                <p class="card-text m-2 pl-5"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                                <p class="card-text m-2 pl-5"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                                <form class="form-inline pl-5" method="GET">
                                    <button class="btn btn-outline-light mt-2" name="participate" value="' . $row["Event_ID"] . '">Participate</button>
                                    <button class="btn btn-secondary mt-2 ml-3" name="cancel" value="' . $row["Event_ID"] . '" disabled>Cancel</button>
                                </form>
                            </div>
                        </div>
                    </div>';
                } else {
                    echo
                    '<div class="col-md-4 p-2">
                        <div class="card text-light bg-dark" style="border-radius: .5rem;">
                            <div class="card-body">
                                <h4 class="card-title text-center">' . $row["Name"] . '</h4>
                                <p class="card-text m-2 pl-5"><b>Club :</b> ' . $row["Club"] . '</p>
                                <p class="card-text m-2 pl-5"><b>Date :</b>  ' . $row["Date"] . '</p>
                                <p class="card-text m-2 pl-5"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                                <p class="card-text m-2 pl-5"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                                <form class="form-inline pl-5" method="GET">
                                    <button class="btn btn-secondary mt-2" name="participate" value="' . $row["Event_ID"] . '" disabled>Participated</button>
                                    <button class="btn btn-outline-light mt-2 ml-3" name="cancel" value="' . $row["Event_ID"] . '">Cancel</button>
                                </form>
                            </div>
                        </div>
                    </div>';
                }
            }
            echo '</div>';
        } else if ($_SESSION["view"] == "Oca") {
            echo '<div class="row mt-5 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                echo
                '<div class="col-md-4 p-2">
                    <div class="card text-light bg-dark" style="border-radius: .5rem;">
                        <div class="card-body">
                            <h4 class="card-title text-center">' . $row["Name"] . '</h4>
                            <p class="card-text m-2 pl-5"><b>Club :</b> ' . $row["Club"] . '</p>
                            <p class="card-text m-2 pl-5"><b>Date :</b>  ' . $row["Date"] . '</p>
                            <p class="card-text m-2 pl-5"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                            <p class="card-text m-2 pl-5"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                            <div class="card-text m-2 pl-5">
                                <input type="number" name="amount" placeholder="Enter Amount" required>
                                <button type="submit" name="fund" value="fund" class="btn btn-outline-light">Fund</button>
                            </div>
                        </div>
                    </div>
                </div>';
            }
            echo '</div>';
        } else {
            echo '<div class="row mt-5 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                echo
                '<div class="col-md-4 p-2">
                    <div class="card text-light bg-dark" style="border-radius: .5rem;">
                        <div class="card-body">
                            <h4 class="card-title text-center">' . $row["Name"] . '</h4>
                            <p class="card-text m-2 pl-5"><b>Club :</b> ' . $row["Club"] . '</p>
                            <p class="card-text m-2 pl-5"><b>Date :</b>  ' . $row["Date"] . '</p>
                            <p class="card-text m-2 pl-5"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                            <p class="card-text m-2 pl-5"><b>Entry Fee :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                        </div>
                    </div>
                </div>';
            }
            echo '</div>';
        }
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

            $sql2 = "UPDATE approved_event SET Participants = Participants + 1, Earnings = Earnings + Entry_Fee WHERE Event_ID = $event_id";
            $rows2 = mysqli_query($conn, $sql2);

            $sql3 = "UPDATE participate p, approved_event a, club c SET c.Club_Reserve = c.Club_Reserve + a.Entry_Fee WHERE p.Event_ID = a.Event_ID AND a.Club = c.Name";
            $rows3 = mysqli_query($conn, $sql3);

            header("Location: profile.php");
            exit();
        }
    } else if (isset($_GET["cancel"])) {
        $event_id = $_GET["cancel"];
        $member_id = $_SESSION["id"];

        $chksql = "SELECT * FROM approved_event WHERE Event_ID = $event_id";
        $rows = mysqli_query($conn, $chksql);
        $row = mysqli_fetch_assoc($rows);
        $participants = $row["Participants"];

        if ($participants > 0) {
            $sql3 = "UPDATE participate p, approved_event a, club c SET c.Club_Reserve = c.Club_Reserve - a.Entry_Fee WHERE p.Event_ID = a.Event_ID AND a.Club = c.Name";
            $rows3 = mysqli_query($conn, $sql3);

            $sql2 = "UPDATE approved_event SET Participants = Participants - 1, Earnings = Earnings - Entry_Fee WHERE Event_ID = $event_id";
            $rows2 = mysqli_query($conn, $sql2);

            $sql1 = "DELETE FROM participate WHERE Member_ID = $member_id AND Event_ID = $event_id";
            $rows1 = mysqli_query($conn, $sql1);

            header("Location: profile.php");
            exit();
        }
    } else if ($_GET["rqst"] == "deptlist") {
        $sql = "SELECT * FROM department";
        $rows = mysqli_query($conn, $sql);

        echo
        '<div class="container mt-5">
            <table class="table table-dark table-bordered table-striped table-hover text-center">
                <tr>
                    <th>Department</th>
                    <th>Head</th>
                    <th>Designation</th>
                    <th>Email</th>
                    <th>Established</th>
                </tr>';

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
    } else if ($_GET["rqst"] == "clublist") {
        $sql = "SELECT * FROM club";
        $rows = mysqli_query($conn, $sql);

        echo
        '<div class="container mt-5">
            <table class="table table-dark table-bordered table-striped table-hover text-center">
                <tr>
                    <th>Club</th>
                    <th>Advisor</th>
                    <th>Advisor Email</th>
                    <th>President</th>
                    <th>Advisor Email</th>
                    <th>Established</th>
                </tr>';

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
    } else if ($_GET["rqst"] == "clubevent") {
        $sql1 = "SELECT * FROM approved_event WHERE Club = '" . $_SESSION["club"] . "'";
        $rows1 = mysqli_query($conn, $sql1);

        if ($_SESSION["view"] == "Member" || $_SESSION["view"] == "Panel") {
            echo '<div class="row mt-5 ml-2 mr-2">';
            while ($row = mysqli_fetch_assoc($rows1)) {
                $sql2 = "SELECT * FROM participate WHERE Event_ID = " . $row["Event_ID"] . " AND Member_ID = " . $_SESSION["id"] . "";
                $rows2 = mysqli_query($conn, $sql2);
                if (mysqli_num_rows($rows2) == 0) {
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
                                    <button class="btn btn-primary" name="participate" value="' . $row["Event_ID"] . '">Participate</button>
                                    <button class="btn btn-dark ml-3" name="cancel" value="' . $row["Event_ID"] . '" disabled>Cancel</button>
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
                                    <button class="btn btn-dark mt-2" name="participate" value="' . $row["Event_ID"] . '" disabled>Participate</button>
                                    <button class="btn btn-danger mt-2 ml-3" name="cancel" value="' . $row["Event_ID"] . '">Cancel</button>
                                </form>
                            </div>
                        </div>
                    </div>';
                }
            }
            echo '</div>';
        } else {
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
        }
    } else if ($_GET["rqst"] == "clubpanel") {
        $sql1 = "SELECT * FROM registered_member WHERE Club = '" . $_SESSION["club"] . "' AND Designation <> 'Member'";
        $rows1 = mysqli_query($conn, $sql1);

        echo
        '<div class="container mt-5">
            <table class="table table-dark table-bordered table-striped table-hover text-center">
                <tr>
                    <th>Panel ID</th>
                    <th>Name</th>
                    <th>Designation</th>
                    <th>Department</th>
                    <th>Session</th>
                    <th>Joined Date</th>
                    <th>Email</th>
                    <th>Contacts</th>
                </tr>';

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
    } else if ($_GET["rqst"] == "clubmembers") {
        $sql1 = "SELECT * FROM registered_member WHERE Club = '" . $_SESSION["club"] . "' AND Designation = 'Member'";
        $rows1 = mysqli_query($conn, $sql1);

        echo
        '<table class="table mt-5 table-dark table-bordered table-striped table-hover text-center">
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
                </tr>';

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
                    </form>
                </td>
            </tr>';
        }
        echo '</table>';
    } else if ($_GET["rqst"] == "update") {
        $sql1 = "UPDATE registered_member SET Name = '" . $_POST["name"] . "', Gender = '" . $_POST["gender"] . "', Birth_Date = '" . $_POST["date"] . "', Department = '" . $_POST["dept"] . "', Admitted = '" . $_POST["admit"] . "', Credits = '" . $_POST["credit"] . "', Email = '" . $_POST["email"] . "', Password = '" . $_POST["password"] . "' WHERE Member_ID = " . $_POST["id"] . "";
        $rows1 = mysqli_query($conn, $sql1);

        $sql2 = "DELETE FROM member_contact WHERE Member_ID = " . $_POST["id"] . "";
        $rows2 = mysqli_query($conn, $sql2);

        $contacts = explode(", ", $_POST["contacts"]);
        foreach ($contacts as $contact) {
            $sql3 = "INSERT INTO member_contact VALUES (" . $_POST["id"] . ", '" . $contact . "')";
            $rows3 = mysqli_query($conn, $sql3);
        }

        header("Location: profile.php");
        exit();
    } else if ($_GET["rqst"] == "pending") {
        $sql1 = "SELECT m.Member_ID, m.Name, m.Gender, m.Birth_Date, m.Department, m.Admitted, m.Credits, m.Email, m.Password, r.Request_Date FROM unregistered_member m, request_membership r WHERE m.Member_ID = r.Member_ID AND r.Panel_ID = " . $_SESSION["id"] . " AND r.Club = '" . $_SESSION["club"] . "'";
        $rows1 = mysqli_query($conn, $sql1);

        echo
        '<table class="table mt-5 table-dark table-bordered table-striped table-hover text-center">
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
                    <th>Request Date</th>
                    <th>Accept</th>
                    <th>Reject</th>
                </tr>';

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
                <td>' . $row["Request_Date"] . '</td>
                <td>
                    <form>
                        <button class="btn btn-outline-light py-0" name="accept" value="' . $row["Member_ID"] . '"">Accept</button>
                    </form>
                </td>
                <td>
                    <form>
                        <button class="btn btn-outline-light py-0" name="reject" value="' . $row["Member_ID"] . '">Reject</button>
                    </form>
                </td>
            </tr>';
        }
        echo '</table>';
    }else if(isset($_GET["accept"])){
        // $sql1 = "SELECT * FROM unregistered_member WHERE Member_ID = ".$_GET["accept"]."";
        // $rows1 = mysqli_query($conn, $sql1);
        // $row1 = mysqli_fetch_assoc($rows1);
        // $joined = date("Y-m-d");

        // $sql2 = "INSERT INTO registered_member VALUES (".$row1["Member_ID"].", '".$row1["Name"]."', '".$row1["Gender"]."', '".$row1["Birth_Date"]."', '".$row1["Department"]."', '".$row1["Admitted"]."', '".$row1["Credits"]."', '".$row1["Club"]."', '".$joined."', 'Member', '".$row1["Email"]."', '".$row1["Password"]."')";
        // $rows2 = mysqli_query($conn, $sql2);


        // $sql3 = "SELECT Contact FROM tmember_contact WHERE Member_ID = ".$row1["Member_ID"]."";
        // $rows3 = mysqli_query($conn, $sql3);

        // $temp = array();
        // while ($row3 = mysqli_fetch_assoc($rows3)) {
        //     array_push($temp, $row3["Contact"]);
        // }
        // $tcontacts = implode(", ", $temp);

        // $contacts = explode(", ", $tcontacts);
        // foreach ($contacts as $contact) {
        //     $sql4 = "INSERT INTO member_contact VALUES (".$row1["Member_ID"].", '".$contact."')";
        //     $rows4 = mysqli_query($conn, $sql4);
        // }


        // $sql5 = "SELECT * FROM request_membership WHERE Member_ID = ".$row1["Member_ID"]."";
        // $rows5 = mysqli_query($conn, $sql5);

        // while($row5 = mysqli_fetch_assoc($rows5)){
        //     $sql6 = "INSERT INTO moderate VALUES (".$row1["Member_ID"].", ".$row5["Panel_ID"].")";
        //     $rows6 = mysqli_query($conn, $sql6);
        // }

        // $sql7 = "DELETE FROM unregistered_member WHERE Member_ID = ".$row1["Member_ID"]."";
        // $rows7 = mysqli_query($conn, $sql7);

        // $sql8 = "DELETE FROM tmember_contact WHERE Member_ID = ".$row1["Member_ID"]."";
        // $rows8 = mysqli_query($conn, $sql8);

        // $sql9 = "DELETE FROM request_membership WHERE Member_ID = ".$row1["Member_ID"]."";
        // $rows9 = mysqli_query($conn, $sql9);

        // header("Location: profile.php");
        // exit();
    }
    ?>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>