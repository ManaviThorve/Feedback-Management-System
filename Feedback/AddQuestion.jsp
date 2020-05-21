<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! PreparedStatement ps;
	ResultSet rs;
	Statement stmt;
	int rows;
%>
<%
	String qtype=request.getParameter("type");
	String question=request.getParameter("q1");
	String opt1=request.getParameter("opt1");
	String opt2=request.getParameter("opt2");
	String opt3=request.getParameter("opt3");
	String opt4=request.getParameter("opt4");
	String table_name=request.getParameter("table_name");
	String table=table_name.replace(".","");
	table=table.replace("@","");
	String create_table="create table if not exists "
	+table
	+" (que varchar(500),"
	+"qtype varchar(20),"
	+"opt1 varchar(100),"
	+"opt2 varchar(101),"
	+"opt3 varchar(102),"
	+"opt4 varchar(104));";
	String insert="insert into "+table+" values(?,?,?,?,?,?)";
	question=question.replace("?","");
	question=question.replace(" ","_");
	out.println(question);
	String add_question="alter table "+table+"_answers add column "+question+" varchar(500);";
	out.println(add_question);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbacksystem?serverTimezone=UTC","root","");
		stmt=con.createStatement();
		stmt.executeUpdate(create_table);
		ps=con.prepareStatement(insert);
		ps.setString(1,question);
		ps.setString(2,qtype);
		ps.setString(3,opt1);
		ps.setString(4,opt2);
		ps.setString(5,opt3);
		ps.setString(6,opt4);
		ps.executeUpdate();
		stmt=con.createStatement();
		stmt.executeUpdate(add_question);
		%>
			<jsp:forward page="Radio.jsp">
			<jsp:param name="table_name" value="<%=table_name%>"/>
			</jsp:forward>
		<%
	}
	catch(SQLIntegrityConstraintViolationException e)
	{
		out.println(e);
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