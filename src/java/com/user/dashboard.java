package com.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "dashboard", urlPatterns = {"/dashboard"})
public class dashboard extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();

        HttpSession session=request.getSession(false);
        String name=(String)session.getAttribute("name");
        System.out.println("DASHBOARD "+name);

        if(name!=null){
            out.print("Hello, "+name+" Welcome to Profile");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/dashboard.jsp");
            rd.include(request,response);

    }
        else{
        out.print("<h2>Please login first</h2>");
        request.getRequestDispatcher("login.jsp").include(request, response);
    }
        out.close();
}}
