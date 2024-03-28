<?php
include('dbconnect.php');
include('navbarH.php');
session_start();
?>
<!doctype html>
<html lang="en">

<head>
    <title>LogIn Page</title>
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
            width: 200px;
            height: auto;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row pt-5 justify-content-center">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body pt-2 pb-2">
                        <form action="signin.php" method="POST">
                            <center><img src="misc/logo.png"></center>
                            <?php
                            if (isset($_GET['error'])) {
                                echo
                                '<div class="alert alert-danger text-center alert-dismissible fade show" role="alert">'
                                    . $_GET["error"] .
                                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>';
                            }
                            if (isset($_GET['mssg'])) {
                                echo
                                '<div class="alert alert-success text-center pl-4 alert-dismissible fade show" role="alert">'
                                    . $_GET["mssg"] .
                                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>';
                            }
                            ?>
                            <div class="form-group mt-1">
                                <label for="email">Email</label>
                                <input type="email" name="email" class="form-control" placeholder="Enter Your Email" required>
                            </div>
                            <div class="form-group mt-1">
                                <label for="password">Password</label>
                                <input type="password" name="password" class="form-control" placeholder="Enter Password" required>
                            </div>
                            <div class="form-group">
                                <span>New Here ? Create Account |</span>
                                <a href="signup.php"> Sign Up</a>
                            </div>
                            <button type="submit" name="submit" value="submit" class="btn btn-primary">Log In</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>