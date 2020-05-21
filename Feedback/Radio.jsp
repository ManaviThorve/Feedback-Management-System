<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! 
String table_name;
%>
<%
	table_name=request.getParameter("table_name");
%>
<!DOCTYPE html>
	<html lang="en">
		<head>
			<title>Form</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width,initial-scale=1">
			<link rel="stylesheet" type="text/css" href="					https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<form class="form-container" action="AddQuestion.jsp">
<h1><center>Mutilple Choice Questions</center></h1><br>
<b><x style="color:#f1c40f;"></x></b><p>
	<div class="form-group">
		<b><label for="question" name="question">Question:</label></b>
		<input type="hidden" name="table_name" value="<%=table_name%>"/>
		<input type="hidden" name="type" value="radio"/>
		<input type="text" class="form-control" id="q1" name="q1" placeholder="Question" /><br>
		<input type="text" class="form-control" id="opt1" name="opt1" placeholder="option" /><br>
		<input type="text" class="form-control" id="opt2" name="opt2" placeholder="option" /><br>
		<input type="text" class="form-control" id="opt3" name="opt3" placeholder="option" /><br>
		<input type="text" class="form-control" id="opt4" name="opt4" placeholder="option" /><br>
		</div>
	<h5>
	<button type="submit" class="btn btn-success btn-block" style="background:#4FB9BA;">Add Mutilple Choice Question</button>
	<button type="button" class="btn btn-success btn-block" style="background:#4FB9BA;" onclick="nextQuestion()">Next</button>
</form>
<!---Form end--->

</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</div>
</body>
</html>