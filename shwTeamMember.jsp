<%-- 
    Document   : shwTeamMember
    Created on : Apr 1, 2019, 10:41:16 AM
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
    Connection conn=DBConnection.getConnction();
    PreparedStatement ps=null ;
    String cmd="select *from studentetail where userid=?";
    ps= conn.prepareStatement(cmd);
    ps.setString(1, userid);
    ResultSet rs = ps.executeQuery();
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            while(rs.next())
            {     
                
                String user=rs.getString(1);
                String course = rs.getString(2);
                String collage = rs.getString(3);
                String name = rs.getString(4);
                String branch = rs.getString(5);
                String eno = rs.getString(6);
                String semester = rs.getString(7);
                String year = rs.getString(8);
        %>
            
        <p> <%=  user %> </p>
        <p> <%=  course%> </p> 
        <p><%=  collage%> </p>
        <p> <%=  name  %> </p>
        <p> <%=  branch %> </p>
        <p> <%=  eno %> </p>
        <p> <%=  semester %> </p>
        <p> <%=  year%> </p
        
        <%
            }
        %>
    </body>
</html>
