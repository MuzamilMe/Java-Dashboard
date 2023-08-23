<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    </head>
    <body>


        <div class="container">
            <div class="row">
                <div class="col m12">
                <div class="card">
                <div class="card-content">


                    <div class="form ">
                        <form action="LogoutServlet" method="get">

                         <%@page import="java.sql.DriverManager"%>
                         <%@page import="java.sql.ResultSet"%>
                         <%@page import="java.sql.Statement"%>
                         <%@page import="java.sql.Connection"%>

                         <%
                         String driverName = "com.mysql.cj.jdbc.Driver";
                         String connectionUrl = "jdbc:mysql://localhost:1527/";
                         String dbName = "information";
                         String userId = "root";
                         String password = "1234";


                         try {
                         Class.forName(driverName);
                         }
                         catch (ClassNotFoundException e) {
                         e.printStackTrace();
                         }

                         Connection connection = null;
                         Statement statement = null;
                         ResultSet resultSet = null;
                         %>
                         <h2 align="center"><font><strong><i>Your Dashboard</strong></i></h2>
                         <br>
                         <button type="Submit" class="btn blue" formaction="AddUser.jsp" method="post">Add User</button>
                         <table align="center" cellpadding="5" cellspacing="5" border="1">
                         <tr bgcolor="#bbdefb">
                         <td><b>UserName</b></td>
                         <td><b>password</b></td>
                         <td><b>Email</b></td>
                         <td><b>CNIC</b></td>
                         <td><b>Action</b></td>

                         </tr>
                         <%
                         try{
                         connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                         statement=connection.createStatement();
                         String sql ="SELECT * FROM info";

                         resultSet = statement.executeQuery(sql);

                          while(resultSet.next()){
                          String cnic = resultSet.getString("CNIC");
                         %>
                         <tr bgcolor="#eceff1">
                         <input type="hidden" id="CNIC" name="CNIC" value="<%=resultSet.getString("CNIC")%>" />
                         <td><%=resultSet.getString("first_name") %></td>
                         <td><%=resultSet.getString("password") %></td>
                         <td><%=resultSet.getString("email") %></td>
                         <td><%=cnic %></td>

                         <td>
                         <a href="Delete_user?cnic=<%=resultSet.getString("CNIC")%>">Delete</a>
                         <a href="Edit_user.jsp?cnic=<%=resultSet.getString("CNIC")%>">Edit</a>
                         </td>
                         </tr>
                         <%
                         }
                         } catch (Exception e) {
                         e.printStackTrace();
                         }
                         %>
                          </table>
                          <br>
                         <button type="Submit" class="btn green align-center">Logout</button>

           </form>
           </div>

          </div>
          </div>
          </div>
</div></div>

            <script>
  src="https://code.jquery.com/jquery-3.7.0.min.js"
  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
  crossorigin="anonymous"></script>

  <script>
      $(document).ready(function(){
          console.log("Page is Ready")
      })
  </script>
    </body>
</html>
