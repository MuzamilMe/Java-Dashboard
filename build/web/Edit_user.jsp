<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Data</title>
</head>
<body>
    <h1>Edit Data</h1>

    <%-- Retrieve the existing data from the database based on the ID --%>
     <%@page import ="javax.servlet.RequestDispatcher"
            <%@page import="java.sql.DriverManager"%>
             <%@page import="java.sql.ResultSet"%>
            <%@page import="java.sql.Statement"%>
            <%@page import="java.sql.Connection"%>

    <%
        String id = request.getParameter("CNIC");
        String existingData = ""; // variable to store the existing data
        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:1527/information";
        String username = "root";
        String password = "1234";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            // Create a database connection
            conn = DriverManager.getConnection(jdbcUrl, username, password);

            // Prepare the SQL statement
            String sql = "SELECT data FROM info WHERE CNIC = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);

            // Execute the statement
            rs = stmt.executeQuery();

            // Retrieve the existing data
            if (rs.next()) {
                existingData = rs.getString("data");
            }
        } catch (SQLException e) {
            // Handle any database errors
            e.printStackTrace();
        } finally {
            // Close the database resources
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>

    <%-- Display the form with the existing data --%>
    <form action="EditDataServlet" method="get">
        <input type="hidden" name="id" value="<%= id %>">

        <label for="existingData">Existing Data:</label>
        <input type="text" id="existingData" name="existingData" value="<%= existingData %>" disabled><br><br>

        <label for="newData">New Data:</label>
        <input type="text" id="newData" name="newData" required><br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
