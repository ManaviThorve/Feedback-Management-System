<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! 
String table_name,msg;
%>
<%
	table_name=request.getParameter("table_name");
	msg=request.getParameter("msg");
%>
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
			<script language="javascript" type="text/javascript" src="js/first.js">
			</script>
		</head>
		<body>
			<div class="container-fluid bg">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
			</div>	
<!--Form start--->
<form class="form-container" name="form1" action="">
<h1><center>Radio Buttons</center></h1><br>
<b><x style="color:#f1c40f;"></x></b><p>
	<div class="form-group">
		<b><label for="question" name="question">Question for Personal Response:</label></b>
		<input type="hidden" name="table_name" value="<%=table_name%>"/>
		<input type="hidden" name="type" value="TextArea"/>
		<input type="hidden" name="lastquestion" value="<%=msg%>"/>
		<input type="text" class="form-control" id="q1" name="q1" placeholder="Question" /><br>
	</div>
	<h5>
	<button name="next" value="next_index" type="submit" class="btn btn-success btn-block" style="background:#4FB9BA;" onclick="formCreated()">Finish</button>
</form>
<!---Form end--->

</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</div>
</body>
</html>