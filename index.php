<?php
session_start();
$_SESSION["view"] = "Home";

include('dbconnect.php');
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
    </style>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="container d-flex justify-content-center">
                <div class="col-md-6 p-2">
                    <h1 class="text-center text-white bg-dark mt-5 ml-5 mr-5 p-2" style="border-radius: .5rem;">BRACU Clubs</h1>
                    <h6 class="text-center text-light bg-dark p-2 pb-4 pl-4" style="border-radius: .5rem;">
                        <br>Welcome to the BRAC University Club page.
                        <br>From here, you can find info about various clubs at BRAC University.
                        <br>Also, You can sponsor for ongoing club events.
                    </h6>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="container d-flex justify-content-center">
                <div class="col-md-4">
                    <h2 class="text-center text-light bg-dark mt-5 p-1" style="border-radius: .5rem;">Ongoing Events</h2>
                    <hr>
                </div>
            </div>
            <?php
            $sql = 'SELECT * FROM approved_event';
            $rows = mysqli_query($conn, $sql);

            while ($row = mysqli_fetch_assoc($rows)) {
                echo '<div class="col-md-4 mt-2">
                        <div class="card text-light bg-dark mb-3" style="border-radius: .5rem;">
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
            ?>
        </div>
    </div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </div>
</body>

</html>