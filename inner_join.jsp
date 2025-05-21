<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inner Join Example</title>
</head>
<body>
    <%
       

        // Define database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/assessment_portal";
        String dbUser = "root";
        String dbPassword = "Root";

        // Initialize variables
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Establish a database connection
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Create an SQL query for the inner join
            String sqlQuery = "SELECT * FROM assignment INNER JOIN  ON project.cid = assignment.cid";

            // Create a statement and execute the query
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sqlQuery);

            // Iterate through the result set and display data
            while (resultSet.next()) {
                String column1Data = resultSet.getString("cid");
                String column2Data = resultSet.getString("name");
                // Add more columns as needed

                // Display the data or perform other operations
                out.println("Cid: " + column1Data + "<br>");
                out.println("name: " + column2Data + "<br>");
                // Add more columns as needed
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>