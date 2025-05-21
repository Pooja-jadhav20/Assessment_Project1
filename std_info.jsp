<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
background-color:skyblue;
}
</style>
</head>
<body>
<%
try {
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	 String dbDriver="com.mysql.cj.jdbc.Driver";
		String dbURL="jdbc:mysql://localhost:3306/assessment_portal";
		Class.forName(dbDriver);
		Connection con=DriverManager.getConnection(dbURL,"root","Root");
	%>
	<font size="+3" color="green"></b>
	<%

    PreparedStatement stmt = con.prepareStatement("SELECT * FROM register WHERE email=? AND password=?");
    stmt.setString(1, email);
    stmt.setString(2, password);
    ResultSet rs = stmt.executeQuery();
    out.print("successfully loggedin");
    %>
    <form action="" >
    <a href="upload_assignment.jsp">click here for uploading the Assignment File</a><br><br>
    <a href="upload_project.jsp">click here for uploading the Project File</a>
    
    </form>
    <% 
    rs.close();
	con.close();	
}
catch(Exception e)
{
%>
</font>
<font size="+4" color="red"></b>
<%
out.print("unable to connect to the database"+e);
}

%>
</font>
}

</body>
</html>