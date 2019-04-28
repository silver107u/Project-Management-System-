<%-- 
    Document   : approve
    Created on : Apr 14, 2019, 10:43:14 AM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbutil.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String userid="pj";
    
    Connection conn=DBConnection.getConnction();
    PreparedStatement ps=null ;
    PreparedStatement ps2= null;
    String cmd="select *from pdes where mentor=?";
    String cmd2="select approval from studentlog where mentor=?";
    ps=conn.prepareStatement(cmd);
    ps2=conn.prepareStatement(cmd2);
    ps.setString(1, userid);
    ps2.setString(1,userid);
    ResultSet rs=ps.executeQuery();
    ResultSet rs2=ps2.executeQuery();  
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
                <li><a href="mentor.jsp">Home</a></li>
                <li><a href="#">Assigned Teams</a></li>
                <li><a href="mentornotify.jsp">Notifications</a></li>
                <li><a href="download.jsp">view files</a></li>
                <li><a href="./LogoutControllerServlet">Logout</a></li>
            </ul>
        </nav>
    </header>
            <header>

        <div class="container">
            <table id="myTable" class=" table order-list">
                <thead>
                    <tr style="color: white; font-size:20px;">
                        <td style="widows: 30px;">Team Name</td>
                        <td>Project Name</td>
                        <td>Project Discription</td>
                        <td>Approval staus</td>

                    </tr>
                </thead>
                <tbody>
                    <% 
                        while(rs.next())
                        {
                            String pm=rs.getString(1);
                            String desc=rs.getString(4);
                            String id=rs.getString(6);
                    %>
                    <tr>
                        <td class="col-sm-3">
                            <%= id %>
                        </td>
                        <td class="col-sm-3">
                            <%= pm %>
                        </td>
                        <td class="col-sm-3">
                            <%= desc%>
                        </td>
                        <% 
                            int i=1;
                        while(rs2.next())
                        {
                            String app=rs2.getString(1);
                            
                            if(app.equalsIgnoreCase("no"))
                            {
                        %>
                        <td class="col-sm-6">
                           <form action="./Approval" method="POST">
                               <input type="hidden" name="userid" value="<%= id%>">
                            <select name="app" id="">
                                <option value="yes"> Approve</option>
                                <option value="dis"> Disapprove</option>
                            </select>
                            <input type="submit">
                            </form>
                        </td>
                        <%
                        }else if(app.equalsIgnoreCase("yes"))
                            {
                        %>
                        
                        <td class="col-sm-6">
                            <%= "Approve"  %>
                        </td>
                        <%
                        }else if(app.equalsIgnoreCase("dis"))
                            {
                        %>
                        
                        <td class="col-sm-6">
                            <%= "Disapprove"%>
                        </td>
                        <%
                        }
                        %>
                        <%
                            break;
                        }
                        %>

                       
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
