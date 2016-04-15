<%-- 
    Document   : candidates
    Created on : Apr 14, 2016, 3:30:49 PM
    Author     : MCDO
--%>

<%@page import="Bean.Manager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Home Page</title>
    </head>
    <%

        Manager bean = (Manager) request.getSession().getAttribute("manager");

    %>

    <h1>Hello <%= bean.getLname() + " " + bean.getFname()%></h1>
    <body>
        <form method="POST" action="TwilioServlet">                                                           
            <textarea id="smsmsg" name="smsmsg" placeholder="Enter message here"></textarea>
			<input type="submit" value="Send">
        </form>
    </body>
</html>
