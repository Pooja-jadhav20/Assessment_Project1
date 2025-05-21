<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body
{
background-color:pink;
}

</style>
</head>
<body>
    
    <form action="upload_assignment_process.jsp" method="post" style="color:green"; align="center" >
    <h1>UPLOAD THE ASSIGNMENT FILE</h1>
        cid:<input type="text" name="cid"><br><br>
        Select File: <input type="file" name="file" ><br><br>
        <input type="submit" value="Upload">
    </form>
</body>

</body>
</html>