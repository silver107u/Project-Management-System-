re<%-- 
    Document   : pdc
    Created on : Apr 5, 2019, 5:04:53 AM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbutil.DBConnection"%>
<%@page import="java.sql.Connection"%>
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
    String cmd="select * from pdes where userid=?";
    ps= conn.prepareStatement(cmd);
    ps.setString(1, userid);
    ResultSet rs = ps.executeQuery();
    int flag=0;
    String user ="N/A";
    String course="N/A";
    String collage="N/A";
    String name="N/A";
    while(rs.next())
            {     
              
                user=rs.getString(1);
                course = rs.getString(2);
                collage = rs.getString(3);
                name = rs.getString(4);
                flag=1;
            }
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
            if (flag==0)
            {
        %>
        <form class="projectDesc" action="./projectdesc" method="POST"> 
           <div class="container1">
                 <h2>Fill Project details</h2>
                 <br>
                 <label for="pname"><b>Project Name</b></label>
                 <input type="text" placeholder="Enter Project Name" name="sname" required>
                 
                 <input  type="hidden" value="${userid}" name="hid"/>
                      
                 <label for="technology"><b>Technology Used</b></label>
                 <input type="text" placeholder="Enter Technology" name="technology" required> 
           
                 <label for="languages"><b>Languages Used</b></label>
                 <input type="text" placeholder="Enter Languages Used" name="languages" required>
           
                 <label for="projectDesc"><b>Project Description</b></label>
                 <input type="text" placeholder="Enter description" name="projectDesc" required>
                 
           
                 <button type="Submit">Submit</button>
                </div>
            </form>
        <%
            }
        %>
        <% 
             if(flag==1)
                    {
                    
                    
        %>
        <p>Project name </p> <p> <%= user %></p> <br>
        <p>Techology</p>  <p> <%= course %></p> <br>
        <p>language</p> <p> <%= collage %></p> <br>
        <p> Project Decsrition</p> <p> <%= name%></p> <br>
        <input  type="hidden" value="${userid}" name="hid"/>
        <%
        }
        %>
    </body>
</html>
