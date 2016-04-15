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
        <h1>Manager Register Page</h1>

        <form method="POST" action="manRegister">            
				Username: <input name="username" id="username" type="text" value="">
                First Name: <input name="fname" id="fname" type="text" value="">
                Last Name: <input name="lname" id="lname" type="text" value="">
                Password: <input name="pass" id="pass" type="password" value="">   
				<select name="candidates">
					<option value="1">Jejomar Binay</option>
					<option value="2">Miriam Defensor Santiago</option>
					<option value="3">Rodrigo Duterte</option>
					<option value="4">Grace Poe</option>
					<option value="5">Mar Roxas</option>
				</select>
            <input type="submit" value="Login">
        </form>
		</br>
		<a href="index.jsp">Home</a>
    </body>
</html>
