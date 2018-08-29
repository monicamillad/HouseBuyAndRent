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
import java.sql.Statement;

/**
 *
 * @author User
 */
public class User {
    
    public String name ;
    public String password ;
    public String email ;
    public String phone ;
    public String picPath ;
    public int isadmin ;
    
    public User(){
        
        name = password = email = phone = picPath = "#" ;
        isadmin = 0 ;
    }
    
    public void AddToDatabase() throws ClassNotFoundException, SQLException{
        
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(url, username, password) ;
        Statement stmt=con.createStatement();

        String q="INSERT INTO user VALUES ('"+name+"','"+ this.password+"','"+ email+"','"+phone+"','"+picPath+"','"+isadmin+"');";
        stmt.executeUpdate(q);

        stmt.close();
        con.close();
        
    }
    
    public void UpdateUser() throws ClassNotFoundException, SQLException{
        
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(url, username, password) ;

        PreparedStatement stmt = null;
        stmt = con.prepareStatement("UPDATE user SET email = ? , phone = ? , picpath = ? WHERE name = ? ");
        
        stmt.setString(1, email);
        stmt.setString(2, phone);
        stmt.setString(3, picPath);
        stmt.setString(4, name);
                
        stmt.executeUpdate();

        stmt.close();
        con.close();
        
    }
    
    public void ChangePassword() throws ClassNotFoundException, SQLException{
        
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(url, username, password) ;
        Statement stmt=con.createStatement();

        String q="UPDATE user SET password='" + this.password + "' WHERE name='"+name+"'" ;        
        
        stmt.executeUpdate(q);

        stmt.close();
        con.close();
    }
    
}
