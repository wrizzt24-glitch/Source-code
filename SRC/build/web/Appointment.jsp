<%@page import="pack.database" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Appointment Page</title>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/icon" href="assets/images/favicon.ico"/>
    <!-- Font Awesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Slick slider -->
    <link href="assets/css/slick.css" rel="stylesheet">
    <!-- Gallery Lightbox -->
    <link href="assets/css/magnific-popup.css" rel="stylesheet">
    <!-- Theme color -->
    <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">

    <!-- Main Style -->
    <link href="style.css" rel="stylesheet">

    <!-- Fonts -->

    <!-- Open Sans for body font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700,800" rel="stylesheet">
    <!-- Poppins for Title -->
  	<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
  </head>
  <body>
  	
  	<!-- Start Header -->
	<header id="mu-header" class="" role="banner">
		<div class="container">
			<nav class="navbar navbar-default mu-navbar">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      	<ul class="nav navbar-nav mu-menu navbar-right">
                             <li><a href="User_Login_Action.jsp">Home</a></li>
                            <li><a href="Add_Personal_Data.jsp">Add Personal Data</a></li>
                            <li><a href="View_Data.jsp">View Personal Data </a></li>
                            <li><a href="Appointment.jsp"> Appointment</a></li>
                            <li><a href="View_RequestKey.jsp"> View Request</a></li>
                            <li><a href="View_Msg.jsp"> View Message </a></li><li>
                            <li><a href="index.jsp"> Logout </a></li><li>
                         
                            
		      	</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		</div>
	</header>
	<section id="mu-featured-slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="mu-featured-area" style="margin-top: -80px;">
                                            <style>
                                                input{
                                                    margin-top: 10px;
                                                }
                                                table{
                                                    
                                                }
                                            </style>
                                            <h2> Fix Appointment With Doctor  </h2>
                                            <form action="Data_Insert" method="POST" enctype="multipart/form-data">  
                                                <table>
                                                    <tr><td><input type="file" name="file"  required=""></td></tr>
                                             <tr><td><input type="text" name="username" placeholder="username" required=""></td></tr>
                                            <tr><td>
                                            <select name="appoint">
                                            <option selected="" disabled>select one</option>
                                             <% 
                                                 Connection con=new database().fun();
                                                 PreparedStatement p=con.prepareStatement("select name from doctor group by name");
                                                 ResultSet r=p.executeQuery();
                                                 while(r.next()){
                                             %>
                                             <option value="<%=r.getString("name")%>"><%=r.getString("name")%> </option> 
                                             <%}%>      
                                           </select></td></tr>
                                            <tr><td><input type="submit" value="submit" name="submit"></td></tr>
                                            
                                            </table>
				          </form>
       
					</div>
				</div>			
			</div>
		</div>
	</section>	
                                           
  </body>
</html>