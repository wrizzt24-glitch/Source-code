<%@page import="pack.database"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%
    String did=request.getParameter("doctorid");
    
    String dname=request.getParameter("name");
    Connection con= new database().fun();
    PreparedStatement p=con.prepareStatement("update doctor set status='Authorized' where doctorid='"+did+"' and name='"+dname+"' ");
    p.executeUpdate();
    System.out.println(p);
    out.println("<script type=\"text/javascript\">"); 			
    out.println("alert(\"Doctor Activated.\")");
    out.println("</script>"); 
    RequestDispatcher rd=request.getRequestDispatcher("Authorize_User.jsp");
    rd.include(request, response);

%>