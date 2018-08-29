<!DOCTYPE html>


<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Register</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.css" rel="stylesheet">
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
<body style=" background-image: url(&#39;3797636-beach-house-wallpaper.jpg&#39;); background-repeat: no-repeat; ">

  
<!-- Form register -->
<div class="col-md-6 largediv sect"  style="margin-left: 50%px; ">
    <div class="card">

        <!--Header-->
        <div class="header pt-3 blue lighten-3">

            <div class="row d-flex justify-content-start">
                <h3 class="deep-grey-text mt-3 mb-4 pb-1 mx-5" style="font-family: sans-serif;">Sign Up</h3>
            </div>

        </div>
        
<!--        <script src="validation.js">
        </script>-->
        
        <form onsubmit= "return v();" action="Register" style="background-color: white; padding:100px 100px 100px 100px;">

    <div class="md-form">
        <i class="fa fa-user prefix grey-text"></i>
        <input name="uname" type="text" id="orangeForm-name" class="form-control" required onchange="sendajax()" >
        <!--=""-->
        <label for="orangeForm-name">Your name</label>
    </div>
            
    <div class="md-form" id="error" style="marign-left: 48px; color: red;" ></div>
    
    <input type="text"  name="e" id="e" hidden="" value="" />
    
    <div class="md-form">
        <i class="fa fa-envelope prefix grey-text"></i>
        <input name="email" type="email" id="orangeForm-email" class="form-control" required>
        <label for="orangeForm-email">Your email</label>
    </div>

    <div class="md-form" style="margin-left: 48px;">
        <!--<i class="fa fa-envelope prefix grey-text"></i>-->
        <input name="phone"type="text" id="orangeForm-phone" class="form-control" required>
        <label for="orangeForm-phone">Your phone number</label>
    </div>
    
    <div class="md-form">
        <i class="fa fa-lock prefix grey-text"></i>
        <input name="password" type="password" id="orangeForm-pass" class="form-control" required>
        <label for="orangeForm-pass">Your password</label>
    </div>
    
    <div class="md-form">
        <i class="fa fa-lock prefix grey-text"></i>
        <input  name="conf" type="password" id="orangeForm-confpass" class="form-control" required>
        <label for="orangeForm-pass">Confirm password</label>
    </div>
    <br>
    
    <div class="md-form g-recaptcha" data-sitekey="6LeJYDwUAAAAAHnbLNIdv_5jxPULLi-lpsD9ATxi"></div>
    
    <br>
    <div class="text-center">
        <button  name="btn" type="submit" class="btn btn-unique btn-block z-depth-2 waves-effect waves-light" >Sign Up</button>
        
    </div>

</form>
</div>
<!-- Form register -->


    <!-- /Start your project here-->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.js"></script>
    
    <script>
        
        function sendajax(){
            
            console.log("2bl al name")        ;
            
            var name = document.getElementById("orangeForm-name").value ;
                        console.log("ba3d al name")        ;

            var xmlhttp = new XMLHttpRequest();
            
            xmlhttp.open("GET","Exists?uname="+name,true);
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

            if( document.getElementById("orangeForm-pass").value == document.getElementById("orangeForm-confpass").value && document.getElementById("e").value != "This username is taken" ){ 
                return true ;
            }
            else{
                return false ;
            }
            

        }
        
    </script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>

</html>
