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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <form method="POST" action="userLogin">                                                           
            Phone Number: <input name="twilio_num" id="twilio_num" type="text" value="" placeholder="+639123456789">
            Password: <input name="pass" id="pass" type="password" value="">            
            <input type="submit" value="Register">
        </form>
    </body>
</html>
