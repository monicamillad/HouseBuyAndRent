<!DOCTYPE html>
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
<%@ page import="java.sql.*"%>
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
    <link rel="stylesheet" type="text/css" href="tt.css">
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
                
           

<!--Card-->
<!--Card-->

<div class="card"  >

    <!--Card image-->
    <!-- <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20%282%29.jpg" alt="Card image cap"> -->

    <!--Card content-->
    
<% 
    String t=request.getParameter("title"); 

    String l="jdbc:mysql://localhost:3306/housebuyandrent";
    String u="root";
    String p="root";

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection(l, u, p) ;

    Statement st=conn.createStatement() ;

    String qq = "SELECT * FROM advertisment where title='"+t+"' ;" ;

    ResultSet rr= st.executeQuery(qq) ;

    int pnum = 0 ; 
    
    while( rr.next() ){
        
        pnum = Integer.parseInt(rr.getString("picsnum")) ;
    }

    st.close();
    conn.close();
    
    
%>
    
<!--Carousel Wrapper-->
<div id="carousel-example-1z" class=" carousel slide carousel-fade" data-ride="carousel">
    <!--Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
        
        <%
            for(int i=1 ; i<pnum ; i++){
        %>
                <li data-target="#carousel-example-1z" data-slide-to=<%=Integer.toString(i)%> ></li>
        <%
            }
        %>
        
    </ol>
    <!--/.Indicators-->
    <!--Slides-->
    <div class="carousel-inner" role="listbox">
        
        <%
        
            String s = "" ;
            s = t + 1 + ".jpg" ;
        %>
        
            <div class="carousel-item active">
                <img class="d-block w-100" src=<%=s%> alt="Firstslide">
            </div>
        
        <%
            System.out.println("pnum     "+pnum) ;
            for( int i=2 ; i<=pnum ; i++ ){
                
                s = t + i + ".jpg" ;
                
        %>
        
            <div class="carousel-item">
                <img class="d-block w-100" src=<%=s%> alt="Secondslide">
            </div>  
        
        <%
            }
        
        %>
        
        <!--First slide-->
        
        <!--/First slide-->
        <!--Second slide-->
        
        <!--/Second slide-->
        <!--Third slide-->
      <!-- <div class="carousel-item">
            <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(70).jpg" alt="Third slide">
        </div>-->
        <!--/Third slide-->
    </div>
    <!--/.Slides-->
    <!--Controls-->
    <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
    <!--/.Controls-->
</div>
<!--/.Carousel Wrapper-->
<%! String OwnerView(String IsOwner,String uname,String title)throws ClassNotFoundException, SQLException
	{
		String res="";
		if(IsOwner==null)
		{
			return res;
		}
		if(IsOwner.equals("1"))
		{
                        res+="<button type='button' onclick=\"location.href='EditAdvertisementPage.jsp?title="+title+"'\"  class='btn btn-danger'>Edit</button>\n";
                        res+="<button type='button' onclick=\"location.href='DeleteAdvertisment?title="+title+"'\" class='btn btn-secondary'>Delete</button>\n";		}
		else
		{
			String info="";
			String url="jdbc:mysql://localhost:3306/housebuyandrent";
			String username="root";
			String password="root";
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url, username, password) ;
			
			Statement stmt=con.createStatement() ;
			
			String q = "SELECT * FROM user where name='"+uname+"' ;" ;
			
			ResultSet r= stmt.executeQuery(q) ;
			
			res+="<h5 class='card-title'>Contact Info</h5>\n";
			while( r.next() ){
				
				String email= r.getString("email") ;
				String phone= r.getString("phone") ;
				
				
				info="Name: "+uname+"\n"; 
				res+="<p class='card-text'>"+info+"</p>\n";
				info="Email: "+email+"\n";
				res+="<p class='card-text'>"+info+"</p>\n";
				info="Phone Number: "+phone+"\n";
				res+="<p class='card-text'>"+info+"</p>\n";
			}
			
			stmt.close();
			con.close();
						
		}
		return res;
	} 
