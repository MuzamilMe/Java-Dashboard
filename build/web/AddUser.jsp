<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add_user</title>
        
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
    </head>
    <body>
        
        <div class="container">
            <div class="row">
                <div class="col m8 offset-m3">
                <div class="card">
                <div class="card-content">
                    <h3>Add a New User Here</h3>
       
                    <div class="form center-align">
                        <form action="Add_user" method="post">
                            
                        
                        <input  name ="first_name" type="text" placeholder="First Name">
                        <input  name ="password" type="password" placeholder="Password">
                        <input  name ="CNIC" type="text" placeholder="Cnic">
                        <input  name ="email" type="email" placeholder="Email">
     
       
                     <button type="Submit" class="btn green center-align">Save</button>
            
           
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
