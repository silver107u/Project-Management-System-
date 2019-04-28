<%-- 
    Document   : download
    Created on : Apr 23, 2019, 7:34:36 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbutil.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

Connection conn=DBConnection.getConnction();
PreparedStatement ps=conn.prepareStatement("select *from uploadfile");
ResultSet rs=ps.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <li><a href="#">view files</a></li>
                <li><a href="./LogoutControllerServlet">Logout</a></li>
            </ul>
        </nav>
    </header>
        <table>
        <tr>
            <th>file name </th>
            <th>uploaded date</th>
            
        </tr>
        <%
        while(rs.next())
        {
        %>
       <tr>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td>
                <form action="./Download" method="GET">
                    <input type="hidden" name="path" value=" <%= rs.getString(2) %>">
                    <input type="hidden" name="file" value="<%= rs.getString(3) %>">
                    <input type="submit" value="download">
                </form>
            </td>
        </tr>
       <%
       }
       %>
       </table>
        
    </body>
</html>
