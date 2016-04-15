<%-- 
    Document   : index
    Created on : Mar 6, 2016, 8:06:25 PM
    Author     : yla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <form method="POST" action="userRegister">                                                           
                Phone Number: <input name="twilio_num" id="twilio_num" type="text" value="" placeholder="+639123456789">
                First Name: <input name="fname" id="fname" type="text" value="">
                Last Name: <input name="lname" id="lname" type="text" value="">
                Password: <input name="pass" id="pass" type="password" value="">            
            <input type="submit" value="Register">
        </form>
		</br>
		<a href="index.jsp">Home</a>
    </body>
</html>
