package com.user;

import javax.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao extends HttpServlet {
    private static String name;
    private static String pass;

    public static boolean validate(String name, String pass){
        LoginDao.name = name;
        LoginDao.pass = pass;
        boolean status=false;

try{
    Connection connection = DBManager.getConnection();
PreparedStatement ps=connection.prepareStatement("select * from info where first_name=? and password=?");
ps.setString(1,name);  
ps.setString(2,pass);

    ResultSet rs=ps.executeQuery();
status=rs.next();  
}

catch(Exception e) {
    System.out.println(e);
}
return status;  
}  
}  