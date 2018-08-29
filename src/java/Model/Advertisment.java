/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import com.sun.corba.se.spi.presentation.rmi.StubAdapter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author User
 */
public class Advertisment {
    
    public String title;
    public String size;
    public String description;
    public String floor;
    public String status;
    public String type;
    public String picpath;
    public String username ;
    public int isSell;
    public String location ;
    public int picsnum ;
    public int sum_rate;
    public int n_rate;
    public int isSuspend ;
    
    public Advertisment()
    {
        title=size=description=floor=status=type=username=picpath=location="";
        isSell=1;
        isSuspend=picsnum=sum_rate=n_rate=0 ;
    }
    
    public void AddToDatabase( ) throws ClassNotFoundException, SQLException{
        
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(url, username, password) ;
        
        PreparedStatement stmt = null;
        stmt = con.prepareStatement("INSERT INTO Advertisment(title , size , description , floor , status , type , picpath , isSell , username , location , picsnum , sum_rate , n_rate,isSuspend) values(? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?,?) ");
        
        stmt.setString(1, title);
        stmt.setString(2, size);
        stmt.setString(3, description);
        stmt.setString(4, floor);
        stmt.setString(5, status);
        stmt.setString(6, type);
        stmt.setString(7, picpath);
        stmt.setInt(8, isSell);
        stmt.setString(9, this.username);
        stmt.setString(10, location); 
        stmt.setInt(11, picsnum); 
        stmt.setInt(12, sum_rate); 
        stmt.setInt(13, n_rate); 
        stmt.setInt(14, isSuspend); 
        
        stmt.executeUpdate();

        stmt.close();
        con.close();
        
    }
    
    public void DeleteFromDatabase( ) throws ClassNotFoundException, SQLException{
        
    	Connection con = null;
        Statement stmt = null;
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";
		 try {
			   Class.forName("com.mysql.jdbc.Driver");
			   con=DriverManager.getConnection(url, username, password) ;
			   stmt=con.createStatement() ;
			   String q = "DELETE FROM advertisment WHERE title='"+title+"';" ;
			   stmt.executeUpdate(q) ;
			   System.out.println("r: "+title);
	           stmt.close();
	           con.close();
	        } catch(SQLException se) {
	           se.printStackTrace();
	        } catch(Exception e) {
	           e.printStackTrace();
	        } finally {
	           try {
	              if(stmt!=null)
	                 stmt.close();
	           } catch(SQLException se2) {
	           } 
	           try {
	              if(con!=null)
	              con.close();
	           } catch(SQLException se) {
	              se.printStackTrace();
	           } 
	        }
        
    }
}
