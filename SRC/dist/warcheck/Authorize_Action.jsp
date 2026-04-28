<%@page import="pack.database"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%
    String uid=request.getParameter("id");
    
    String uname=request.getParameter("uname");
    Connection con= new database().fun();
    PreparedStatement p=con.prepareStatement("update user set status='Authorized' where id='"+uid+"' and uname='"+uname+"' ");
    p.executeUpdate();
    System.out.println(p);
    out.println("<script type=\"text/javascript\">"); 			
    out.println("alert(\"Data Owner Activated.\")");
    out.println("</script>"); 
    RequestDispatcher rd=request.getRequestDispatcher("Authorize_User.jsp");
    rd.include(request, response);

%>