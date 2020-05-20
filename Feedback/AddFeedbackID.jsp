<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! PreparedStatement ps;
	ResultSet rs;
	int rows;
%>
<%
	String email=request.getParameter("email");
	String f_id=request.getParameter("f_id");
	String password=request.getParameter("password");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbacksystem?serverTimezone=UTC","root","");
		ps=con.prepareStatement("insert into feedback_id_table values(?,?,?)");
		ps.setString(1,email);
		ps.setString(2,f_id);
		ps.setString(3,password);
		rows=ps.executeUpdate();
		if(rows>0)
		{
		%>
			<jsp:forward page="GenerateForm.jsp">
			<jsp:param name="dlNO" value=""/>
			</jsp:forward>
		<%
		}
	}
	catch(SQLIntegrityConstraintViolationException e)
	{
		
	}		
	catch(Exception e)
	{		
	
		out.println(e);
	}
%>