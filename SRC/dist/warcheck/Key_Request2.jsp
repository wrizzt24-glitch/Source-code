
<%@page import="pack.database"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%

    String id=request.getParameter("id");
    Connection con=new database().fun();
    PreparedStatement p=con.prepareStatement("update upload2 set status2='verify' where id='"+id+"' ");
    p.executeUpdate();
    System.out.println(p);
     out.println("<script type=\"text/javascript\">"); 			
    out.println("alert(\"Patient Record Verified...\")");
    out.println("</script>"); 
    RequestDispatcher rd=request.getRequestDispatcher("View_Report.jsp");
    rd.include(request, response);
%>