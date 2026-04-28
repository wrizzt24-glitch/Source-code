
<%@page import="pack.database"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%

    String id=request.getParameter("id");
    Connection con=new database().fun();
    PreparedStatement p=con.prepareStatement("update approval set status='sent' where id='"+id+"' ");
    p.executeUpdate();
    System.out.println(p);
     out.println("<script type=\"text/javascript\">"); 			
    out.println("alert(\"Request Sent To Insurance...\")");
    out.println("</script>"); 
    RequestDispatcher rd=request.getRequestDispatcher("View_Msg.jsp");
    rd.include(request, response);
%>