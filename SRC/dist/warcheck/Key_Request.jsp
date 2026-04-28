
<%@page import="pack.database"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%
    String file=request.getParameter("fname");
    String uname=request.getParameter("id");
 
    Random r = new Random(); 
    String xyz = Integer.toString(r.nextInt(100000000));   
   
    Connection con=new database().fun();
    PreparedStatement p=con.prepareStatement("update upload2 set status='Active',akey='"+xyz+"' where uname='"+uname+"' and filename='"+file+"' ");
    p.executeUpdate();
    System.out.println(p);
     out.println("<script type=\"text/javascript\">"); 			
    out.println("alert(\"Request Activated..key send to the Doctor...\")");
    out.println("</script>"); 
    RequestDispatcher rd=request.getRequestDispatcher("View_RequestKey.jsp");
    rd.include(request, response);
    
    
    
%>