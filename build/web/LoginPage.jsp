<!DOCTYPE html>
<!-- saved from url=(0084)file:///C:/Users/Karim/Downloads/bootstrap-4.0.0-alpha.6-dist/mdbootstrap/index.jsp -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login</title>
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

  

<div class="col-md-6 largediv" style="margin-left: 50%px; ">   
<section class="form-simple sect">

    <!--Form with header-->
    <div class="card">

        <!--Header-->
        <div class="header pt-3 blue lighten-3">

            <div class="row d-flex justify-content-start">
                <h3 class="deep-grey-text mt-3 mb-4 pb-1 mx-5" style="font-family: sans-serif;">Login</h3>
            </div>

        </div>
        <!--Header-->

       
            <div class="card-body mx-4 mt-4">
                 <form action="Login" >

                <!--Body-->
                <div class="md-form">
                    <input type="text" id="Form-email4" class="form-control" name="uname" required>
                    <label for="Form-email4">Your Username</label>
                </div>

                <div class="md-form pb-3">
                    <input type="password" id="Form-pass4" class="form-control" name="password" required>
                    <label for="Form-pass4">Your password</label>
                    <!--<p class="font-small grey-text d-flex justify-content-end">Forgot <a href="file:///C:/Users/Karim/Downloads/bootstrap-4.0.0-alpha.6-dist/mdbootstrap/index.jsp#" class="dark-grey-text font-bold ml-1"> Password?</a></p>-->
                </div>

                <div class="md-form pb-3" style=" color: red;" >
                    
                   <%
                   
                       if( request.getParameter("error")!=null ){
                           
                           out.print( request.getParameter("error") ) ;
                       }
                   

                   %>
                    
                </div>
                
                <div class="text-center mb-4">
                    <button type="submit"  class="btn btn-unique btn-block z-depth-2 waves-effect waves-light">Log in</button>
                </div>
                <p class="font-small grey-text d-flex justify-content-center">Don't have an account? <a href="RegisterPage.jsp" class="dark-grey-text font-bold ml-1"> Sign up</a></p>

               </form> 
            </div>
        

    </div>
    <!--/Form with header-->

</section>
</div>


+




















  
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