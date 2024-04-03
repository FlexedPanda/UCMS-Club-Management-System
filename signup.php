<?php
session_start();
$_SESSION["view"] = "Home";

include('dbconnect.php');
include('navbar.php');
?>

<!doctype html>
<html lang="en">

<head>
  <title>SignUp</title>
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
      width: 150px;
      height: auto;
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
  <div class="row mt-5 mb-5 d-flex justify-content-center">
    <div class="col-md-4 mt-3 mb-3">
      <div class="card pt-2" style="border-radius: .5rem;">
        <div class="card-body pt-4 pb-1">
          <form action="register.php" method="POST">
            <center><img src="misc/logo.png"></center>
            <?php
            if (isset($_GET['error'])) {
              echo
              '<div class="alert alert-danger text-center mt-3 ml-5 mr-5 alert-dismissible" role="alert">'
                . $_GET["error"] .
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>';
              session_unset();
              session_destroy();
            }
            ?>

            <div class="form-group row mt-3 pt-3">
              <label class="col-sm-3 col-form-label" for="inputId">Member ID</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="inputID" name="id" placeholder="Student ID" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-3 col-form-label" for="inputName">Full Name</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="inputName" name="name" placeholder="Name" required>
              </div>
            </div>
            <fieldset class="form-group">
              <div class="row">
                <label class="col-form-label col-sm-3 pt-0">Gender</label>
                <div class="col-sm-3">
                  <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" id="gender1" name="gender" value="Male" required>
                    <label class="form-check-label" for="gender1">
                      Male
                    </label>
                  </div>
                </div>
                <div class="col-sm-3">
                  <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" id="gender2" name="gender" value="Female">
                    <label class="form-check-label" for="gender2">
                      Female
                    </label>
                  </div>
                </div>
              </div>
            </fieldset>
            <div class="form-group row">
              <label class="col-sm-3 col-form-label" for="inputDate">Birth Date</label>
              <div class="col-sm-9">
                <input type="date" class="form-control" id="inputDate" name="date" placeholder="date" required>
              </div>
            </div>
            <div class="form-group row">
              <label for="inputClub" class="col-sm-3 col-form-label">Club</label>
              <div class="col-sm-9">
                <select class="form-control" id="inputClub" name="club" required>
                  <option value="" selected>Choose Club</option>
                  <?php
                  $sql = "SELECT * FROM club";
                  $rows = mysqli_query($conn, $sql);
                  while ($row = mysqli_fetch_assoc($rows)) {
                    echo "<option value=" . $row['Name'] . ">" . $row['Name'] . "</option>";
                  }
                  ?>
                </select>
              </div>
            </div>
            <div class="form-group row">
              <label for="inputDept" class="col-sm-3 col-form-label">Department</label>
              <div class="col-sm-9">
                <select class="form-control" id="inputDept" name="dept" required>
                  <option value="" selected>Select Department</option>
                  <?php
                  $sql = "SELECT * FROM department";
                  $rows = mysqli_query($conn, $sql);
                  while ($row = mysqli_fetch_assoc($rows)) {
                    echo "<option value=" . $row['Name'] . ">" . $row['Name'] . "</option>";
                  }
                  ?>
                </select>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-3 col-form-label" for="inputAdmit">Admission</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="inputAdmit" name="admit" placeholder="Admitted Semester" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-3 col-form-label" for="inputCredits">Credits</label>
              <div class="col-sm-9">
                <input type="number" class="form-control" id="inputCredits" name="credit" placeholder="Credits Completed" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-3 col-form-label" for="inputContact">Contacts</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="inputContact" name="contacts" placeholder="Separate by Comma" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-3 col-form-label" for="inputEmail">Email</label>
              <div class="col-sm-9">
                <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Enter Your Email" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-3 col-form-label" for="inputPassword">Password</label>
              <div class="col-sm-9">
                <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Enter Password" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-3 col-form-label" for="inputConfirm">Confirm</label>
              <div class="col-sm-9">
                <input type="password" class="form-control" id="inputConfirm" name="confirm" placeholder="Confirm Password" required>
              </div>
            </div>
            <div class="form-group text-center">
              <span>Existing Member? LogIn Instead |</span>
              <a href="login.php">Log In</a>
            </div>
            <div class="form-group row">
              <div class="col-sm-10">
                <button type="submit" class="btn btn-primary">Sign Up</button>
              </div>
            </div>
          </form>
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