<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*, java.sql.*" %>
    import javax.persistence.Column;
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
        FileInputStream fis=null;
        String c_id =request.getParameter("cid");
        String file = request.getParameter("project_file");
        
      

        try
        {
        	 String dbDriver="com.mysql.cj.jdbc.Driver";
      		String dbURL="jdbc:mysql://localhost:3306/assessment_portal";
      		Class.forName(dbDriver);
      		Connection con=DriverManager.getConnection(dbURL,"root","Root");
      		
     		
     		
     		
     		File image=new File(file);
     		fis=new FileInputStream(image);
     		
     		PreparedStatement ps=con.prepareStatement("insert into project(cid,project_file) values (?,?)");
     		
     		ps.setString(1,c_id);
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