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
        <h1>Hello World!</h1>
        <%
            while(rs.next())
            {     
                
                String user = rs.getString(1);
                String userty= rs.getString(2);
                String name = rs.getString(3);
                String expert= rs.getString(4);
                String designation = rs.getString(5);
                String emailid = rs.getString(7);
                
        %>
            
        <p> <%=  user %> </p>
        <p> <%=  userty %> </p> 
        <p><%=  name  %> </p>
        <p> <%=  expert  %> </p>
        <p> <%=  designation %> </p>
        <p> <%=  emailid %> </p>
        
        <%
            }
        %>
    </body>
</html>
