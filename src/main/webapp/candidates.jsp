<%-- 
    Document   : candidates
    Created on : Apr 14, 2016, 3:30:49 PM
    Author     : MCDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidates</title>
    </head>
    <body>
        <form method="POST" action="TwilioServlet">                                                           
                <input type="checkbox" name="pres" value="Jejomar Binay"> Jejomar Binay<br>
				<input type="checkbox" name="pres" value="Miriam Defensor Santiago"> Miriam Defensor Santiago<br>
				<input type="checkbox" name="pres" value="Rodrigo Duterte"> Rodrigo Duterte<br>
				<input type="checkbox" name="pres" value="Grace Poe"> Grace Poe<br>
				<input type="checkbox" name="pres" value="Mar Roxas"> Mar Roxas<br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>