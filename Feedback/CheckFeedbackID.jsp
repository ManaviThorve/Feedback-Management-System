<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! PreparedStatement ps;
	ResultSet rs;
	Statement stmt;
	int rows;
%>
<%
	String f_id=request.getParameter("f_id");
	String user=request.getParameter("email");
	String search_email="select email from feedback_id_table where f_id="+f_id+";";
	try
	{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbacksystem?serverTimezone=UTC","root","");
			stmt=con.createStatement();
			rs=stmt.executeQuery(search_email);
			rs.next();
			String email=rs.getString(1);
			email=email.replace(".","");
			email=email.replace("@","");
			table_name=email+f_id;
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