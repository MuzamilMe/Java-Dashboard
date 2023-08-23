<%-- 
    Document   : login
    Created on : May 21, 2023, 4:28:04 PM
    Author     : Muzamil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>
    <body>
       
       <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                
                    <h3>Login Here</h3>
                    <div class="form center-align">
                        <form action="Login" method="Post">
                          <div class="input-field col s6">
                     <input  placeholder="Enter Name" name="first_name" type="text" class="validate">
                     <label for="first_name">First Name</label>
                          </div>
                       <div class="input-field col s6">
                     <input  placeholder="Enter Password" name="password" type="password" class="validate">
                     <label for="Password">Password</label></div>
                        <button type="Submit" class="btn red">Login</button>
                        </form>
                         
                        
           </div>
           </div>
           </div>
           </div>
           </div>
   
           
       
        <script>
  src="https://code.jquery.com/jquery-3.7.0.min.js";
  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=";
  crossorigin="anonymous"></script>
  
  <script>
      $(document).ready(function(){
          console.log("Page is Ready");
      });
  </script>
                                       </body>
</html>
