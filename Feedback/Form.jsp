<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! PreparedStatement ps;
	ResultSet rs,rs_while;
	Statement stmt;
	int rows;
%>
<html lang="en">
		<head>
			<title>Give Feedback</title>
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
		<form method="do" name="main" action="Response.jsp">
		<h1><font face="Lucida Calligraphy"><center>FEEDBACK</center></font></h1><br>
<%
	String table_name=request.getParameter("table_name");
	String user=request.getParameter("email");
	String select_rows="select * from "+table_name+";";
	String insert="insert into "+table_name+"_answers(user) values(?)";
	String question,qtype,opt1,opt2,opt3,opt4;
	try
	{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbacksystem?serverTimezone=UTC","root","");
			stmt=con.createStatement();
			rs=stmt.executeQuery(select_rows);
			ps=con.prepareStatement(insert);
			ps.setString(1,user);
			ps.executeUpdate();
			int i=1;
			while(rs.next())
			{
				question=rs.getString(1);
				qtype=rs.getString(2);
				opt1=rs.getString(3);
				opt2=rs.getString(4);
				opt3=rs.getString(5);
				opt4=rs.getString(6);
				if(qtype.equals("Radio"))
				{%>
				<div class="form-container" name="div"+<%=i%>" method="do">
				<h2><center>Question <%=i%></center></h2><br>
				<b><x style="color:#f1c40f;"></x></b><p>
				<div class="form-group">
				<input type="hidden" name="user" value="<%=user%>"/>
				<input type="hidden" name="table_name" value="<%=table_name%>"/>
				<input type="hidden" name="question<%=i%>" value="<%=question%>"/>
				<b><label for="ques"><%=question%></label></b><br><br>
				<input type="radio"  name="answer<%=i%>" value="<%=opt1%>" required />
				<label for="radio"><%=opt1%></label></input><br><br>
				<input type="radio"  name="answer<%=i%>" value="<%=opt2%>" required />
				<label for="radio"><%=opt2%></label></input><br><br>
				<input type="radio"  name="answer<%=i%>" value="<%=opt3%>" required />
				<label for="radio"><%=opt3%></label></input><br><br>
				<input type="radio"  name="answer<%=i%>" value="<%=opt4%>" required />
				<label for="radio"><%=opt4%></label></input><br><br>
				</div>
				</div>
				<%}
				if(qtype.equals("Checkbox"))
				{%>
				<div class="form-container" name="div"+<%=i%>" method="do">
				<h2><center>Question <%=i%></center></h2><br>
				<b><x style="color:#f1c40f;"></x></b><p>
				<div class="form-group">
				<input type="hidden" name="user" value="<%=user%>"/>
				<input type="hidden" name="table_name" value="<%=table_name%>"/>
				<input type="hidden" name="question<%=i%>" value="<%=question%>"/>
				<b><label for="ques"><%=question%></label></b><br><br>
				<input type="checkbox"  name="answer<%=i%>" value="<%=opt1%>"/>
				<label for="checkbox"><%=opt1%></label></input><br><br>
				<input type="checkbox"  name="answer<%=i%>" value="<%=opt2%>"/>
				<label for="checkbox"><%=opt2%></label></input><br><br>
				<input type="checkbox"  name="answer<%=i%>" value="<%=opt3%>"/>
				<label for="checkbox"><%=opt3%></label></input><br><br>
				<input type="checkbox"  name="answer<%=i%>" value="<%=opt4%>"/>
				<label for="checkbox"><%=opt4%></label></input><br><br>
				</div>
				</div>
				<%}
				if(qtype.equals("TrueFalse"))
				{%>
				<div class="form-container" name="div"+<%=i%>" method="do">
				<h2><center>Question <%=i%></center></h2><br>
				<b><x style="color:#f1c40f;"></x></b><p>
				<div class="form-group">
				<input type="hidden" name="user" value="<%=user%>"/>
				<input type="hidden" name="table_name" value="<%=table_name%>"/>
				<input type="hidden" name="question<%=i%>" value="<%=question%>"/>
				<b><label for="ques"><%=question%></label></b><br><br>
				<input type="radio" name="answer<%=i%>" value="<%=opt1%>" required />
				<label for="radio"><%=opt1%></label></input><br><br>
				<input type="radio"  name="answer<%=i%>" value="<%=opt2%>" required />
				<label for="radio"><%=opt2%></label></input><br><br>
				</div>
				</div>
				<%}
				if(qtype.equals("TextArea"))
				{%>
				<div class="form-container" name="div"+<%=i%>" method="do">
				<h2><center>Question <%=i%></center></h2><br>
				<b><x style="color:#f1c40f;"></x></b><p>
				<div class="form-group">
				<input type="hidden" name="user" value="<%=user%>"/>
				<input type="hidden" name="table_name" value="<%=table_name%>"/>
				<input type="hidden" name="question<%=i%>" value="<%=question%>"/>
				<b><label for="ques"><%=question%></label></b><br><br>
				<input type="textarea" class="form-control" rows="200" name="answer<%=i%>" placeholder=" " required />
				</div>
				</div>
				<%}
				i=i+1;
			}
			%>
				<div class="form-container">
				<input type="hidden" name="i" value="<%=i%>">
				<button name="add" type="submit" class="btn btn-success btn-block" style="background:#4FB9BA;"/>Submit</button>
				</div>
				</form>
			<%
	}
	catch(SQLIntegrityConstraintViolationException e)
	{
		out.println(e);
	}	
	catch(Exception e)
	{		
		out.println(e);
	}
%>
</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</div>
</body>
</html>