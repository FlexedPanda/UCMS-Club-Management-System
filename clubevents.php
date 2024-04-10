<?php
include('dbconnect.php');
include('session.php');
include('navbar.php');
?>

<!doctype html>
<html lang="en">

<head>
  <title>Home Page</title>
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
    $club = $_SESSION["club"];
    $sql1 = "SELECT * FROM approved_event WHERE Club = '$club'";
    $rows1 = mysqli_query($conn, $sql1); 
    
    $sql2 = "SELECT * FROM club WHERE Name = '$club'";
    $rows2 = mysqli_query($conn, $sql2);
    $row2 = mysqli_fetch_assoc($rows2); ?>
  <div class="container">
    <?php if ($_SESSION["view"] == "Member") { ?>
      <div class="row mt-5 ml-2 mr-2">
    <?php } else { ?>
      <div class="row mt-2 ml-2 mr-2">
    <?php } ?>
      <?php while($row1 = mysqli_fetch_assoc($rows1)) {?>
        <div class="col-md-4 my-3">
          <div class="card" style="border-radius: .5rem;">
            <div class="card-body">
              <center><img src="misc/logo.png"></center>
              <h6 class="card-title text-center text-dark"><?php echo $row1["Club"]; ?></h6>
              <h4 class="card-title py-2 text-center"><?php echo $row1["Name"]; ?></h4><hr>
              <h6 class="card-text m-2 pl-4 text-dark"><b>Date : </b><?php echo date("jS M, Y", strtotime($row1["Date"])); ?></h6>
              <h6 class="card-text m-2 pl-4 text-dark"><b>Venue : </b><?php echo $row1["Venue"]; ?></h6>
              <h6 class="card-text m-2 pl-4 text-dark"><b>Entry Fee : </b><?php echo $row1["Entry_Fee"]; ?> taka</h6><hr>
              <?php if ($_SESSION["view"] == "Panel" || $_SESSION["view"] == "Advisor") {?>
                <h6 class="card-text m-2 pl-4 text-dark"><b>Club Reserve : </b><?php echo $row2["Club_Reserve"]; ?> taka</h6>
                <h6 class="card-text m-2 pl-4 text-dark"><b>Event Cost : </b><?php echo $row1["Event_Cost"]; ?> taka</h6>
                <h6 class="card-text m-2 pl-4 text-dark"><b>Event Fundings : </b><?php echo $row1["Fundings"]; ?> taka</h6>
                <h6 class="card-text m-2 pl-4 text-dark"><b>Event Earnings : </b><?php echo $row1["Earnings"]; ?> taka</h6><hr>
              <?php } ?>
              <h6 class="card-text m-2 pl-4 text-dark"><b>Capacity : </b><?php echo $row1["Capacity"]; ?> members</h6>
              <h6 class="card-text m-2 pl-4 text-dark"><b>Participants : </b><?php echo $row1["Participants"]; ?> members</h6><hr>

              <?php if ($_SESSION["view"] == "Member" || $_SESSION["view"] == "Panel") {
                $id = $_SESSION["id"];
                $eid = $row1["Event_ID"];

                $sql2 = "SELECT * FROM participate WHERE Event_ID = $eid AND Member_ID = $id";
                $rows2 = mysqli_query($conn, $sql2); ?>

                <?php if (mysqli_num_rows($rows2) == 0) { ?>
                  <form class="form-inline m-2 pl-3" action="participate.php" method="POST">
                    <button class="btn btn-primary mt-2" name="join" value="<?php echo $row1["Event_ID"]; ?>">Participate</button>
                    <button class="btn btn-secondary mt-2 ml-3" name="leave" value="<?php echo $row1["Event_ID"]; ?>" disabled>Cancel</button>
                    <input type="hidden" name="clubevent">
                  </form>
                <?php } else { ?>
                  <form class="form-inline m-2 pl-3" action="participate.php" method="POST">
                    <button class="btn btn-secondary mt-2" name="join" value="<?php echo $row1["Event_ID"]; ?>" disabled>Participated</button>
                    <button class="btn btn-danger mt-2 ml-3" name="leave" value="<?php echo $row1["Event_ID"]; ?>">Cancel</button>
                    <input type="hidden" name="clubevent">
                  </form>
                <?php } ?>
              <?php } else { ?>
                <form class="form-inline m-2 pl-4 text-light" action="organize.php" method="POST">
                  <button class="btn btn-danger mt-2" name="conclude" value="<?php echo $row1["Event_ID"]; ?>">Conclude</button>
                  <a class="btn btn-primary mt-2 ml-3" href="announce.php?msg=Post Event Announcement">Announce</a>
                  <input type="hidden" name="clubevent">
                </form>
              <?php } ?>
            </div>
          </div>
        </div>
      <?php } ?>
    </div>
  </div>
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>