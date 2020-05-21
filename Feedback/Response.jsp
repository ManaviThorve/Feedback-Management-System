<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! PreparedStatement ps;
	ResultSet rs;
	Statement stmt;
	int rows;
%>
<%
	String table_name=request.getParameter("table_name");
	String i=request.getParameter("i");
	String user=request.getParameter("user");
	int j=Integer.parseInt(i);
	j=j-1;
	int k=1;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbacksystem?serverTimezone=UTC","root","");
		while(j!=0)
		{
			String question=request.getParameter("question"+k);
			String answer=request.getParameter("answer"+k);
			String update="update "+table_name+"_answers set "+question+"=? where user=?;";
			out.println(question);
			out.println(answer);
			ps=con.prepareStatement(update);
			ps.setString(1,answer);
			ps.setString(2,user);
			rows=ps.executeUpdate();
			k++;
			j--;
		}
		if(rows>0)
		{
			response.sendRedirect("ThankYou.jsp");
		}
	}
	catch(SQLSyntaxErrorException e)
	{
		out.println(e);
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>