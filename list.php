<?php
include('dbconnect.php');
include('session.php');
include('navbar.php');
?>

<!doctype html>
<html lang="en">

<head>
    <title>Announcements</title>
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
    }
    else if($_GET["rqst"] == "eventlist"){
        $sql = "SELECT Name, Club, Date, Venue, Entry_Fee FROM approved_event";
        $rows = mysqli_query($conn, $sql);

        if ($_SESSION["view"] == "Member" || $_SESSION["view"] == "Panel"){
            echo '<div class="row mt-3">';
            while ($row = mysqli_fetch_assoc($rows)) {
                echo
                '<div class="col-md-4 p-2">
                    <div class="card text-light bg-dark" style="border-radius: .5rem;">
                        <div class="card-body">
                            <h4 class="card-title text-center">' . $row["Name"] . '</h4>
                            <p class="card-text m-2"><b>Club :</b> ' . $row["Club"] . '</p>
                            <p class="card-text m-2"><b>Date :</b>  ' . $row["Date"] . '</p>
                            <p class="card-text m-2"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                            <p class="card-text m-2"><b>Entry :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                            <button type="submit" name="participate" value="participate" class="btn btn-outline-light mt-2">Participate</button>
                        </div>
                    </div>
                </div>';
            }
            echo '</div>';
        }

        else if ($_SESSION["view"] == "Oca"){
            echo '<div class="row mt-3">';
            while ($row = mysqli_fetch_assoc($rows)) {
                echo
                '<div class="col-md-4 p-2">
                    <div class="card text-light bg-dark" style="border-radius: .5rem;">
                        <div class="card-body">
                            <h4 class="card-title text-center">' . $row["Name"] . '</h4>
                            <p class="card-text m-2"><b>Club :</b> ' . $row["Club"] . '</p>
                            <p class="card-text m-2"><b>Date :</b>  ' . $row["Date"] . '</p>
                            <p class="card-text m-2"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                            <p class="card-text m-2"><b>Entry :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                            <div class="card-text m-2">
                                <input type="number" name="amount" placeholder="Enter Amount" required>
                                <button type="submit" name="fund" value="fund" class="btn btn-outline-light">Fund</button>
                            </div>
                        </div>
                    </div>
                </div>';
            }
            echo '</div>';
        }

        else{
            echo '<div class="row mt-3">';
            while ($row = mysqli_fetch_assoc($rows)) {
                echo
                '<div class="col-md-4 p-2">
                    <div class="card text-light bg-dark" style="border-radius: .5rem;">
                        <div class="card-body">
                            <h4 class="card-title text-center">' . $row["Name"] . '</h4>
                            <p class="card-text m-2"><b>Club :</b> ' . $row["Club"] . '</p>
                            <p class="card-text m-2"><b>Date :</b>  ' . $row["Date"] . '</p>
                            <p class="card-text m-2"><b>Venue :</b>  ' . $row["Venue"] . '</p>
                            <p class="card-text m-2"><b>Entry :</b>  ' . $row["Entry_Fee"] . ' taka</p>
                        </div>
                    </div>
                </div>';
            }
            echo '</div>';
        }
    }

    else if($_GET["rqst"] == "deptlist"){ 
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
        
        while($row = mysqli_fetch_assoc($rows)){
            echo 
                '<tr>
                    <td>'.$row["Name"].'</td>
                    <td>'.$row["Head"].'</td>
                    <td>'.$row["Designation"].'</td>
                    <td>'.$row["Email"].'</td>
                    <td>'.$row["Established"].'</td>
                </tr>';
        }
        echo '</table>';
        echo '</div>';
    }

    else if($_GET["rqst"] == "clublist"){ 
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
        
        while($row = mysqli_fetch_assoc($rows)){
            echo 
                '<tr>
                    <td>'.$row["Name"].'</td>
                    <td>'.$row["Advisor"].'</td>
                    <td>'.$row["Advisor_Email"].'</td>
                    <td>'.$row["President"].'</td>
                    <td>'.$row["President_Email"].'</td>
                    <td>'.$row["Established"].'</td>
                </tr>';
        }
        echo '</table>';
        echo '</div>';
    }
    ?>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>