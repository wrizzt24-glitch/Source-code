package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class User_Verify extends HttpServlet {

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
            
         HttpSession session=request.getSession();
         PrintWriter out=response.getWriter();
	try{
                String username=request.getParameter("username");
                String password=request.getParameter("password");
                Connection con=new  database().fun();
                PreparedStatement p=con.prepareStatement("select * from user where uname='"+username+"' and pass='"+password+"' and status='Authorized' ");
                ResultSet r=p.executeQuery();
               if(r.next()){
                    System.out.println("check");
                    String id=r.getString("id");
                    session.setAttribute("id",id);
                    String email=r.getString("email");
                    session.setAttribute("email",email);
                    String mobile=r.getString("mobile");
                    session.setAttribute("mobile",mobile);
                    String address=r.getString("address");
                    session.setAttribute("address",address);
                  
                    session.setAttribute("username", username);
                    System.out.println("check");
                    out.println("<script type=\"text/javascript\">"); 			
                    out.println("alert(\"welcome "+username+".\")");
                    out.println("</script>"); 
                    RequestDispatcher rd=request.getRequestDispatcher("User_Login_Action.jsp");
                    rd.include(request, response);
                }
                else{
                     out.println("<script type=\"text/javascript\">"); 			
                    out.println("alert(\"Invalid Login.\")");
                    out.println("</script>"); 
                    RequestDispatcher rd=request.getRequestDispatcher("User_Login.jsp");
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
