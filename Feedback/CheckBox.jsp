<!DOCTYPE html>
	<html lang="en">
		<head>
			<title>Form</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width,initial-scale=1">
			<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			<link href="css/global.css" type="text/css" rel="stylesheet">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script src="<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		</head>
		<body>
			<div class="container-fluid bg">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
			</div>	
<!--Form start--->
<form class="form-container" action="CheckBox.jsp" method="do">
<h1><center>Generate form</center></h1><br>
<b><x style="color:#f1c40f;"></x></b><p>
	<div class="form-group">
		<b><label for="CheckBox" name="CheckBox">Question:</label></b>
		<input type="text" class="form-control" id="q1" name="q1" placeholder="Question" /><br>
		<input type="text" class="form-control" id="q1o1" name="q1o1" placeholder="option" /><br>
		<input type="text" class="form-control" id="q1o2" name="q1o2" placeholder="option" /><br>
		<input type="text" class="form-control" id="q1o3" name="q1o3" placeholder="option" /><br>
		<input type="text" class="form-control" id="q1o4" name="q1o4" placeholder="option" /><br>
		</div>
	<h5>
	<button type="button" class="btn btn-success btn-block" style="background:#4FB9BA;" onclick="addQuestion()">Add Mutilple Choice Question</button>
	<button type="submit" class="btn btn-success btn-block" style="background:#4FB9BA;">Next</button>
</form>
<!---Form end--->

</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</div>
</body>
</html>