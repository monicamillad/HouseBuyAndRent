/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Comment;
import Model.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "AddComment", urlPatterns = {"/AddComment"})
public class AddComment extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            if( request.getSession().getAttribute("uname") == null ){
            
                response.sendRedirect("LoginPage.jsp") ;
            }
            else{
                
                Comment comment = new Comment() ;
            
                comment.comm = request.getParameter("comment") ;
                System.out.println("adv fi addcomment    " + request.getParameter("t"));
                comment.adv = request.getParameter("t") ;
                comment.username = request.getSession().getAttribute("uname").toString() ;
                
                comment.AddToDatabase() ;
                
                String l="jdbc:mysql://localhost:3306/housebuyandrent";
                String u="root";
                String p="root";

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection(l, u, p) ;

                Statement st=conn.createStatement() ;

                String q = "SELECT * FROM advertisment where title='"+comment.adv+"' ;" ;

                ResultSet r= st.executeQuery(q) ;

                String un = "" ;

                while( r.next() ){

                    un = r.getString("username") ;
                }

                Notification not = new Notification() ;
                        
                not.username = un ;
                not.isAlert = 0 ;
                not.link = comment.adv ;
                not.description = comment.username + " has commented on your advertisement: \" "+comment.adv+" \" " ;

                not.AddToDatabase() ;
                
                st.close();
                conn.close();
                
                response.sendRedirect("ViewAdvertisment?title=" + comment.adv) ;
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
            Logger.getLogger(AddComment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddComment.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddComment.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddComment.class.getName()).log(Level.SEVERE, null, ex);
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