%>
<%

	String size="";
	String description="";
	String floor="";
	String status="";
	String type="";
	String picpath="";
	String uname="" ;
	int isSell=0;
	String location="" ;
	int picsnum=0 ;
	String x="For Rent";
	String url="jdbc:mysql://localhost:3306/housebuyandrent";
	String username="root";
	String password="root";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(url, username, password) ;
	
	Statement stmt=con.createStatement() ;
	String title=request.getParameter("title");
	String q = "SELECT * FROM advertisment where title='"+ title +"' ;" ;
	
	ResultSet res= stmt.executeQuery(q) ;
	
	
	while( res.next() ){
		
		size= res.getString("size") ;
		description= res.getString("description") ;
		floor= res.getString("floor") ;
		status= res.getString("status") ;
		type= res.getString("type") ;
		
		picpath= res.getString("picpath") ;
		
		uname = res.getString("username") ;
		location= res.getString("location")  ;
		isSell= res.getInt("isSell") ;
		picsnum = res.getInt("picsnum") ;
		
		if(isSell==1)
		{
			x="For Sell";
		}		
		
	}
	 
	stmt.close();
	con.close();

%>
<div class="card-body">
<div class="row">
	<div class="col-md-4"> 
        <!--Title-->
        
        <h2 class="card-title">Title</h2>
        <!--Text-->
        <p class="card-text"><%= title %></p>
        <p class="card-text"><%= x %></p>
   </div> 
   <div class="col-md-3" style=" margin-left: 500px;"> 
	   <div class="row">
		  <div class="stars">
		    <input class="star star-5" id="star-5" type="radio"  name="star" disabled='disabled' />
		    <label class="star star-5" for="star-5"></label>
		    <input class="star star-4" id="star-4" type="radio"  name="star" disabled='disabled'/>
		    <label class="star star-4" for="star-4"></label>
		    <input class="star star-3" id="star-3" type="radio" name="star" disabled='disabled'/>
		    <label class="star star-3" for="star-3"></label>
		    <input class="star star-2" id="star-2" type="radio"  name="star" disabled='disabled'/>
		    <label class="star star-2" for="star-2"></label>
		    <input class="star star-1" id="star-1" type="radio"  name="star" disabled='disabled'/>
		    <label class="star star-1" for="star-1"></label>
		    <input type="text" id="s_rate" name="s_rate" value= ${param.rate} hidden="" /> 
		    <input type="text" id="u_s_rate" name="u_s_rate" value= ${param.urate} hidden="" /> 
		</div> 
	  </div> 
	  <%if(request.getParameter("isOwner")!=null&&request.getParameter("isOwner").equals("0")){ %>
		<div class="row">
		  <div class="stars">
		    <input class="star star-5" id="rate-5" type="radio" name="rate"  />
		    <label class="star star-5" for="rate-5"></label>
		    <input class="star star-4" id="rate-4" type="radio" name="rate" />
		    <label class="star star-4" for="rate-4"></label>
		    <input class="star star-3" id="rate-3" type="radio" name="rate" />
		    <label class="star star-3" for="rate-3"></label>
		    <input class="star star-2" id="rate-2" type="radio" name="rate" />
		    <label class="star star-2" for="rate-2"></label>
		    <input class="star star-1" id="rate-1" type="radio" name="rate" />
		    <label class="star star-1" for="rate-1"></label>
		    <input type="text" id="title"   value=${param.title} hidden=""/> 
		    <button onclick="rate()" style=" margin-left: 120px;">Rate</button>
		</div> 
	</div> 
	<%} %>
   </div> 
