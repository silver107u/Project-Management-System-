<%-- 
    Document   : addmentor
    Created on : Apr 1, 2019, 3:45:45 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String userid=(String)session.getAttribute("userid");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
    </head>

<body>
    <form action="./MentorDetailController" method="POST">
        <label for="usertype">usertype</label>
        <input type="text" name="usertype" id="usertype" value="mentor" disabled>
        <br><br>
        <label for="userid">userid</label>
        <input type="text" name="userid" id="userid">
        <br><br>
        <label for="name">Name</label>
        <input type="text" name="name" id="name">
        <br><br>
        <label for="expert">expert</label>
        <input type="text" name="expert" id="expert">
        <br><br>
        <label for="designation"> designation</label>
        <input type="text" name="designation" id="designation">
        <br><br>
        <label for="password"> password</label>
        <input type="password" name="password" id="password">
        <br><br>
        <label for="emilid"> emilid</label>
        <input type="email" name="emailid" id="eamilid">
        <br><br>
        <input type="submit" name="submit" id="submit" value="submit">
    </form>
</body>
</html>
