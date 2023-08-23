package com.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
@WebServlet(name = "EditDataServlet",urlPatterns = "/EditDataServlet")
public class EditDataServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("first_name");
        String pass = request.getParameter("password");
        String id = request.getParameter("CNIC");
        String email = request.getParameter("email");


        // Database connection parameters
         Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Create a database connection
             conn = DBManager.getConnection();

            // Prepare the SQL statement
            String sql = "UPDATE info SET first_name = ?, password=?, CNIC=?, email=? WHERE CNIC = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, pass);
            stmt.setString(3, id);
            stmt.setString(4, email);
            stmt.setString(5,id);


            // Execute the statement
            int rowsAffected = stmt.executeUpdate();

            // Process the result
            if (rowsAffected > 0) {
                // Data updated successfully
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                out.println("<h2>Data updated successfully.</h2>");
                out.println("</body></html>");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/dashboard.jsp");
                rd.include(request,response);
            } else {
                // No rows were affected
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                out.println("<h2>No rows were affected.</h2>");
                out.println("</body></html>");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/dashboard.jsp");
                rd.include(request,response);
            }
        } catch (SQLException e) {
            // Handle any database errors
            e.printStackTrace();
        } finally {
            // Close the database resources
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
    }
    }

