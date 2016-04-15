<%-- 
    Document   : userLogin
    Created on : Apr 14, 2016, 6:43:42 PM
    Author     : Lance
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Managers Login Page</h1>

        <form method="POST" action="manLogin">                                                           
            Username: <input name="username" id="username" type="text" value="">
            Password: <input name="password" id="password" type="password" value="">            
            <input type="submit" value="Login">
        </form>
		</br>
		<a href="index.jsp">Home</a>
    </body>
</html>
