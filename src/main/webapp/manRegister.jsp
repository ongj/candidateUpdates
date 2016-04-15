<%-- 
    Document   : userLogin
    Created on : Apr 14, 2016, 6:43:42 PM
    Author     : Lance
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="css/sb-admin-2.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><span class="fa fa-spinner fa-spin fa-2x" style="color:#4cae4c"></span> MCDO</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="userRegister.jsp">Register as User</a></li>
                    <li class="active"><a href="manRegister.jsp">Register as Manager</a></li> 
                    <li><a href="userLogin.jsp">Login as user</a></li> 
                    <li><a href="manLogin.jsp">Login as Manager</a></li>
                </ul>
            </div>
        </nav>
        <div id="page-wrapper">
            <form role="form" method="POST" action="manRegister">
                <div class="form-group"> 
                    <label for="phone">  Username:</label>
                    <input class="form-control" name="username" id="username" type="text" value="" required>
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
                <div class="form-group"> 
                    <label for="select"> Select a Candidate:</label>
                    <select class="form-control"  name="candidates">
                        <option value="1">Jejomar Binay</option>
                        <option value="2">Miriam Defensor Santiago</option>
                        <option value="3">Rodrigo Duterte</option>
                        <option value="4">Grace Poe</option>
                        <option value="5">Mar Roxas</option>
                    </select>
                </div>
                <input class="btn btn-success" type="submit" value="Login">
            </form>



        </div>

        </br>

    </body>
</html>
