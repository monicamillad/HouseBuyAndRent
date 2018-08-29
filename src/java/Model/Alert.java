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
public class Alert {
        
    public String title;
    public String size;
    public String status ;
    public String type;
    public String username ;
    
    public Alert(){
        
        title = size = status = type = "" ;
    }

    public void AddToDatabase( ) throws ClassNotFoundException, SQLException{
        
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(url, username, password) ;
        
        PreparedStatement stmt = null;
        stmt = con.prepareStatement("INSERT INTO alert(title , size , type ,status, username ) values(? , ? , ? ,?, ?) ");
        
        stmt.setString(1, title);
        stmt.setString(2, size);
        stmt.setString(3, type);
        stmt.setString(4, status);
        stmt.setString(5, this.username);
        
        stmt.executeUpdate();

        stmt.close();
        con.close();
        
    }
    
}


