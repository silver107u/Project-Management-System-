<%-- 
    Document   : upload
    Created on : Apr 4, 2019, 10:34:40 PM
    Author     : dell
--%>

<%-- 
    Document   : newjsp2
    Created on : Apr 12, 2019, 10:01:32 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbutil.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
String userid=(String)session.getAttribute("userid");
String usertype=(String)session.getAttribute("usertype");
    if(usertype==null || userid==null)
        {
            response.sendRedirect("accessdenied.html");
        }
String pdes="NA";
String sys="NA";
String al="NA";
String doc="NA";
String code="NA";
String app= "NA";
        
Connection conn=DBConnection.getConnction();
PreparedStatement ps=conn.prepareStatement("select *from studentlog where userid=?");
ps.setString(1, userid);
ResultSet rs= ps.executeQuery();
while(rs.next())
{
    pdes=rs.getString(2);
    sys=rs.getString(3);
    al=rs.getString(4);
    doc=rs.getString(5);
    code=rs.getString(6);
    app=rs.getString(7);
}
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
                <li class="show_sub"><a href="projectdescription.jsp">Project details</a>
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
        <!--<div id="upload">
            <form action="./UpLoadServletController" method="post" enctype="multipart/form-data">
                Select File:<input type="file" name="fname" multiple/><br/>
                <input type="hidden" name="userid"/>
            <input type="image" src="MainUpload.png"/>
         </form>
        </div>-->
        <div class="container2">
            <% if(pdes.equalsIgnoreCase("no")) 
            {
                
%>
            <form class="uploadFiles" action="./UploadApprovalLetter" method="POST" enctype="multipart/form-data">
            <h2> Upload Files</h2><br>
            <h3>Approval Letter:</h3> <br>
            <input type="hidden" value="${userid}" name="hid" />
            <input type="file" name="file" accept="textfile" disabled>
            <input type="submit" disabled><br>
            </form>
            <% 
                }else{
 
            %>
            <form class="uploadFiles" action="./UploadApprovalLetter" method="POST" enctype="multipart/form-data">
                <h2> Upload Files</h2><br>
                <h3>Approval Letter:</h3> <br>
                <input type="hidden" name="hid" value="${userid}" />
                <input type="file" name="file" accept="textfile">
                <input type="submit"><br>
            </form>
                <%
                }
                %>
            <br>
            
            <% if(al.equalsIgnoreCase("no")) 
            {
                
%>
            <form class="uploadFiles" action="./UploadSynopsis" method="POST" enctype="multipart/form-data">
            <h3> Synopsis:</h3> <br>
            <input type="hidden" name="hid" value="${userid}"  />
            <input type="file" name="file" accept="textfile" disabled>
            <input type="submit" disabled><br>
            </form>
            <br>
            <%
            }else{
             
            %>
            <form class="uploadFiles" action="./UploadSynopsis" method="POST" enctype="multipart/form-data">
            <h3> Synopsis:</h3> <br>
            <input type="hidden" name="hid" value="${userid}"  />
            <input type="file" name="file" accept="textfile">
            <input type="submit"><br>
            </form>
            <br>
            <%
            }
            %>
            <% if(app.equalsIgnoreCase("no")||app.equalsIgnoreCase("dis")) 
            {
                
%>
            <form class="uploadFiles" action="./UploadDocument" method="POST" enctype="multipart/form-data">
            <h3> Documentation:</h3> <br>
            <input type="hidden" name="hid" value="${userid}" />
            <input type="file" name="file" accept="textfile" disabled>
            <input type="submit" disabled> <br>
            </form>
            <br>
            <form class="uploadFiles" action="./UpLoadServletController" method="POST" enctype="multipart/form-data">
            <h3> Project Code:</h3> <br>
            <input type="hidden" name="hid" value="${userid}" />
            <input type="file" name="file" accept="textfile" disabled>
            <input type="submit" disabled > <br>
            </form>
            <%
            
            }else 
                {   
            %>
            <form class="uploadFiles" action="./UploadDocument" method="POST" enctype="multipart/form-data">
            <h3> Documentation:</h3> <br>
            <input type="hidden" name="hid" value="${userid}" />
            <input type="file" name="file" accept="textfile">
            <input type="submit"> <br>
            </form>
            <br>
            <form class="uploadFiles" action="./UpLoadServletController" method="POST" enctype="multipart/form-data">
            <h3> Project Code:</h3> <br>
            <input type="hidden" name="hid" value="${userid}" />
            <input type="file" name="file" accept="textfile">
            <input type="submit"> <br>
            </form>
            <%
            }
            %>
            
            
            
            
            
            
            
            <!--<br>
            <h3> Project Link:</h3> <br>
            <input type="link" name="pic" accept="link">
            <input type="submit"> <br>-->
        </div>>
        </form>

    </body>
</html>
