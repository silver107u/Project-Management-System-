<%-- 
    Document   : teamMemberDetail
    Created on : Mar 31, 2019, 8:09:56 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userid=(String)session.getAttribute("userid");
 %>
<!DOCTYPE html>
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
                <li class="show_sub"><a href="projectdescription.jsp">Project details</a>
                    <ul class="sub_menu">
                        <li><a href="projectdescription.jsp">Description</a></li>
                        <li><a href="upload.jsp">Upload Files</a></li>
                    </ul>
                </li>
                <li class="show_sub"><a href="notification.jsp">Notifications</a>
                    <!--<ul class="sub_menu">
                        <li><a href="">Status</a></li>
                        <li><a href="">Mentor Name</a></li>
                    </ul>-->
                </li>

                <li><a href="./logoutControllerServlet">Logout</a></li>
            </ul>
        </nav>
    </header>
         <form action="./TeamDetailControllerServlet" method="POST">
          <input type="hidden" name="userid" value="${userid}">
        <label for="course">course</label>
        <select name="course" id= "course" size="1">
            <option value="BE">BE</option>
            <option value="BTECH">BTECH</option>
        </select>
        <br><br>
        <label for="collage">collage</label>
        <select name="collage" id="collage" size="1">
            <option value="OCT">OCT</option>
            <option value="OIST">OIST</option>
        </select>
        <br><br>
        <label for="name">Name</label>
        <input type="text" name="name" id="name">
        <br><br>
        <label for="branch">branch</label>
        <select name="branch" id="branch" size="1">
            <option value="CSE">CSE</option>
            <option value="ITE">ITE</option>
            <option value="ME"> ME</option>
        </select>
        <br><br>
        <label for="eno">Enrollment no</label>
        <input type="text" name="eno" id="eno">
        <br><br>
        <label for="sem"> semester</label>
        <input type="text" name="sem" type="sem">
        <br><br>
        <label for="year"> year</label>
        <input type="text" name="year" id="year">
        <br><br>
        <input type="submit" name="submit" id="submit" value="submit">
    </form>
    </body>
</html>
