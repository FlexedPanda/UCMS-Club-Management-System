<?php
include('dbconnect.php');

?>

<!DOCTYPE html>
<html>

<head>
	<title>
		Test
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
	if (array_key_exists('accept', $_GET)) {
		button1();
	} else if (array_key_exists('reject', $_GET)) {
		button2();
	}
	function button1()
	{
		echo "This is Button1 that is selected";
	}
	function button2()
	{
		echo "This is Button2 that is selected";
	}
	?>

	<form method="get">
		<input type="hidden" name="rqst" value="">
		<button class="button" name="accept" value="<?php echo $id; ?>">Accept</button>

		<button class="button" name="reject" value="<?php echo $id; ?>">Reject</button>
	</form>
</body>

</html>