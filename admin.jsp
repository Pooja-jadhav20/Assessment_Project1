<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	
	    String dbDriver="com.mysql.cj.jdbc.Driver";
		String dbURL="jdbc:mysql://localhost:3306/assessment_portal";
		Class.forName(dbDriver);
		Connection con=DriverManager.getConnection(dbURL,"root","Root");
	%>
	<font size="+3" color="green">
	<%

    PreparedStatement stmt = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
    stmt.setString(1, username);
    stmt.setString(2, password);
    ResultSet rs = stmt.executeQuery();
    out.print("successfully loggedin");
    rs.close();
	con.close();	
}
catch(Exception e)
{
%>
</font>
<font size="+4" color="pink"></b>
<%
out.print("unable to connect to the database"+e);
}

%>
</font>
}


</body>
</html>