<%-- 
    Document   : studenthome
    Created on : Mar 31, 2019, 5:25:36 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--%@page import="javax.servlet.http.HttpSession" %>-->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbutil.DBConnection"%>
<%@page import="java.sql.Connection"%>

<% 
    String userid=(String)session.getAttribute("userid");
    String usertype=(String)session.getAttribute("usertype");
    if(usertype==null || userid==null)
    {
        response.sendRedirect("accessdenied.html");
    }
    Connection conn=DBConnection.getConnction();
    PreparedStatement ps=null ;
    String cmd="select * from studentdetail where userid=?";
    ps= conn.prepareStatement(cmd);
    ps.setString(1, userid);
    ResultSet rs = ps.executeQuery();
    out.println(userid);
    /*while(rs.next())
            {     
                out.println("run3");
                String user=rs.getString(1);
                String course = rs.getString(2);
                String collage = rs.getString(3);
                String name = rs.getString(4);
                String branch = rs.getString(5);
                String eno = rs.getString(6);
                String semester = rs.getString(7);
                String year = rs.getString(8);
                out.println(user);
            }*/
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
        <header>
        <div class="container1">
            <h2>Welcome Students!!!</h2>
            <br>
            <p>Hello Team!<br> Fill the details of your members and add new members if needed. Check the provided details in the table given below.</p>
            <button onclick="document.getElementById('id03').style.display='block'" style="width:auto;">Add Member</button>
            <table style="width:100%">
                <tr>
                    <th>SrNo.</th>
                    <th>Name</th>
                    <th>Branch</th>
                    <th>EnrollmentNo.</th>
                    <th>Semester</th>
                    <th>Year</th>
                    <th>Course</th>
                    <th>Collage</th>
                </tr>
           
       </div>
        <%
            int count=1;
            while(rs.next())
            {     
                
                //out.println("run");
                String user=rs.getString(1);
                String course = rs.getString(2);
                String collage = rs.getString(3);
                String name = rs.getString(4);
                String branch = rs.getString(5);
                String eno = rs.getString(6);
                String semester = rs.getString(7);
                String year = rs.getString(8);
                
        %>
            
        <tr>
        <td> <%= count  %></td>
        <td><%=  collage%> </td>
        <td> <%=  name  %> </td>
        <td> <%=  course%> </td> 
        <td> <%=  branch %> </td>
        <td> <%=  eno %> </td>
        <td> <%=  year%> </td>
        <td> <%=  semester %> </td>
       
        </tr>
        <%
            count++;
           }
        %>
         </table>
         
         <div id="id03" class="modal">
  
             <form class="modal-content animate" action="./TeamDetailControllerServlet" method="POST">

      <div class="container">
      <h2>Fill Member details</h2>
      <br>
      <input type="hidden" name="userid" value="${userid}">
      <label for="sname"><b>Student Name</b></label>
      <input type="text" placeholder="Enter Student Name" name="name" required>
           
      <label for="enrollno"><b>Enrollment no.</b></label>
      <input type="text" placeholder="Enter Enrollment No." name="eno" required> 

      <label for="college"><b>College Name</b></label>
      <input type="text" placeholder="Enter College Name" name="collage" required>

      <label for="course"><b>Course</b></label>
      <input type="text" placeholder="Enter Course" name="course" required>

      <label for="branch"><b>Branch</b></label>
      <input type="text" placeholder="Enter Branch" name="branch" required>
      
      <label for="sem"><b>Semester</b></label>
      <input type="number" placeholder="Enter Semester" name="sem" required>

      <label for="year"><b>Year</b></label>
      <input type="number" placeholder="Enter Year" name="year" required>
        
      
      <button type="submit">Add Member</button>
      <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn">Cancel</button>
       </div>
       </form>
    
      </div>
    </header>
         
        <!--<a href="teamMemberDetail.jsp">fill memeber detail</a>-->
    </body>
</html>
