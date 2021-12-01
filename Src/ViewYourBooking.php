<!DOCTYPE html>
<html>
<title>View Your Booking</title> 

<link rel="stylesheet" href="FlySave.Css">
    <style>
  body {
     background-image: url("backgraund003.jpg") ;
  }
  .ResBox2 {
    width: 500px;
    padding: 30px;
  }
  .button2 {
      font-size: 18px;
  }
</style>

</head>
<body>
      <ul>
        <li> <img src="Logo02.png" alt="home" height="70px" width="100px"></li>
        <li><a href="#home">Home</a></li>
        <li><a href="Login.php">Log in</a></li>
        <li> <a class="active" onclick= "refresh()">View your booking</a></li>
        <li><a href="#contact">Abuot us</a></li> 
      </ul>

      <?php
    $localhost = "localhost";
    $user = "root";
    $password = "";
    $database = "flysaveairline";
    
    $con = mysqli_connect($localhost, $user, $password, $database)
    or die(mysqli_connect_error());
    ?>
    <div class="ResBox ResBox2">
    <form action="ReseravationView.php" method="post">
        <label for="fname"><h3 style="color:#4B4B4B;">Enter your reservation number: <h3></label>
        <input class="inputBox" type="text" name="ResNum"><br><br>
        <input class="button button:hover button2" type="submit" value="Search">
    </form></div>
    <script>
        function refresh(){
            location.reload();
        }
    </script>



      </body>
</html>