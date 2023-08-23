package com.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/Delete_user")
public class Delete_user extends HttpServlet {


    int row;



    public void doGet(HttpServletRequest req,HttpServletResponse rsp ) throws IOException,ServletException
    {

        rsp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = rsp.getWriter();
        Connection connection = DBManager.getConnection();
        Statement st = null;
        PreparedStatement ps = null;






        try {
            String cnic = req.getParameter("cnic");


             String q = "DELETE from info where CNIC =?";

            st = connection.createStatement();
            ps = connection.prepareStatement(q);
            ps.setString(1,cnic);


           row= ps.executeUpdate();
            st.close();
            connection.close();


            out.println("<font color='green'>Record Deleted "+cnic+"   </font>");
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/dashboard.jsp");
            rd.include(req, rsp);


        }  catch (SQLException ex) {
               ex.printStackTrace();
            out.println("<font color='red'>  Record Failed   </font>");

        }


    }

}