package pack;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class Login_Action1 extends HttpServlet {

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
            System.out.println("check1....");
                String username=request.getParameter("username");
                String password=request.getParameter("password");
                
                if(username.equalsIgnoreCase("admin")&&password.equalsIgnoreCase("admin")){
                        out.println("<script type=\"text/javascript\">"); 			
                    out.println("alert(\"Welcome Admin.\")");
                    out.println("</script>"); 
                    RequestDispatcher rd=request.getRequestDispatcher("Admin_Login_Action.jsp");
                    rd.include(request, response);
		}
		else if(username.equalsIgnoreCase("hospital")&&password.equalsIgnoreCase("hospital")){
                    out.println("<script type=\"text/javascript\">"); 			
                    out.println("alert(\"Welcome To Hospital center.\")");
                    out.println("</script>"); 
                    RequestDispatcher rd=request.getRequestDispatcher("Hospital_Login_Action.jsp");
                    rd.include(request, response);
		}
		else if(username.equalsIgnoreCase("insurance")&&password.equalsIgnoreCase("insurance")){
                    out.println("<script type=\"text/javascript\">"); 			
                    out.println("alert(\"Welcome Insurance Agent.\")");
                    out.println("</script>"); 
                    RequestDispatcher rd=request.getRequestDispatcher("Insurance_Login_Action.jsp");
                    rd.include(request, response);
                }
                else if(username.equalsIgnoreCase("bank")&&password.equalsIgnoreCase("bank")){
                    out.println("<script type=\"text/javascript\">"); 			
                    out.println("alert(\"Welcome Banker.\")");
                    out.println("</script>"); 
                    RequestDispatcher rd=request.getRequestDispatcher("Bank_Login_Action.jsp");
                    rd.include(request, response);
                }
                else{
                    out.println("<script type=\"text/javascript\">"); 			
                    out.println("alert(\"Invalid Login.\")");
                    out.println("</script>"); 
                    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                    rd.include(request, response);
        }
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
