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
        <form method="POST" action="TwilioServlet">                                                           
                Phone Number: <input name="twilio_num" id="twilio_num" type="text" value="" placeholder="Enter your phone number here">
                First Name: <input name="sendto" id="sendto" type="text" value="" placeholder="Enter first name here">
                Last Name: <input name="sendto" id="sendto" type="text" value="" placeholder="Last name here">
                Password: <input name="sendto" id="sendto" type="text" value="" placeholder="Enter Password here">            
            <input type="submit" value="Register">
        </form>
    </body>
</html>
