<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! PreparedStatement ps;
	ResultSet rs;
	Statement stmt;
	int rows;
%>
<%
	String msg=request.getParameter("next");
	String check=request.getParameter("lastquestion");
	out.println(msg);
	String qtype=request.getParameter("type");
	String filename=qtype+".jsp";
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
	String add_question="alter table "+table+"_answers add column "+question+" varchar(500);";
	try
	{
		if(!question.equals(""))
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
		}
		if(check.equals("next_checkbox"))
		{%>
			<jsp:forward page="Checkbox.jsp">
			<jsp:param name="table_name" value="<%=table_name%>"/>
			<jsp:param name="msg" value="<%=msg%>"/>
			</jsp:forward>
		<%}
		if(check.equals("next_truefalse"))
		{%>
			<jsp:forward page="TrueFalse.jsp">
			<jsp:param name="table_name" value="<%=table_name%>"/>
			<jsp:param name="msg" value="<%=msg%>"/>
			</jsp:forward>
		<%}
		if(check.equals("next_textarea"))
		{%>
			<jsp:forward page="TextArea.jsp">
			<jsp:param name="table_name" value="<%=table_name%>"/>
			<jsp:param name="msg" value="<%=msg%>"/>
			</jsp:forward>
		<%}
		if(check.equals("next_index"))
		{%>
			<jsp:forward page="index.html">
			<jsp:param name="table_name" value="<%=table_name%>"/>
			<jsp:param name="msg" value="<%=msg%>"/>
			</jsp:forward>
		<%}
		else
		{
		%>
			<jsp:forward page="<%=filename%>">
			<jsp:param name="table_name" value="<%=table_name%>"/>
			<jsp:param name="msg" value="<%=msg%>"/>
			</jsp:forward>
		<%}
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