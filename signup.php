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
  </style>
</head>

<body>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card mt-3 mb-3" style="border-radius: .5rem;">
          <div class="card-body pt-2 pb-2">
            <form action="register.php" method="POST">
              <center><img src="misc/logo.png"></center>
              <?php
              if (isset($_GET['error'])) {
                echo
                '<div class="alert alert-danger text-center pl-4 alert-dismissible fade show" role="alert">'
                  . $_GET["error"] .
                  '<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                          </button>
                      </div>';
                session_unset();
                session_destroy();
              }
              ?>
              <div class="form-group row mt-3">
                <label for="inputId" class="col-sm-3 col-form-label">Member ID</label>
                <div class="col-sm-9">
                  <input type="text" name="id" class="form-control" id="inputID" placeholder="Student ID" required>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputName" class="col-sm-3 col-form-label">Full Name</label>
                <div class="col-sm-9">
                  <input type="text" name="name" class="form-control" id="inputName" placeholder="Name" required>
                </div>
              </div>
              <fieldset class="form-group">
                <div class="row">
                  <label class="col-form-label col-sm-3 pt-0">Gender</label>
                  <div class="col-sm-3">
                    <div class="form-check form-check-inline">
                      <input type="radio" class="form-check-input" name="gender" id="gender1" value="Male">
                      <label class="form-check-label" for="gender1">
                        Male
                      </label>
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="form-check form-check-inline">
                      <input type="radio" class="form-check-input" name="gender" id="gender2" value="female">
                      <label class="form-check-label" for="gender2">
                        Female
                      </label>
                    </div>
                  </div>
                </div>
              </fieldset>
              <div class="form-group row">
                <label for="inputDate" class="col-sm-3 col-form-label">Birth Date</label>
                <div class="col-sm-9">
                  <input type="date" name="date" class="form-control" id="inputDate" placeholder="date" required>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputClub" class="col-sm-3 col-form-label">Club Interest</label>
                <div class="col-sm-9">
                  <select class="form-control" name="club" id="inputClub">
                    <option selected>Choose Club</option>
                    <?php
                    $sql = "SELECT Name FROM club";
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
                  <select class="form-control" name="dept" id="inputDept">
                    <option selected>Select Department</option>
                    <?php
                    $sql = "SELECT Name FROM department";
                    $rows = mysqli_query($conn, $sql);
                    while ($row = mysqli_fetch_assoc($rows)) {
                      echo "<option value=" . $row['Name'] . ">" . $row['Name'] . "</option>";
                    }
                    ?>
                  </select>
                </div>
              </div>
              <!-- <div class="form-group row">
                <label for="inputDept" class="col-sm-3 col-form-label">Department</label>
                <div class="col-sm-9">
                  <input type="text" name="dept" class="form-control" id="inputDept" placeholder="Department" required>
                </div>
              </div> -->
              <div class="form-group row">
                <label for="inputAdmit" class="col-sm-3 col-form-label">Admission</label>
                <div class="col-sm-9">
                  <input type="text" name="admit" class="form-control" id="inputAdmit" placeholder="Admitted Semester" required>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputCredits" class="col-sm-3 col-form-label">Credits</label>
                <div class="col-sm-9">
                  <input type="text" name="credit" class="form-control" id="inputCredits" placeholder="Credits Completed" required>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputContact" class="col-sm-3 col-form-label">Contacts</label>
                <div class="col-sm-9">
                  <input type="text" name="contacts" class="form-control" id="inputContact" placeholder="Separate by Comma" required>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputEmail" class="col-sm-3 col-form-label">Email</label>
                <div class="col-sm-9">
                  <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Enter Your Email" required>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputPassword" class="col-sm-3 col-form-label">Password</label>
                <div class="col-sm-9">
                  <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Enter Password" required>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputConfirm" class="col-sm-3 col-form-label">Confirmation</label>
                <div class="col-sm-9">
                  <input type="password" name="confirm" class="form-control" id="inputConfirm" placeholder="Confirm Password" required>
                </div>
              </div>
              <div class="form-group text-center pt-2">
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
  </div>
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>