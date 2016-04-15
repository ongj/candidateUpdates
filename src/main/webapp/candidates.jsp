<%-- 
    Document   : candidates
    Created on : Apr 14, 2016, 3:30:49 PM
    Author     : MCDO
--%>

<%@page import="Bean.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidates</title>
    </head>
    <%

        Account bean = (Account) request.getSession().getAttribute("user");

    %>

    <h1>Hello <%= bean.getLname() + " " + bean.getFname()%></h1>
    <body>
        <form method="POST" action="Subscribe">                                                           
            <input type="checkbox" name="pres" value="1"> Jejomar Binay<br>
            <input type="checkbox" name="pres" value="2"> Miriam Defensor Santiago<br>
            <input type="checkbox" name="pres" value="3"> Rodrigo Duterte<br>
            <input type="checkbox" name="pres" value="4"> Grace Poe<br>
            <input type="checkbox" name="pres" value="5"> Mar Roxas<br>
            <input type="submit" value="Subscribe">
        </form>
    </body>
</html>
