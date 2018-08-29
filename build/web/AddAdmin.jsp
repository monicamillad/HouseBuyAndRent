<!DOCTYPE html>
<!-- saved from url=(0084)file:///C:/Users/Karim/Downloads/bootstrap-4.0.0-alpha.6-dist/mdbootstrap/index.html -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Add Admin</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="./Login_files/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="./Login_files/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="./Login_files/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="./Login_files/style.css" rel="stylesheet">






<style type="text/css">
    


.largediv {
    
  

    position: absolute;
    top:0;
    bottom: 0;
    left: 0;
    right: 0;

    margin: auto;
}


.form-simple .header {
  border-top-left-radius: .3rem;
  border-top-right-radius: .3rem; }

.form-simple input[type=text]:focus:not([readonly]) {
  border-bottom: 1px solid #ff3547;
  -webkit-box-shadow: 0 1px 0 0 #ff3547;
  box-shadow: 0 1px 0 0 #ff3547; }

.form-simple input[type=text]:focus:not([readonly]) + label {
  color: #4f4f4f; }

.form-simple input[type=password]:focus:not([readonly]) {
  border-bottom: 1px solid #ff3547;
  -webkit-box-shadow: 0 1px 0 0 #ff3547;
  box-shadow: 0 1px 0 0 #ff3547; }

.form-simple input[type=password]:focus:not([readonly]) + label {
  color: #4f4f4f; }



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













</head>

<body style=" background-image: url(&#39;3797636-beach-house-wallpaper.jpg&#39;); background-repeat: no-repeat; ">

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

<div class="col-md-6 largediv" style="margin-left: 50%px; ">   
<section class="form-simple sect">

    <!--Form with header-->
    <div class="card">

        <!--Header-->
        <div class="header pt-3 blue lighten-3">

            <div class="row d-flex justify-content-start">
                <h3 class="deep-grey-text mt-3 mb-4 pb-1 mx-5" style="font-family: sans-serif;">Add Admin</h3>
            </div>

        </div>
        <!--Header-->

       
            <div class="card-body mx-4 mt-4">
                 <form action="AddAdmin" >

                <!--Body-->
                <div class="md-form">
                    <input type="text" id="Form-email4" class="form-control" name="uname" required>
                    <label for="Form-email4">Username</label>
                </div>

               
                
                <div class="text-center mb-4">
                    <button type="submit"  class="btn btn-unique btn-block z-depth-2 waves-effect waves-light">Add</button>
                </div>

               </form> 
            </div>
        

    </div>
    <!--/Form with header-->

</section>
</div>























  
    <!-- /Start your project here-->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="./Login_files/jquery-3.2.1.min.js.download"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="./Login_files/popper.min.js.download"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="./Login_files/bootstrap.min.js.download"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="./Login_files/mdb.min.js.download"></script>



<div class="hiddendiv common"></div></body></html>