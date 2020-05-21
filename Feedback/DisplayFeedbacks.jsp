<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! PreparedStatement ps;
	ResultSetMetaData rsmd;
	ResultSet rs,rs1;
	Statement stmt,stmt1;
	int rows,cols;
%>
<%
	String f_id=request.getParameter("f_id");
	String pass=request.getParameter("pass");
	String search_email="select email from feedback_id_table where f_id="+f_id+";";
	try
	{
		if(search_email.equals(null))
		{
			response.sendRedirect("ViewFeedback.jsp?message='Invalid feedback id or password! Please try again'");
		}
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbacksystem?serverTimezone=UTC","root","");
			stmt=con.createStatement();
			rs=stmt.executeQuery(search_email);
			rs.next();
			String email=rs.getString(1);
			email=email.replace(".","");
			email=email.replace("@","");
			String table_name=email+f_id;
			String query="select *from "+table_name+"_answers where 1;";
			stmt1=con.createStatement();
			rs1=stmt1.executeQuery(query);
			rsmd=rs1.getMetaData();
			cols=rsmd.getColumnCount();
			for(int i=1;i<=cols;i++)
			{
				out.println(rsmd.getColumnName(i)+"|");
			}
			out.println("<br>");
			while(rs1.next())
			{
				for(int i=1;i<=cols;i++)
				{
					out.println(rs1.getString(i)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|");
				}
			}
	%>
	<%
	}
		
	catch(Exception e)
	{		
		out.println(e);
	}
%>