/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class Notification {
        
    public String title ;
    public String description ;
    public String link ;
    public int isAlert ;
    public String username ;
    
    public Notification(){
                
        title = "not_" ;
        
        description = link = username = "" ;
        isAlert = 1 ;
    }
    
    public void AddToDatabase( ) throws ClassNotFoundException, SQLException{
        
        title += this.username ;

        
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(url, username, password) ;
        
        PreparedStatement stmt = null;
        stmt = con.prepareStatement("INSERT INTO notification(title , description , link ,isAlert, username) values(? , ? , ? ,?, ?) ");
        
        stmt.setString(1, title);
        stmt.setString(2, description);
        stmt.setString(3, link);
        stmt.setInt(4, isAlert);
        stmt.setString(5, this.username);
        
        stmt.executeUpdate();

        stmt.close();
        con.close();
        
    }
    
}
