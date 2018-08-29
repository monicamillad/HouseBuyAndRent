<!DOCTYPE html>
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpServlet"%>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Add Advertisement</title>
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
.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}
@-webkit-keyframes 
cardEnter {  0%, 20%, 40%, 60%, 80%, 100% {
 -webkit-transition-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
 transition-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
}
 0% {
 opacity: 0;
 -webkit-transform: scale3d(0.3, 0.3, 0.3);
}
 20% {
 -webkit-transform: scale3d(1.1, 1.1, 1.1);
}
 40% {
 -webkit-transform: scale3d(0.9, 0.9, 0.9);
}
 60% {
 opacity: 1;
 -webkit-transform: scale3d(1.03, 1.03, 1.03);
}
 80% {
 -webkit-transform: scale3d(0.97, 0.97, 0.97);
}
 100% {
 opacity: 1;
 -webkit-transform: scale3d(1, 1, 1);
}
}
@keyframes 
cardEnter {  0%, 20%, 40%, 60%, 80%, 100% {
 -webkit-transition-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
 transition-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
}
 0% {
 opacity: 0;
 -webkit-transform: scale3d(0.3, 0.3, 0.3);
 transform: scale3d(0.3, 0.3, 0.3);
}
 20% {
 -webkit-transform: scale3d(1.1, 1.1, 1.1);
 transform: scale3d(1.1, 1.1, 1.1);
}
 40% {
 -webkit-transform: scale3d(0.9, 0.9, 0.9);
 transform: scale3d(0.9, 0.9, 0.9);
}
 60% {
 opacity: 1;
 -webkit-transform: scale3d(1.03, 1.03, 1.03);
 transform: scale3d(1.03, 1.03, 1.03);
}
 80% {
 -webkit-transform: scale3d(0.97, 0.97, 0.97);
 transform: scale3d(0.97, 0.97, 0.97);
}
 100% {
 opacity: 1;
 -webkit-transform: scale3d(1, 1, 1);
 transform: scale3d(1, 1, 1);
}
}
.radio {
  display: inline-block;
  padding-right: 20px;
  font-size: 18px;
  line-height: 49px;
  cursor: pointer;
}

.radio:hover .inner {
  -webkit-transform: scale(0.5);
  -ms-transform: scale(0.5);
  transform: scale(0.5);
  opacity: .5;
}

.radio input {
  width: 1px;
  height: 1px;
  opacity: 0;
}

.radio input:checked + .outer .inner {
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  transform: scale(1);
  opacity: 1;
}

