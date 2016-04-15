<%-- 
    Document   : candidates
    Created on : Apr 14, 2016, 3:30:49 PM
    Author     : MCDO
--%>

<%@page import="Bean.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <link href="css/sb-admin-2.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidates</title>
    </head>
    <%

        Account bean = (Account) request.getSession().getAttribute("user");

    %>


    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><span class="fa fa-spinner fa-spin fa-1x" style="color:#4cae4c"></span> MCDO</a>
                </div>
                <ul class="nav navbar-right top-nav">
                    <li>
                        <a href="Logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                    </li>
                </ul>
            </div>
        </nav>
        <h1>Hello <%= bean.getLname() + "," + bean.getFname()%></h1>
        <div id="page-wrapper">

            <form method="POST" action="Subscribe">
                <div class="row">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <img src="img/binay.jpg" class="img-circle" alt="binay" width="300" height="200">
                                </div>
                                <div class="col-xs-9 text-right">                           
                                    <div class="huge">Jejomar Binay</div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel-footer">
                            <span class="pull-left"> <input type="checkbox" name="pres" value="1"> Subscribe<br></span>                            
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <img src="img/miriam.jpeg" class="img-circle"  width="300" height="200">
                                </div>
                                <div class="col-xs-9 text-right">                           
                                    <div class="huge">Miriam Defensor Santiago</div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <span class="pull-left"> <input type="checkbox" name="pres" value="2">  Subscribe<br></span>                            
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="panel panel-green">
                        <div class="panel-heading ">
                            <div class="row">
                                <div class="col-xs-3">
                                    <img src="img/duterte.jpg" class="img-circle"  width="300" height="200">
                                </div>
                                <div class="col-xs-9 text-right">                           
                                    <div class="huge">Rodrigo Duterte</div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <span class="pull-left"> <input type="checkbox" name="pres" value="3">  Subscribe<br></span>                            
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <img src="img/poe.jpg" class="img-circle" width="300" height="200">
                                </div>
                                <div class="col-xs-9 text-right">                           
                                    <div class="huge">Grace Poe</div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer ">
                            <span class="pull-left"> <input type="checkbox" name="pres" value="4">  Subscribe<br></span>                            
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <img src="img/mar.jpg" class="img-circle"  width="300" height="200">
                                </div>
                                <div class="col-xs-9 text-right">                           
                                    <div class="huge"> Mar Roxas</div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <span class="pull-left"> <input type="checkbox" name="pres" value="5">  Subscribe<br></span>                            
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <br>
                <input class="btn btn-xl btn-success" type="submit" value="Subscribe">
            </form>
        </div>

    </body>
</html>
