<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body>
    <%
        FileInputStream fis=null;
        String candidate_id =request.getParameter("cid");
        String file = request.getParameter("file");
        
      

        try
        {
        	 String dbDriver="com.mysql.cj.jdbc.Driver";
     		String dbURL="jdbc:mysql://localhost:3306/assessment_portal";
     		Class.forName(dbDriver);
     		Connection con=DriverManager.getConnection(dbURL,"root","Root");
     		
     		
     		File image=new File(file);
     		fis=new FileInputStream(image);
     		
     		PreparedStatement ps=con.prepareStatement("insert into assignment(cid,assignment_file) values (?,?)");
     		
     		ps.setString(1,candidate_id);
     		ps.setBinaryStream(2 ,(InputStream) fis ,(int)(image.length()));
     		int count=ps.executeUpdate();
     		
     		if(count>0)
     		{
     			%>
     			<h1> uploaded successfully</h1>
     			<%
     		}
     			else
     			{
     				out.print("not successful");
     			}
     			
     		
        }
        catch(Exception e)
        {
     	  out.print("cannot process"+e); 
        }
        

     %>

</body>
</html>