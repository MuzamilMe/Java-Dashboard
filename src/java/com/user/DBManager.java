package com.user;
import  java.sql.*;


public class DBManager {
    public static  Connection getConnection(){
        String driverName = "com.mysql.cj.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String dbName = "information";
        String userId = "root";
        String password = "";
        Connection ob  = null;
        try {
            Class.forName(driverName);
            ob = DriverManager.getConnection(connectionUrl+dbName, userId, password);
            return ob;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


        }
           public static boolean cnicValidate(String cnic){
            Connection connection = DBManager.getConnection();
                 Statement statement = null;
                 ResultSet resultSet = null;
                 try {

                     statement = connection.createStatement();
                     String sql = "SELECT CNIC FROM info where cnic='"+cnic+"'";
                     System.out.println(sql);
                     resultSet = statement.executeQuery(sql);

                     if (resultSet.next()) {
                          return true;

                     }
                     else{
                         return false;
                     }

                 } catch (SQLException e) {
                     throw new RuntimeException(e);
                 }


    }

}
