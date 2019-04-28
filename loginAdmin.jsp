<%-- 
    Document   : loginAdmin
    Created on : Apr 5, 2019, 8:00:10 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Project Management System</title>
    
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>PROJECT MANAGEMENT SYSTEM</h1>
    <header>
        <nav class="nav_container">
            <ul class="main_menu">
                <li><a href="index.html">Student</a></li>
                <li><a href="loginMentor.html">Mentor</a></li>
                <li><a href="loginAdmin.jsp">Admin</a></li>
            </ul>
        </nav>

    </header>
    <header>
        <form action="login" method="POST">
  <div class="container1">
    <h2>Welcome To Admin</h2>
    <br>
    
    <input type="hidden" value="admin" name="usertype"/>
    <label for="uname" class="labelname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="userid" required>

    <label for="psw" class="labelname"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

</form>
    </header>

    </body>
</html>
