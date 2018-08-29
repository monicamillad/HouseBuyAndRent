/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Advertisment;
import Model.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author User
 */
@WebServlet(name = "UpdateUserData", urlPatterns = {"/UpdateUserData"})
public class UpdateUserData extends HttpServlet {

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
            throws ServletException, IOException, FileUploadException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            if( request.getSession().getAttribute("uname") == null ){
            
                response.sendRedirect("LoginPage.jsp") ;
            }
            else{
                
                User user = new User() ;
                
                user.name = request.getSession().getAttribute("uname").toString() ;
                
                boolean isMultiPart=ServletFileUpload.isMultipartContent(request);
                String uploadPath="" ;

                uploadPath="E:\\fci\\fourth year\\first semester\\Internet Applications\\Project\\HouseBuyAndRent\\web" ;
                Files.createDirectories(Paths.get(uploadPath));
                DiskFileItemFactory factory = new DiskFileItemFactory();
                File file=null;
                factory.setSizeThreshold(16177215);
                factory.setRepository(new File("E:\\fci\\fourth year\\first semester\\Internet Applications\\Project\\HouseBuyAndRent\\web"));
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(16177215);
                
                List <FileItem> items=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                String fileName=user.name+".jpg";
                Iterator i = items.iterator();

                for ( FileItem fi : items ) {
                    
                    fi = (FileItem)i.next();

                    if ( fi.isFormField () ) {
                        
                        if( fi.getFieldName().equals("email") ){
                            user.email = fi.getString() ;
                        }
                        else if( fi.getFieldName().equals("phone")){
                            user.phone = fi.getString() ;
                        }
                    }
                    else if( !fi.isFormField () ){
                        
                        String fieldName = fi.getFieldName();
                        //fileName=new File(fi.getName()).getName();
                        String filePath=uploadPath + File.separator + fileName;
                        System.out.println("filename     "+fileName);
                        File storeFile = new File(filePath);
                        fi.write(storeFile) ;
                    }
                }
                
                user.picPath = fileName ;
                System.out.println("picpath     "+user.picPath);               
                user.UpdateUser() ;

                response.sendRedirect("EditProfilePage.jsp") ;
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
        } catch (Exception ex) {
            Logger.getLogger(UpdateUserData.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(UpdateUserData.class.getName()).log(Level.SEVERE, null, ex);
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
