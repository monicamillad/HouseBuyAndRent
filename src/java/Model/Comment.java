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
public class Comment {
    
    public String username ;
    public String adv ;
    public String comm ;
    
    public Comment(){
        
        username = adv = comm = "" ;
    }
    
    public void AddToDatabase( ) throws ClassNotFoundException, SQLException{
        
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(url, username, password) ;
        
        PreparedStatement stmt = null;
        stmt = con.prepareStatement("INSERT INTO comment(username , adv , comm ) values(? , ? , ? ) ");
        
        stmt.setString(1, this.username);
        stmt.setString(2, adv);
        stmt.setString(3, comm);
        
        stmt.executeUpdate();
        
        stmt.close();
        con.close();
        
    }
    
}
