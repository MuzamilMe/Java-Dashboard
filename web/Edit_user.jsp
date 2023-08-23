<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update User</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col m8 offset-m3">
                <div class="card">
                    <div class="card-content">
                        <h3>Update Here</h3>
                        <div class="form center-align">
                            <form action="EditDataServlet" method="get">
                                <%@page import="java.sql.DriverManager"%>
                                <%@page import="java.sql.ResultSet"%>
                                <%@page import="java.sql.Statement"%>
                                <%@page import="java.sql.PreparedStatement"%>
                                <%@page import="java.sql.Connection"%>
                                <%@page import = "com.user.*"%>

                                <%
                                try {
                                    Connection connection = DBManager.getConnection();
                                    Statement statement = null;
                                    ResultSet resultSet = null;
                                    PreparedStatement ps = null;


                                    String id = request.getParameter("cnic");


                                        if(connection!=null){
                                         //out.println("connected");
                                          statement = connection.createStatement();

                                          String sql = "SELECT * FROM info WHERE CNIC = ?";

                                         // out.println("Query: " + sql + " [" + id + "]");
                                          ps = connection.prepareStatement(sql);
                                           ps.setString(1, id);
                                           resultSet = ps.executeQuery();
                                        }
                                        else{
                                         out.println("not connected");
                                        }


                                    if (resultSet.next()) {
                                        String name = resultSet.getString("first_name");
                                        String pass = resultSet.getString("password");
                                        String cnic = resultSet.getString("CNIC");
                                        String email = resultSet.getString("email");
                                        %>
                                        <input type="text" id="first_name" name="first_name" placeholder="First Name" value="<%= name %>" >
                                        <input name="password" type="text" placeholder="Password" value="<%= pass %>" autocomplete="off">
                                        <input name="CNIC" type="text" value="<%= cnic %>" placeholder="CNIC">
                                        <input name="email" type="email" value="<%= email %>" placeholder="Email">
                                        <input type="hidden" id="CNIC" name="CNIC" value="<%= cnic %>">
                                        <button type="Submit" class="btn green center-align">Save</button>
                                         <button type="reset" class="btn Blue center-align">Reset</button>
                                        <%
                                    } else {
                                        out.println("No Data Found");
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                %>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function(){
        console.out



























































































            console.log("Page is Ready");
        });
    </script>
</body>
</html>