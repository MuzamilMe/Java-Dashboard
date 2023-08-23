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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "Register",urlPatterns = "/Register")
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Statement st = null;
        PreparedStatement ps = null;
        Connection connection = DBManager.getConnection();


        try {


            String name = request.getParameter("first_name");
            String password = request.getParameter("password");
            String CNIC = request.getParameter("CNIC");
            String email = request.getParameter("email");

            //Name Matcher
            String regex2 = "[a-zA-Z ]*$";
            Pattern Namepattern = Pattern.compile(regex2);
            Matcher matchName = Namepattern.matcher(name);
            System.out.println();

            //password matcher (?=\\S+$) white spaces don’t allowed in the entire string.
            //.{8} represents at least 8 characters
            String regex3 = "^(?=\\S+$).{8,}$";
            Pattern Passwordpattern = Pattern.compile(regex3);
            Matcher matchPassword = Passwordpattern.matcher(password);

            //Cnic Matcher ^[0-9+]{5}first 5 nos -[0-9+]{7}-[0-9]$
            String regex4 = "^^[0-9+]{5}first 5 nos -[0-9+]{7}-[0-9]$";
            Pattern Cnicpattern = Pattern.compile(regex4);
            Matcher matchcnic = Passwordpattern.matcher(CNIC);

            //Email Matcher
            String regex = "^[a-zA-Z0-9_!#$%&amp;'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
            Pattern Emailpattern = Pattern.compile(regex);
            Matcher matcherEmail = Emailpattern.matcher(email);

            if (matchName.matches() == false) {
                System.out.println(matchName);
                System.out.println(name + " : " + matchName.matches());
                out.println("Enter Correct Name");
                RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");
                rd.include(request, response);
                return;

            }
            if (matcherEmail.matches() == false) {
                System.out.println(email + " : " + matcherEmail.matches());
                out.println("Enter Correct email");
                RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");
                rd.include(request, response);
                return;
            }
            if (matchPassword.matches() == false) {
                System.out.println("password" + " : " + matchPassword.matches());
                out.println("Enter Correct password contains 8 characters and doesn't contain spaces");
                RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");
                rd.include(request, response);
                return;
            }

            if (matchcnic.matches() == false) {
                System.out.println("CNIC" + " : " + matchcnic.matches());
                out.println("Enter Correct Cnic");
                RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");
                rd.include(request, response);
                return;
            }
            else {



                String q = "Insert INTO  info(first_name,password,CNIC,email) values(?,?,?,?)";

                st = connection.createStatement();
                ps = connection.prepareStatement(q);
                ps.setString(1, name);
                ps.setString(2, password);
                ps.setString(3, CNIC);
                ps.setString(4, email);

                ps.execute();
                st.close();
                connection.close();

                out.println("Data Inserted <br> Username:" + name + "<br>Password:" + password + "<br>");


            }
        }
              catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (st != null)
                    st.close();
            } catch (SQLException se2) {
            } // nothing we can do
            try {
                if (connection != null)
                    connection.close();
            } catch (SQLException se) {
                se.printStackTrace();
            } //end finally try
            //end try
            catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}