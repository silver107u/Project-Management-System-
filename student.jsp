<%-- 
    Document   : student
    Created on : Apr 3, 2019, 12:14:39 AM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>PROJECT MANAGEMENT SYSTEM</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>PROJECT MANAGEMENT SYSTEM</h1>
    <header>
        <nav class="nav_container">
            <ul class="main_menu">
                <li><a href="student.jsp">Home</a></li>
                <li><a href="studenthome.jsp">Student details</a></li>
                <li class="show_sub"><a href="pdc.jsp">Project details</a>
                    <ul class="sub_menu">
                        <li><a href="pdc.jsp">Description</a></li>
                        <li><a href="upload.jsp">Upload Files</a></li>
                    </ul>
                </li>
                <li class="show_sub"><a href="studnotify.jsp">Notifications</a>
                    <!--<ul class="sub_menu">
                        <li><a href="">Status</a></li>
                        <li><a href="">Mentor Name</a></li>
                    </ul>-->
                </li>

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
