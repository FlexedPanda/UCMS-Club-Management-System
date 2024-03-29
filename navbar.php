<?php
include('dbconnect.php');
?>

<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand ml-md-5 ml-sm-0 " href="https://www.bracu.ac.bd/">BRAC University</a>
    <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation"></button>
    <div class="collapse navbar-collapse" id="collapsibleNavId">
        <ul class="navbar-nav ml-auto mt-0 mr-5">

            <?php if ($_SESSION["view"] == "Home") { ?>
                <li class="nav-item active ml-2 mr-2">
                    <a class="nav-link" href="index.php">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="login.php">LogIn</a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="signup.php">SignUp</a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="apply.php">Sponsorship</a>
                </li>

            <?php } else if ($_SESSION["view"] == "Member"){ ?>
                <form class="form-inline my-2 my-lg-0 mr-2">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                </form>
                <li class="nav-item active ml-2 mr-2">
                    <a class="nav-link" href="announcement.php">Announcements<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="event.php">Events</a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="profile.php">Profile</a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="logout.php">LogOut</a>
                </li>

            <?php } else if ($_SESSION["view"] == "Panel"){ ?>
                <form class="form-inline my-2 my-lg-0 mr-2">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                </form>
                <li class="nav-item active ml-2 mr-2">
                    <a class="nav-link" href="announcement.php">Announcements<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="event.php">Events</a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="memberlist.php">Members</a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="pending.php">Pendings</a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="request.php">Requests</a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="contact.php">Contacts</a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="profile.php">Profile</a>
                </li>
                <li class="nav-item ml-2 mr-2">
                    <a class="nav-link" href="logout.php">LogOut</a>
                </li>

            <?php } ?>
        </ul>
    </div>
</nav>