<%-- 
    Document   : assingnedteam
    Created on : Apr 5, 2019, 10:44:15 AM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbutil.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection conn=DBConnection.getConnction();
    PreparedStatement ps=null ;
    PreparedStatement ps2= null;
    String cmd="select  mentor ,projectanme from pdes";
    ps= conn.prepareStatement(cmd);
    ResultSet rs = ps.executeQuery();
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
                <li><a href="mentor.jsp">Home</a></li>
                <li><a href="assingnedteam.jsp">Assigned Teams</a></li>
                <li><a href="#">Notifications</a></li>

                <li><a href="logoutControllerServlet">Logout</a></li>
            </ul>
        </nav>
    </header>
            <header>
       
    <div class="container">
    <table id="myTable" class=" table order-list">
    <thead>
        <tr style="color: white; font-size:20px;">
            <td style="widows: 30px;">Team Name</td>
            <td style="widows: 30px;">Project Name</td>
            <td style="widows: 30px;">Approve/Disapprove</td>
            <td><input type="submit" value="submit"></td>
            <td> </td>
        </tr>
    </thead>
    <tbody>
        <%
            while(rs.next())
            {     
                
                //out.println("run");
                String user=rs.getString(1);
             String course = rs.getString(2);       
        %>
        <tr>
            <td class="col-sm-3" style="color:white;">
                        <%= user %>

            </td>
            <td class="col-sm-3" style="color:white;">
                        <%= course %>
            </td>
            <td class="col-sm-6">
                <select name="" id="">
                    <option value="Approve">Approve</option>
                    <option value="disapprove">Disapprove</option>
                </select>
            </td>
            
            
        </tr>
        <%
            }
        %>
    </tbody>
   </table>
</div>
       
      
    </header>
    </body>
</html>
