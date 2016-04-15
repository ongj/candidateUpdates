<%-- 
    Document   : candidates
    Created on : Apr 14, 2016, 3:30:49 PM
    Author     : MCDO
--%>

<%@page import="Bean.Manager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <link href="css/sb-admin-2.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Home Page</title>
    </head>
    <%

        Manager bean = (Manager) request.getSession().getAttribute("manager");

    %>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><span class="fa fa-spinner fa-spin fa-2x" style="color:#4cae4c"></span> MCDO</a>
                </div>
                <ul class="nav navbar-right top-nav">
                    <li>
                        <a href="Logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div id="page-wrapper">
            <h1>Hello <%= bean.getLname() + " " + bean.getFname()%></h1>
            <form role="form" method="POST" action="TwilioServlet">                                                           
                <textarea id="smsmsg" name="smsmsg" placeholder="Enter message here"></textarea>
                <input type="submit" value="Send">
            </form>
        </div>
    </body>
</html>
