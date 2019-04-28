/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.LoginDAO;
import DTO.LoginDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class LoginControllerServlet extends HttpServlet {

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
        String usertype = request.getParameter("usertype");
        String userid = request.getParameter("userid");
	String password=request.getParameter("password");
        LoginDTO login=new LoginDTO();
        login.setUsertype(usertype);
       	login.setUserid(userid);
	login.setPassword(password); 
        System.out.println(usertype);
        System.out.println(userid);
        System.out.println(password);
        HttpSession session=null;
        session=request.getSession();
      	try
        {
            boolean result = LoginDAO.validateUser(login);
            if(result ==true)
            {
                session=request.getSession();
                session.setAttribute("userid", userid);
                session.setAttribute("usertype", usertype);
                System.out.println("success");
                response.sendRedirect("redirect.jsp");
            }
            else 
            {
                session.invalidate();
                System.out.println("unsuccess ");
                response.sendRedirect("index.html");
            }
        }
        catch(SQLException ex)
        {
            session.setAttribute("exception", ex);
            response.sendRedirect("error.jsp");
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
