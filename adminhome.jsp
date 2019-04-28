<%-- 
    Document   : adminhome.jsp
    Created on : Apr 1, 2019, 3:44:09 PM
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
    String cmd="select *from mentordetail";
    ps= conn.prepareStatement(cmd);
    ResultSet rs = ps.executeQuery();
    
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table cellspacing="20px">
        <tr >
            <th>SNO.</th>                
            <th>name</th>
            <th>expert</th>
            <th>designation</th>
            <th>email</th>
        </tr>
        <%
            int count = 1;
            while(rs.next())
            {     
                
                String user = rs.getString(1);
                String userty= rs.getString(2);
                String name = rs.getString(3);
                String expert= rs.getString(4);
                String designation = rs.getString(5);
                String emailid = rs.getString(6);
                
        %>
         <tr>
             
             <td> <%= count %></td>
            <td><%=  user %></td>
            <td><%=  name  %> </td>
            <td><%=  expert  %></td>
            <td><%=  designation %></td>
            <td><%=  emailid %></td>
            
        </tr>   
        <%--<p> <%=  user %> </p>
        <p> <%=  userty %> </p> 
        <p><%=  name  %> </p>
        <p> <%=  expert  %> </p>
        <p> <%=  designation %> </p>
        <p> <%=  emailid %> </p>--%>
        <%
            }
        %>
        </table>
        
        <a href="addmentor.jsp">fill mentor detail</a>
    </body>
</html>
