<%-- 
    Document   : redirect
    Created on : Mar 31, 2019, 5:44:22 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
String userid=(String)session.getAttribute("userid");
String usertype=(String)session.getAttribute("usertype");
if(usertype==null || userid==null)
{
    response.sendRedirect("accessdenied.html");
}
else if(usertype.equalsIgnoreCase("student"))
  {
        response.sendRedirect("student.jsp");  
  }
else if(usertype.equalsIgnoreCase("mentor"))
  {
        response.sendRedirect("mentor.jsp");  
  }
else if(usertype.equalsIgnoreCase("admin"))
  {
        response.sendRedirect("admin.jsp");  
  }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
