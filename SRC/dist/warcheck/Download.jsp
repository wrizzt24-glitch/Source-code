
<%@page import="java.sql.*"%>
<%
    String fname=request.getParameter("filename");
   
            String filepath = "C:\\files\\";   
            response.setContentType("APPLICATION/OCTET-STREAM");   
            response.setHeader("Content-Disposition","attachment; filename=\"" + fname + "\"");   

            java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + fname);  

            int i;   
            while ((i=fileInputStream.read()) != -1) {  
              out.write(i);   
            }   
            fileInputStream.close();   
          
            RequestDispatcher rd=request.getRequestDispatcher("View_Report2.jsp");
            rd.include(request, response);
   
%>