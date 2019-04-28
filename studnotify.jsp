<%-- 
    Document   : studnotify
    Created on : Apr 10, 2019, 12:59:28 AM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbutil.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





<% 
    String userid=(String)session.getAttribute("userid");
    String usertype=(String)session.getAttribute("usertype");
    if(usertype==null || userid==null)
    {
        response.sendRedirect("accessdenied.html");
    }
    Connection conn=DBConnection.getConnction();
    PreparedStatement ps=null ;
    PreparedStatement ps2=null ;
    String cmd="select mentor from pdes where userid=?";
    String cmd2="select approval from studentlog where userid=?";
    ps= conn.prepareStatement(cmd);
    ps2= conn.prepareStatement(cmd2);
    ps.setString(1, userid);
    ps2.setString(1, userid);
    ResultSet rs = ps.executeQuery();
    ResultSet rs2=ps2.executeQuery();
    int flag=0;
    String user ="N/A";
    String app="N/A";
    while(rs.next())
            {     
              
                user=rs.getString(1);
                flag=1;
            }
    while(rs2.next())
            {     
              
                app =rs2.getString(1);
            }
%>



<!DOCTYPE html>
<html>
    <head>
        <<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <%
            if(user.equalsIgnoreCase("no"))
            {
               
        %>
        
        <h1>No new notification </h1>
        <%
        }else
            {   
        %>
        <h1> Assigned mentor <%= user%></h1>>
        <%
        }
        %> 
        <%
        if(app.equalsIgnoreCase("dis"))
        {
        %>
        <h3> Your project is disapprove please visit to assigned mentor and reapplied your account will be<br>
        dispose in 10 days.
        </h3>
        <%
        }else if(app.equalsIgnoreCase("yes"))
        {
        %>
        <h3> your project is approve proceed for the documentation and coding stage</h3>
        <%
        } else 
        {   
        %>
        <h3> request sent to mentor</h3>
        <%
        }
        %>
    </body>
</html>
