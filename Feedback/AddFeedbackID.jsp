<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! PreparedStatement ps;
	ResultSet rs;
	Statement stmt;
	int rows;
%>
<%
	String email=request.getParameter("email");
	String f_id=request.getParameter("f_id");
	String password=request.getParameter("password");
	String table_name=email+f_id;
	table_name=table_name.replace(".","");
	table_name=table_name.replace("@","");
	String create_table="create table if not exists "
	+table_name+"_answers(user varchar(500) primary key);";
	out.println(table_name);
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
			stmt=con.createStatement();
			stmt.executeUpdate(create_table);
		%>
			<jsp:forward page="Radio.jsp">
			<jsp:param name="table_name" value="<%=table_name%>"/>
			</jsp:forward>
		<%
		}
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