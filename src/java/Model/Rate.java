package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;

public class Rate {
	public String user_title;
	public String user;
	public String title;
	public int rate_value;
	
	public Rate()
	{
		user_title=user=title="";
		rate_value=0;
	}
	
	public void AddToDatabase() throws ClassNotFoundException, SQLException{
        
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(url, username, password) ;
        Statement stmt=con.createStatement();

        String q="INSERT INTO rate VALUES ('"+user_title+"','"+user+"','"+ title+"','"+rate_value+"');";
        stmt.executeUpdate(q);

        stmt.close();
        con.close();
        
    }
	
}
