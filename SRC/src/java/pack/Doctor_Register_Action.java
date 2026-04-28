/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class Doctor_Register_Action extends HttpServlet {

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
      PrintWriter out = response.getWriter();
       try{
              String did =  request.getParameter("doctorid");
              String name = request.getParameter("username");
              String pass = request.getParameter("password");
              String mobile = request.getParameter("mobile");
              String email = request.getParameter("email");
              String addr = request.getParameter("address");
              String hospital = request.getParameter("hospital");
              String specialist = request.getParameter("specialist");
            Connection con=new database().fun();
            PreparedStatement ps=con.prepareStatement("insert into doctor(doctorid,name,pass,mobile,email,address,hospitalname,specialist)values('"+did+"','"+name+"','"+pass+"','"+mobile+"','"+email+"','"+addr+"','"+hospital+"','"+specialist+"')");
             System.out.println(ps);
    
            ps.executeUpdate();
            System.out.println(ps);
            out.println("<script>"
                        +"alert(' Doctor Regsitered Sucessfully')"
                        +"</script>");
            response.sendRedirect("Doctor_Login.jsp");
            
        }
        catch(Exception e){ 
            
    
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
