/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ADMIN
 */
public class upload extends HttpServlet {
    int hashh;
     String fna="";
    String fdo="",content="";
     String b1,b2,b3;
     static String wordcon="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        hashh=0;
     List<String> ms = new ArrayList<String>();
        String finalimage = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(
                request);
        List<String> m = new ArrayList<String>();
        File savedFile;
        
        if (!isMultipart) {
           float dummy=(float)Math.log(0)+1;
           
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;

            try {
                items = upload.parseRequest(request);
                //System.out.println("items: "+items);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                List<String> al = new ArrayList<String>();

                String sss = "";
                FileItem item = (FileItem) itr.next();
                String value = "";
                String a[];
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    //System.out.println("name: "+name+'\n');
                    value = item.getString();
                    // System.out.println("value: "+value);
                    al.add(value);
                    for (int i = 0; i < al.size(); i++) {
                        sss += al.get(i);
                        System.out.println("is thios image" + sss);

     //System.out.println("the value sixcwe"+m.size());
                    }

                    a = sss.split("-");
                    for (int i = 0; i < a.length; i++) 
                    {

                        String am = a[i];
                        System.out.println("aaaaaaaaaaaaaaaa" + a[i]);
                        m.add(a[i]);
                    }
                } else {
                    
                    String itemName = item.getName();

                    String reg = "[.*]";
                    String replacingtext = "";
                    Pattern pattern = Pattern.compile(reg);
                    Matcher matcher = pattern.matcher(itemName);
                    StringBuffer buffer = new StringBuffer();

                    while (matcher.find()) {
                        matcher.appendReplacement(buffer, replacingtext);
                    }
                    int IndexOf = itemName.indexOf(".");
                    int Indexf = itemName.indexOf(".");
                    String domainName = itemName.substring(IndexOf);
                    
                    finalimage = buffer.toString() + domainName;
                    
                    System.out.println("hi..... " +domainName);
                    System.out.println("Final Image===" + finalimage);
                    ms.add(finalimage);
                    fna=buffer.toString();
                    fdo=domainName;
                    savedFile = new File("C:\\files\\" + finalimage);
                    try 
	                    {
	                    	item.write(savedFile);	                    	
	                    	
                    CipherHelper c= new CipherHelper();	
                    BufferedReader br= null;
                    
                    String sCurrentLine;
                    StringBuilder b= new StringBuilder();       
                    StringBuilder bb= new StringBuilder(); 
                    br = new BufferedReader(new FileReader("C:\\files\\" + finalimage));
                    while ((sCurrentLine = br.readLine()) != null) 
                    {    
                         bb.append(sCurrentLine);
                         String myAppContext = sCurrentLine;
                    }
                    String rep = bb.toString().replaceAll("( )+", " ");
                    content=rep;
                    String enc=c.cipher("12345678",content);                      
                    String renc=c.cipher("12345678",enc);
                    PrintWriter writer = new PrintWriter("C:\\files\\enc\\"+finalimage, "UTF-8");
                    writer.println(enc);
                    writer.close(); 
                    PrintWriter writer1 = new PrintWriter("C:\\files\\enc\\renc\\"+finalimage, "UTF-8");
                    writer1.println(renc);
                    writer1.close(); 
                    } catch (Exception e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                    } 
                    
            }
        }
        PreparedStatement ps,ps1; 
        System.out.println("completed.....");
	try {            
            Connection con=new database().fun();
            ps=con.prepareStatement("insert into upload (filename,username,name)values('" + ms.get(0) + "','" + m.get(0)+ "','" + m.get(1) + "')");
             System.out.println(ps);
            ps.executeUpdate();
            System.out.println(ps);
        content="";
        out.println("<script>"
				+"alert('File uploaded successfully')"
				+"</script>");
		RequestDispatcher rd=request.getRequestDispatcher("User_Login_Action.jsp");
		rd.include(request, response); 
	}
	catch(Exception e){
            System.out.println(e);
        }
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
