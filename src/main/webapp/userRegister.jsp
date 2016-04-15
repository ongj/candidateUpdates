<%-- 
    Document   : index
    Created on : Mar 6, 2016, 8:06:25 PM
    Author     : yla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="css/sb-admin-2.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><span class="fa fa-spinner fa-spin fa-2x" style="color:#4cae4c"></span> MCDO</a>
                </div>
                <ul class="nav navbar-nav">
                    <li ><a href="index.jsp">Home</a></li>
                    <li class="active"><a href="userRegister.jsp">Register as User</a></li>
                    <li><a href="manRegister.jsp">Register as Manager</a></li> 
                    <li><a href="userLogin.jsp">Login as user</a></li> 
                    <li><a href="manLogin.jsp">Login as Manager</a></li>
                </ul>
            </div>
        </nav>
        <div id="page-wrapper">
            <form role="form" method="POST" action="userRegister">
                <div class="form-group"> 
                    <label for="phone"> Phone Number:</label>
                    <input class="form-control" name="twilio_num" id="twilio_num" type="text" value="" placeholder="+639123456789" required>
                </div>
                <div class="form-group"> 
                    <label for="fname"> First Name:</label>
                    <input class="form-control" name="fname" id="fname" type="text" value="" required>
                </div>
                <div class="form-group"> 
                    <label for="lname"> Last Name:</label>
                    <input class="form-control" name="lname" id="lname" type="text" value="" required>
                </div>
                <div class="form-group"> 
                    <label for="pass"> Password:</label>
                    <input class="form-control" name="pass" id="pass" type="password" value="" required>  
                </div>
                <input class="btn btn-success" type="submit" value="Register">
            </form>
        </div>
    </body>
</html>
