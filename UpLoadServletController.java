/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.oreilly.servlet.MultipartRequest;
import dbutil.DBConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class UpLoadServletController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

        /*try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
            


response.setContentType("text/html");
PrintWriter out = response.getWriter();
		
//MultipartRequest m=new MultipartRequest(request,"d:/new");

 HttpSession hs=request.getSession();
        String userid=(String)hs.getAttribute("userid");
        System.out.println("oooooooo"+userid);
if(userid==null)
{
    userid="super";
}
String path= "d:/nwe/"+userid+"/code";
String filepath=path+"/";
File f=new File(path);
if(f.exists())
{
    System.out.println("Exist");
}
else 
{
    boolean t=f.mkdirs();
    if(t)
    {
        System.out.println("creted");
    }
    else 
    {
        System.out.println("not created");
    }
}

MultipartRequest m=new MultipartRequest(request,path);
/*out.print("successfully uploaded");
out.print("<br>");
out.print("file name");
out.print(f.getName());*/

String [] str=new String[30];
int i=0;
File []listOfFile=f.listFiles();
for(i=0;i<listOfFile.length;i++)
{
    str[i]=listOfFile[i].getName();
    System.out.println(str[0]);
    /*out.print(str[i]);
    out.print("<br>");*/
}
Timestamp date = new Timestamp(System.currentTimeMillis());
Connection conn=DBConnection.getConnction();


String str6=request.getParameter("hid");
if(str6==null)
        {
            str6="super";
        }



        try
        {
            PreparedStatement ps2=conn.prepareStatement("update studentlog set code='yes'where userid=?");
             ps2.setString(1, str6);
             int z=ps2.executeUpdate();
             if(z!=0)
             {
                 System.out.println("value updated");
             }
             else 
             {
                 System.out.println("not updated");
             }
                for(int j=0;j<i;j++)
                {
                    PreparedStatement ps=null;
                    ps=conn.prepareStatement("insert into uploadfile values(?,?,?,?)");
                    ps.setString(1, userid);
                    ps.setString(2, filepath);
                    ps.setString(3, str[j]);
                    ps.setTimestamp(4, date);
                    int k=ps.executeUpdate();
                    if(k!=0)
                    {
                        System.out.println("values inserted");
                    }
                    else 
                    {
                        System.out.println("value not inserted");
                    }
                }
                response.sendRedirect("success.html");
        }
        
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
