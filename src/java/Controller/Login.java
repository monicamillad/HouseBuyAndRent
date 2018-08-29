/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            
            String url="jdbc:mysql://localhost:3306/housebuyandrent";
            String username="root";
            String password="root";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url, username, password) ;

            Statement stmt=con.createStatement() ;

            String name = request.getParameter("uname") ;
            String pass = request.getParameter("password") ;

            String q = "SELECT name, password FROM user ;" ;

            ResultSet res= stmt.executeQuery(q) ;

            String curr="" ;
            
            boolean found = false ;
            boolean correct = false ;
            
            while( res.next() ){

                curr = res.getString("name") ;

                if( curr.equals(name) ){

                    found = true ;
                    
                    if( res.getString("password").equals(pass) ){
                        
                        correct = true ;
                        break ;
                    }
//                    out.print("This username is taken");
//                    break ;
                }
            }
            
            if( found && correct ){
                
                Cookie cookies [] = request.getCookies() ;
                
                String sid = "" ;
                
                boolean f = false ;
                
                for( int i=0 ; i<cookies.length ; i++ ){
                    
                    if( cookies[i].getName().equals("housebuyandrent") ){
                        
                        sid = cookies[i].getValue() ;
                        f = true ;
                        break ;
                    }
                }
                System.out.print(sid);
                if( sid.equals( request.getSession(true).getId().toString()) ){
                    
                    response.sendRedirect("HomePage.jsp") ;
                }
                else{
                    
                    request.getSession(true).setAttribute("uname", name);
                    request.getSession(true).setMaxInactiveInterval(60*60) ;
                    
                    if( !f ){
                        
                        Cookie cookie = new Cookie ("housebuyandrent",request.getSession(true).getId().toString());
                        cookie.setMaxAge(365 * 24 * 60 * 60);
                        response.addCookie(cookie);
                    }
                    
                    response.sendRedirect("HomePage.jsp") ;
//                    response.sendRedirect("LoginPage.jsp") ;
                }
                
                
            }
            else{
                
                String s = "" ;
                
                if( found && !correct ){
                    
                    s = "Wrong Password !" ;
                }
                else if( !found ){
                    
                    s = "There is no such user !" ;
                }
                
                response.sendRedirect("LoginPage.jsp?error="+s) ;
            }
            
            stmt.close();
            con.close();
            
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
