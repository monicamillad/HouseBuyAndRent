<!DOCTYPE html>
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Home</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="css/style.css" rel="stylesheet">
</head>
<style type="text/css">
    

.largediv {
    
  

    position: absolute;
    top:0;
    bottom: 0;
    left: 0;
    right: 0;

    margin: auto;
}

    .sect {
    margin-top: 120px;
    opacity: 0.5;
    filter: alpha(opacity=50); /* For IE8 and earlier */
}

.sect:hover {
    opacity: 1.0;
    filter: alpha(opacity=100); /* For IE8 and earlier */
}

</style>
<!--style=" background-image: url(&#39;3797636-beach-house-wallpaper.jpg&#39;); background-repeat: no-repeat; "!-->
<body style="background-color: gray;">

  







<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark indigo">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#">HouseBuyAndRent</a>

    <!-- Collapse button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Links -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="HomePage.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
<!--            <li class="nav-item">
                <a class="nav-link" href="#">Profile</a>
            </li>-->

            <li class="nav-item">
                
                <a class="nav-link" href="ViewProfile"><img style="border-radius: 50%; width: 30px; height: 30px; margin-top: -4px ;margin-left:-9 ;" src=<%=session.getAttribute("uname").toString()+".jpg"%> > </a>
            </li>
             <li class="nav-item">
                <label class="nav-link" ><%=session.getAttribute("uname").toString()%></label>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AddAdvertisementPage.jsp">Add an advertisement</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Addalert.jsp">Create Alert</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="NotificationsPage.jsp">Notifications</a>
            </li>
        
            
            <a class="nav-link glyphicon glyphicon-search" href="SearchPage.jsp">Search</a>
</li>
            <%
	            String name=(String)session.getAttribute("uname");
            	int isadmin=0;
	    		if(name==null)
	    		{
	    			response.sendRedirect("LonginPage.jsp") ;
	    		}
	    		else
	    		{
	    			Connection con = null;
	    	        Statement stmt = null;
	    	        String url="jdbc:mysql://localhost:3306/housebuyandrent";
	                String username="root";
	                String password="root";
	    			 try {
	    				   Class.forName("com.mysql.jdbc.Driver");
	    				   con=DriverManager.getConnection(url, username, password) ;
	    				   stmt=con.createStatement() ;
	    				   String q = "SELECT isadmin FROM user where name='"+name+"' ;" ;
	    				   ResultSet res= stmt.executeQuery(q) ;
	    		            
	    		            while( res.next() ){

	    		            	isadmin = res.getInt("isadmin") ;
	    		                
	    		            }
	    		            
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
	    		if(isadmin==1)
	    		{
	    			%>
	    			
	    			<li class="nav-item dropdown">
		                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Admin</a>
		                <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
		                    <a class="dropdown-item" href="AdminView.jsp">Manage Advertisements</a>
		                    <a class="dropdown-item" href="AddAdmin.jsp">Add Admin</a>
		                    <a class="dropdown-item" href="ChangePass.jsp">Change Password</a>
		                </div>
	    			</li>
	    			<!--  <li class="nav-item">
		                <a class="nav-link" href="AdminView.jsp">Manage Advertisements</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="AdminView.jsp">Add Admin</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="AdminView.jsp">Change Password</a>
		            </li>-->
	    			<%
	    			
	    		}
            %>
            <li class="nav-item">
                <a class="nav-link" href="Logout">Logout</a>
            </li>
            
            
            <!-- Dropdown -->
            <!-- <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li> -->
     

        </ul>
        <!-- Links -->

        <!-- Search form -->
        <!-- <form class="form-inline">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
        </form> -->
    </div>
    <!-- Collapsible content -->

</nav>
<!--/.Navbar-->
                
<%

    

%>   

<!--Card-->
<!--Card-->
<div style="width: 20%; height: 20%;">
<div class="card"  >

    <!--Card image-->
    <!-- <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20%282%29.jpg" alt="Card image cap">  -->
    <!--Card content-->
    

<!--Carousel Wrapper-->

<!--/.Carousel Wrapper-->
<div class="card-body">
        <!--Title-->
        <!--Text-->
       
        
        <h5 class="card-title">Size</h5>
        <!--Text-->
        <p class="card-text">Description</p>
          <!--Title-->
        <h5 class="card-title">Status</h5>
        <!--Text-->
        <p class="card-text">Description</p>
          <!--Title-->
        <h5 class="card-title">Type</h5>
        <!--Text-->
        <p class="card-text">Description</p>
        
        <button type="button" class="btn btn btn-secondary">View</button>
         <button type="button" class="btn btn btn-danger">X</button>
    </div>

</div>
</div>

<!--/.Card-->
               
<!--/.Card-->
               
















  
    <!-- /Start your project here-->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
</body>

</html>
