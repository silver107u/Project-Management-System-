<%-- 
    Document   : assignmentor
    Created on : Apr 5, 2019, 1:45:02 AM
    Author     : dell
--%>

<%-- 
    Document   : newjsp
    Created on : Apr 11, 2019, 7:05:01 PM
    Author     : dell
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="dbutil.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    /*String userid=(String)session.getAttribute("userid");
    String usertype=(String)session.getAttribute("usertype");
    if(usertype==null || userid==null)
    {
        response.sendRedirect("accessdenied.html");
    }*/
    Connection conn=DBConnection.getConnction();
    PreparedStatement ps=null ;
    PreparedStatement ps2= null;
    String cmd="select  userid ,technology,mentor from pdes";
    String cmd2= "select userid,name,expert from mentorlist";
    ps= conn.prepareStatement(cmd);
    ps2 = conn.prepareStatement(cmd2);
    //ps.setString(1, userid);
    ResultSet rs = ps.executeQuery();
    ResultSet rs2=ps2.executeQuery();
    //out.println(userid);
  %>
<!DOCTYPE html>
<html>
    <head>
	<title></title>
		<!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">-->
		<link rel="stylesheet" type="text/css" href="style.css">

<!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>-->
<!--<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>-->
<script src="adminjs.js"></script>
    </head>
    <body>
  
            <h1>PROJECT MANAGEMENT SYSTEM</h1>
    <header>
        <nav class="nav_container">
            <ul class="main_menu">
                <li><a href="admin.jsp">Home</a></li>
                 <li><a href="viewmantor.jsp">Assign Mentors</a></li>
                <li><a href="assignmentor.jsp">View Teams</a></li>
                <li><a href="notifyadmin.jsp">Notifications</a></li>

                <li><a href="./LogoutControllerServlet">Logout</a></li>
            </ul>
        </nav>
    </header>
    <header>

	<div class="container ">
    <table id="myTable" class=" table order-list">
    <thead>
        <tr style="color: white; font-size:20px;">
            <th style="width:30%;">TeamName</th>
            <th style="width:30%;">Technology Used</th>
            <th style="width:30%;">Assign Mentor</th>
        </tr>
    </thead>
    <tbody>
        <%
            while(rs.next())
            {     
                
                //out.println("run");
                String user=rs.getString(1);
             String course = rs.getString(2); 
             String ment=rs.getString(3);
        %>
            
         
                <tr>
                    <td class="col-sm-3" style="color:white;">
                        
                        <%= user %>

                    </td>

                    <td class="col-sm-3" style="color:white;">
                        <%= course %>
                    </td>
                    
                    <%
                        if(ment.equalsIgnoreCase("no"))
                        {                        
                    %>
                    <form action="./AssignMentor" method="POST">
                        <td class="col-sm-6"> 

                             <input type="hidden" value="<%= user%>" name="user">
                            <select name="mentor" id="mentor">
                       <% 
                            while(rs2.next())
                            {
                                String collage=rs2.getString(1);
                                String name=rs2.getString(2);
                                String id=rs2.getString(3);
                       %>     

                   <option value="<%= collage%>"><%= name+" -> "+id %></option>
                        
                        <%
                        }
                        %>
                          </select>
                    </td>
                    
                    <td>
                            <input type="submit" value="submit">
                       
                    </td>
                     </form>
                    <%
                        }
                        else{
                    %>
                    <td> <%= ment %></td>
                    <%
                  }
                    %>
                </tr>
         <%
              }
          %>  
    </tbody>
   <!-- <tfoot>
        <tr>
            <td colspan="5" style="text-align: left;">
                <input type="button" class="btn btn-lg btn-block " id="addrow" value="Add Row" />
            </td>
        </tr>
        <tr>
        </tr>
    </tfoot>-->
</table>
</div>
</header>
    </body>
</html>
