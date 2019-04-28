/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class FileUploadController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        /*try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FileUploadController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FileUploadController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
            
            response.setContentType("text/html");
PrintWriter out = response.getWriter();
		
//MultipartRequest m=new MultipartRequest(request,"d:/new");

String userid="super";
String path= "d:/nwe/"+userid;

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
out.print("successfully uploaded");
//out.print("<br>");
//out.print("file name");
String [] str=new String[10];
File []listOfFile=f.listFiles();
int i=0;
for(i=0;i<listOfFile.length;i++)
{
    //System.out.println("File name"+listOfFile[i].getName());
    str[i]=listOfFile[i].getName();  
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
