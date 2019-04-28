<%-- 
    Document   : error
    Created on : Mar 31, 2019, 9:45:18 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
String userid=(String)session.getAttribute("userid");
String usertype=(String)session.getAttribute("usertype");

/*if(usertype==null || userid==null)
{
    //Exception ex=(Exception)session.getAttribute("exception");
    //ex.printStackTrace();
    response.sendRedirect("accessdenied.html");;
        
}*/
%>

<p> error message:${exception}</p>
<p> error message:${userid}</p>
<p> error message:${usertype}</p>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
