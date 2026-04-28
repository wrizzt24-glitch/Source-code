
<%@page import="pack.database"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%

    String id=request.getParameter("id");
    String policy = request.getParameter("policy");
    String msg = request.getParameter("msg");
    Connection con=new database().fun();
    PreparedStatement p=con.prepareStatement("update approval set status='transfred',policynum='"+policy+"',ins_msg='"+msg+"' where id='"+id+"' ");
    p.executeUpdate();
    System.out.println(p);
     out.println("<script type=\"text/javascript\">"); 			
    out.println("alert(\"Request Sent To Bank...\")");
    out.println("</script>"); 
    RequestDispatcher rd=request.getRequestDispatcher("View_RequestPatient.jsp");
    rd.include(request, response);
%>