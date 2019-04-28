<%-- 
    Document   : mentor
    Created on : Apr 4, 2019, 10:23:24 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String userid=(String)session.getAttribute("userid");
    String usertype=(String)session.getAttribute("usertype");
    if(usertype==null || userid==null)
        {
            response.sendRedirect("accessdenied.html");
        }
%>


<!DOCTYPE html>
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
                <li><a href="#">Home</a></li>
                <li><a href="approve.jsp">Assigned Teams</a></li>
                <li><a href="mentornotify.jsp">Notifications</a></li>
                <li><a href="download.jsp">view files</a></li>
                <li><a href="./LogoutControllerServlet">Logout</a></li>
            </ul>
        </nav>
    </header>
        <div>
            <h1> Welcome <%= userid %> </h1>
            <h1> user type <%= usertype %> </h1>
        </div>
    </body>
</html>
