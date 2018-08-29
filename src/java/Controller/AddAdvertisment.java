/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Advertisment;
import Model.Notification;
import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.apache.commons.io.output.*;



//import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 *
 * @author User
 */

//@javax.servlet.annotation.MultipartConfig
@WebServlet(name = "AddAdvertisment", urlPatterns = {"/AddAdvertisment"})
public class AddAdvertisment extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, FileUploadException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            if( request.getSession().getAttribute("uname") == null ){
            
                response.sendRedirect("LoginPage.jsp") ;
            }
            else{
                
                Advertisment d = new Advertisment() ;
                
                boolean isMultiPart=ServletFileUpload.isMultipartContent(request);
                String uploadPath="" ;

                List <FileItem> items=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                String fileName="";
                Iterator i = items.iterator();

                int count = 1 ;
                 
                for ( FileItem fi : items ) {
                    
                    fi = (FileItem)i.next();

                    if ( fi.isFormField () ) {
                        
                        if( fi.getFieldName().equals("title") ){
                            d.title = fi.getString() ;
                            uploadPath="E:\\fci\\fourth year\\first semester\\Internet Applications\\Project\\HouseBuyAndRent\\web" ;
                            Files.createDirectories(Paths.get(uploadPath));
                            DiskFileItemFactory factory = new DiskFileItemFactory();
                            File file=null;
                            factory.setSizeThreshold(16177215);
                            factory.setRepository(new File("E:\\fci\\fourth year\\first semester\\Internet Applications\\Project\\HouseBuyAndRent\\web" ));
                            ServletFileUpload upload = new ServletFileUpload(factory);
                            upload.setSizeMax(16177215);
                        }
                        else if( fi.getFieldName().equals("description")){
                            d.description = fi.getString() ;
                        }
                        else if( fi.getFieldName().equals("size")){
                            d.size = fi.getString() ;
                        }
                        else if( fi.getFieldName().equals("floor")){
                            d.floor = fi.getString() ;
                        }
                        else if( fi.getFieldName().equals("status") ){
                            d.status = fi.getString() ;
                        }
                        else if( fi.getFieldName().equals("type")){
                            d.type = fi.getString() ;
                        }
                        else if( fi.getFieldName().equals("radios") ){
                            
                            if( fi.getString().equals("sell")){
                                
                                d.isSell = 1 ;
                            }
                            else{
                                
                                d.isSell = 0 ;
                            }
                        }
                        else if(fi.getFieldName().equals("latlng"))
                        {
                        	 d.location = fi.getString() ;
                        }
                    }
                    else if( !fi.isFormField () ){
                        
                        String fieldName = fi.getFieldName();
                        fileName = d.title + count + ".jpg" ;
                        
                        String filePath=uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        fi.write(storeFile) ;
                        count ++ ;
                    }
                }
                
                d.username = request.getSession().getAttribute("uname").toString() ;
                d.picpath = d.title ;
                d.picsnum = count-1 ;        
                d.AddToDatabase() ;
                
                String url="jdbc:mysql://localhost:3306/housebuyandrent";
                String username="root";
                String password="root";

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(url, username, password) ;

                Statement stmt=con.createStatement() ;

                String q = "SELECT * FROM alert ;" ;

                ResultSet res= stmt.executeQuery(q) ;
                
                while( res.next() ){
                    
                    String size= res.getString("size") ;
                    String type= res.getString("type") ;
                    String status= res.getString("status") ;
                    
                    if( d.size.equals(size) && d.status.equals(status) && d.type.equals(type) && !d.username.equals(res.getString("username")) ){
                        
                        Notification not = new Notification() ;
                        
                        not.username = res.getString("username") ;
                        not.isAlert = 1 ;
                        not.link = d.title ;
                        not.description = "There is a new Advertisement that match your " + res.getString("title") + "Alert !" ;
                        
                        not.AddToDatabase() ;
                    }
                    
                }
                
                response.sendRedirect("HomePage.jsp") ;
                
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddAdvertisment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddAdvertisment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AddAdvertisment.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddAdvertisment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddAdvertisment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AddAdvertisment.class.getName()).log(Level.SEVERE, null, ex);
        }
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
