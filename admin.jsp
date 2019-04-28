<%-- 
    Document   : admin
    Created on : Apr 3, 2019, 12:58:20 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String userid=(String)session.getAttribute("userid");
    String usertype=(String)session.getAttribute("usertype");
    if(usertype==null || userid==null)
        {
            response.sendRedirect("accessdenied.html");
        }
%>
<html>
    <head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Project Management System</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>PROJECT MANAGEMENT SYSTEM</h1>
    <header>
        <nav class="nav_container">
            <ul class="main_menu">
                <li><a href="admin.jsp">Home</a></li>
                <li><a href="viewmantor.jsp">Add mentor</a></li>
                <li><a href="assignmentor.jsp">View Teams</a></li>
                <li><a href="notifyadmin.jsp">Notifications</a></li>

                 <li><a href="./LogoutControllerServlet">Logout</a></li>
            </ul>
        </nav>
    </header>
    <header>
        <div class="container1">
            <h1 style="color: black;">Welcome Admin!!!</h1>
            <br>
    </header>
    </body>
</html>
