<?php
include('dbconnect.php');
session_start();
?>

<!DOCTYPE html> 
<html> 
	
<head> 
	<title> 
		How to call PHP function 
		on the click of a Button ? 
	</title> 
</head> 

<body style="text-align:center;"> 
	
	<h1 style="color:green;"> 
		GeeksforGeeks 
	</h1> 
	
	<h4> 
		How to call PHP function 
		on the click of a Button ? 
	</h4> 
	
	<?php
		if(array_key_exists('button', $_GET)) { 
			button1(); 
		} 
		else if(array_key_exists('button', $_GET)) { 
			button2(); 
		} 
		function button1() { 
			echo "This is Button1 that is selected"; 
		} 
		function button2() { 
			echo "This is Button2 that is selected"; 
		} 
	?> 

	<form method="get"> 
		<button class="button" name="button" value="Button1">Participate</button> 
		
		<button class="button" name="button" value="Button2">Participate</button>
	</form> 
    <?php echo $_GET["button"];?>
</body> 

</html> 
