<%@page import="pack.database"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%

    String id=request.getParameter("id");
    String msg = request.getParameter("msg");
    Connection con=new database().fun();
    PreparedStatement p=con.prepareStatement("update approval set status='completed',bank_msg='"+msg+"' where id='"+id+"' ");
    p.executeUpdate();
    System.out.println(p);
     out.println("<script type=\"text/javascript\">"); 			
    out.println("alert(\"You Money will be Credited within one week...\")");
    out.println("</script>"); 
    RequestDispatcher rd=request.getRequestDispatcher("View_InsuranceList.jsp");
    rd.include(request, response);
%>