</div>    
        
        <h5 class="card-title">Size</h5>
        <!--Text-->
        <p class="card-text"><%= size %></p>
        
         <!--Title-->
        <h5 class="card-title">Type</h5>
        <!--Text-->
        <p class="card-text"><%= type %></p>
        
        <h5 class="card-title">Floor</h5>
        <!--Text-->
        <p class="card-text"><%= floor %></p>
        
        <!--Title-->
        <h5 class="card-title">Status</h5>
        <!--Text-->
        <p class="card-text"><%= status %></p>
         
        
        <h5 class="card-title">Description</h5>
        <!--Text-->
        <p class="card-text"><%= description %></p>
        
        <!-- map -->
        <div id="map" style="width:400px;height:400px"></div>
        <input type="text" id="latlng" name="latlng" value= <%=location %> hidden="" >
        <br>
        <%= OwnerView(request.getParameter("isOwner"),uname , title) %>
    </div>
   
    <h6 class="card-title">Comments</h6>
    
   <%
        
            String ll="jdbc:mysql://localhost:3306/housebuyandrent";
            String uu="root";
            String pp="root";

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn1=DriverManager.getConnection(ll, uu, pp) ;

            Statement st1=conn1.createStatement() ;

            String qq1 = "SELECT * FROM comment where adv='"+request.getParameter("title")+"' ;" ;

            ResultSet rr1= st1.executeQuery(qq1) ;
            
            String c = "" ;
            String cu = "" ;

            while( rr1.next() ){

                c = rr1.getString("comm") ;
                cu = rr1.getString("username") ;
        %>   
                <p class="card-text"><%= cu + " :" + c %></p>
                
        <%
            }

            st1.close();
            conn1.close();        
        %>

   <form action="AddComment">
        <input type="text" name="comment">
        <input type="text" name="t" hidden="" value=<%=request.getParameter("title")%>>
        <button type='submit' class='btn btn-primary'>Comment</button>
    </form>    
    
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
    <script type="text/javascript">
    
    var rate=document.getElementById("s_rate").value ;
    var urate=document.getElementById("u_s_rate").value ;
    var radios = document.getElementsByName('star');
	var length = radios.length;
    for (var i = length,j=1; i>0; i--,j++)
    {
    	radios[i-1].checked =false;
        if (rate==(""+j))
        {
        	 radios[i-1].checked =true;
	         break;
        }
    }
    var radios1 = document.getElementsByName('rate');
	length = radios1.length;
    for (var i = length,j=1; i>0; i--,j++)
    {
    	radios1[i-1].checked =false;
        if (urate==(""+j))
        {
        	 radios1[i-1].checked =true;
	         break;
        }
    }
    
    
    </script>
    <script type="text/javascript">
    
    function rate()
    {
        var x =0;
		var title=document.getElementById("title").value ;
        var radios = document.getElementsByName('rate');
		var length = radios.length;
        for (var i = length-1; i>=0; i--)
        {
	        if (radios[i].checked)
	        {
		         x=length-(i);
		         break;
	        }
        }
        var xmlhttp = new XMLHttpRequest();
        
        xmlhttp.open("GET","RateAdvertisment?title="+title+"&rate="+x,true);
        xmlhttp.send();
        
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                var newRate=xmlhttp.responseText;
                var radios1 = document.getElementsByName('star');
                length = radios1.length
                for (var i = length,j=1; i>0; i--,j++)
                {
                	
                	radios1[i-1].checked =false;
        	        if (newRate==(""+j))
        	        {
        	        	 radios1[i-1].checked =true;
        		         break;
        	        }
                }
            }
        }
    }
    
    </script>
    <script>
    var marker;
    var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: {lat: 30.054831218050946, lng: 31.24237060546875 }
        });
        
        marker = new google.maps.Marker({
            position: {lat: 30.054831218050946, lng: 31.24237060546875 },
            map: map
          });
        f();
      }
	  function f() {
		  var latlng = document.getElementById("latlng").value.split(",");
		  var v=new google.maps.LatLng(parseFloat(latlng[0]), parseFloat(latlng[1]));
		  marker.setPosition(v);
		  map.panTo(v);
	  }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyChVTGfBlIkMsoH6ywUMvBtfCuKV9NB0ps&callback=initMap">
    </script>
</body>

</html>
