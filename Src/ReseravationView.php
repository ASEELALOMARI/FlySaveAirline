<!DOCTYPE html>
<html lang="en">

<head>
    <title>Reservation Details</title>
    <style>

    </style>
    <link rel="stylesheet" href="FlySave.Css">
</head>

<body>
    <ul id="noPrint">
        <li> <img src="Logo02.png" alt="home" height="70px" width="100px"></li>
        <li><a href="#home">Home</a></li>
        <li><a href="#news">Log in</a></li>
        <li> <a href="http://">View your booking</a></li>
        <li><a href="#contact">Abuot us</a></li>

    </ul>

    <div class="ResBox" id="Res">
        <?php
$localhost = "localhost";
$user = "root";
$password = "";
$database = "flysaveairline";


$con = mysqli_connect($localhost, $user, $password, $database)
    or die(mysqli_connect_error());


if(!empty($_REQUEST['ResNum'])){
    $ResNum = $_REQUEST['ResNum'];
}
else echo'<h3 style="color:#BADDF2;">Reservation number is empty</h3>';



$query01 = mysqli_query($con, "SELECT * FROM res_tic  WHERE Reservation_num ='$ResNum'")
or die(mysqli_connect_error()) ;


if($query01->num_rows>0){
echo '<h2 class="bold"> Reservation Details</h2>';
}else echo "<h3> We couldn't find your reservation </h3>";
echo "<hr>";

while ($row = mysqli_fetch_array($query01)) {

    $tic = $row['TicketNo'];
    $query02 = mysqli_query($con, "SELECT ticket.TicketNo, traveler.Gender, traveler.FirstName,
    traveler.LastName, flight.FlightNo, flight.From, flight.To, flight.DepartureTime,
    flight.ArrivalTime, flight.Flight_date
    FROM traveler
    JOIN ticket ON traveler.TravelerID = ticket.TravelerID
    JOIN flight ON flight.FlightNO = ticket.Flight_ID 
    WHERE TicketNo = '$tic'");
    
    while ($row = mysqli_fetch_array($query02, MYSQLI_ASSOC)) {
        echo "<table class='TicBox'>
    <tr>
    <td>    </td>
    <td>   </td>
    <td>    </td>
    <td>   </td>
    <td>    </td>
    <td class='bold'> Ticket </td>
     </tr>";
        echo "<tr>";
        echo "<td class='travelerName'>". $row['Gender'] . " " . $row['FirstName'] . " " . $row['LastName'] . "</td>";
        echo "<td>"  . '&nbsp &nbsp &nbsp &nbsp' . "</td>";
        echo "<td> </td>";
        echo "<td> " . '&nbsp &nbsp &nbsp &nbsp' . "</td>";
        echo "<td> </td>";
        echo "<td>" . $row['TicketNo'] . "</td>";
        echo "</tr>";
        //new line
        echo "<tr> <td> " . '&nbsp' . " </td></tr>";
        echo "<tr>
    <td class ='bold'> Flight </td>
    <td> </td>
    <td class='bold'> Form </td>
    <td> </td>
    <td class='bold'> To </td>
    <td> </td>
    </tr>";
        echo "<tr>";
        echo "<td> " . $row['FlightNo'] . "</td>";
        echo "<td> </td>";
        echo " <td>" . $row['From'] . "</td>";
        echo "<td> </td>";
        echo "<td>" . $row['To'] . "</td>";
        echo "<td> </td>";
        echo "</tr>";
        //new line
        echo "<tr> <td> " . '&nbsp' . " </td></tr>";
        echo "<tr>
    <td class='bold'> Date </td>
    <td> </td>
    <td class='bold'> Departs time </td>
    <td> </td>
    <td class='bold'> Arrival time </td>
    <td> </td>
    </tr>";
        echo "<tr>";
        echo "<td>" . $row['Flight_date'] . "</td>";
        echo "<td> </td>";
        echo "<td>" . $row['DepartureTime'] . "</td>";
        echo "<td> </td>";
        echo "<td>" . $row['ArrivalTime'] . "</td>";
        echo "<td> </td>";
        echo "</tr>";
        echo "</table>";
    }
    echo "<br/><hr><br/>";
    
}//end of first while
?>
</div>

<div class="center">
<button class="button button:hover" onClick="printElement()">Print</button>
</div>

<img class="hid" src="logo01.png" alt="logo" width="110px" height="90px">

    <script>
    function printElement() {
        var prtContent = document.getElementById("Res");
        document.write('<html><head><title>Reservation Window</title></head><body><br>');
        document.write('<img src="logo01.png" alt="logo" width="110px" height ="90px">');
        document.write(prtContent.innerHTML);
        document.write('<br></body></html>');
        document.close();
        focus();
        print();
        close();
        location.reload();
    }
    </script>
</body>

</html>