.radio input:checked + .outer { rder: 3px solid #f08b3b; }

.radio input:focus + .outer .inner {
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  transform: scale(1);
  opacity: 1;
  background-color: #e67012;
}

.radio .outer {
  width: 20px;
  height: 20px;
  display: block;
  float: left;
  margin: 10px 9px 10px 10px;
  border: 3px solid #0c70b4;
  border-radius: 50%;
  background-color: #fff;
}

.radio .inner {
  -webkit-transition: all 0.25s ease-in-out;
  transition: all 0.25s ease-in-out;
  width: 16px;
  height: 16px;
  -webkit-transform: scale(0);
  -ms-transform: scale(0);
  transform: scale(0);
  display: block;
  margin: 2px;
  border-radius: 50%;
  background-color: #f08b3b;
  opacity: 0;
}

      

</style>
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
  
<!-- Form register -->

<div class="col-md-6 largediv sect"  style="margin-left: 50%px; ">
    <div class="card">

        <!--Header-->
        <div class="header pt-3 blue lighten-3">

            <div class="row d-flex justify-content-start">
                <h3 class="deep-grey-text mt-3 mb-4 pb-1 mx-5" style="font-family: sans-serif;">New Advertisement</h3>
            </div>

        </div>
        <form onsubmit= "return v();" action="AddAdvertisment" style="background-color: white; padding:100px 100px 100px 100px;" method="post" enctype="multipart/form-data">
    
	 
    <!--First row--> 
    <div class="row">
        <!--First column-->
        <div class="col-md-5">
            <div class="md-form">
    <input type="text" name="title" id="title" class="form-control" required onchange="sendajax()">
    <label for="title" class="">Title</label>
</div>
        </div>

        <!--Second column-->
        <div class="col-md-5">
            <div class="md-form">
               <input type="number" name="size" id="form1" class="form-control">
    <label for="form1" class="">Size</label>
            </div>
        </div>
    </div>
    <!--/.First row-->
    <div id ="error" class="md-form pb-3" style=" color: red;" ></div>
    <input type="text"  name="e" id="e" hidden="" value="" />
    
	<!--Second row-->
    
    <div class="row">

        <!--First column-->
        <div class="col-md-4">
            <div class="md-form">
                <input type="text" name="type" id="form41" class="form-control">
                <label for="form41" class="">Type</label>
            </div>
        </div>

        <!--Second column-->
    
		<div class="col-md-4">
            <div class="md-form">
               <input type="number" name="floor" id="form1" class="form-control">
    			<label for="form1" class="">Floor</label>
            </div>
        </div>
        <!--Third column-->
       <div class="col-md-4" >
            <div class="md-form">
                <input type="text" name="status" id="form41" class="form-control">
                <label for="form41" class="">Status</label>
            </div>
        </div>

    </div>
    <!--/.Second row-->
    <!--Third row-->
    <div class="row">
        <!--First column-->
        <div class="col-md-12">

            <div class="md-form">
                <textarea type="text" name="description" id="form76" class="md-textarea"></textarea>
                <label for="form76">Description</label>
            </div>

        </div>
    </div>
    
    <!--/.Third row--><br>
    <!--Forth row-->
    <div class="row">

        
         <div >
		   <label class="radio"><input id="radio" type="radio" value="sell" name="radios" ><span class="outer"><span class="inner"></span></span>Sell</label>
		   <label class="radio"><input id="radio" type="radio" value="rent" name="radios" checked><span class="outer"><span class="inner"></span></span>Rent</label>
		</div>
        
         <div class="col-md-6" style="margin-left: 20px;">
            <span class="btn btn-default btn-file btn-block z-depth-2 waves-effect waves-light">
  				  Pictures <input type="file" name="pics" id="pics" accept=".jpg, .jpeg, .png" multiple="multiple" required/>
			</span>
        </div>
        </div>
        <!--/.Forth row-->
        <br>
        <br>
        <!--Fifth row-->
        <div class="row">
         <div id="map"style="width:100%;height:400px"></div>
	 
 		 <input type="text" id="latlng" name="latlng" value="" hidden="">
          </div>  
          <!--/.Fifth row-->
        <br>
     <div class="text-center mb-4">
                <button type="submit" onclick="getMarkerPosition()" class="btn btn-unique btn-block z-depth-2 waves-effect waves-light">Add</button>
            </div>
         <!--onclick="getMarkerPosition()"-->
</form>
</div>
<!-- Form register -->
























  
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
    
    <script>
    var marker;
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: {lat: 30.054831218050946, lng: 31.24237060546875 }
        });
        
        map.addListener('click', function(e) {
          placeMarkerAndPanTo(e.latLng, map);
        });
        marker = new google.maps.Marker({
            position: {lat: 30.054831218050946, lng: 31.24237060546875 },
            map: map,
            draggable:true
          });
      }

      function placeMarkerAndPanTo(latLng, map) {
    	marker.setPosition(latLng);
        map.panTo(latLng);
      }
      function getMarkerPosition()
      {
    	  document.getElementById("latlng").value=""+marker.getPosition().lat()+","+marker.getPosition().lng();
      }
    </script>
    <!--    -->
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyChVTGfBlIkMsoH6ywUMvBtfCuKV9NB0ps&callback=initMap">
    </script>
   
     <script>
        
        function sendajax(){
            
                        
            var title = document.getElementById("title").value ;

            var xmlhttp = new XMLHttpRequest();
            
            xmlhttp.open("GET","AdvertismentExists?title="+title,true);
            xmlhttp.send();
            
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    document.getElementById("error").innerHTML=xmlhttp.responseText;
                    
                    document.getElementById("e").value = xmlhttp.responseText;
                }
            }
        }
        
    </script>
    
     <script> 
         
        function v(){
            
            if(document.getElementById("e").value != "This title is taken"){
                
                return true;
            }
            else{
            
                return false;
            }
            
        }
        
    </script>
    
</body>

</html>
