<%@page import="pack.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>User login page</title>
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
 
 
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                             <li><a href="Hospital_Login_Action.jsp">Home</a></li>
                            <li><a href="Authorize_Doctor.jsp">Authorize Doctor</a></li>
                            <li><a href="View_Appointment.jsp">View All Appointment Details</a></li>
                           <li><a href="View_Report.jsp"> View Key</a></li>
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
					 <br><h2><strong>View User Detail</strong></h2><br>
                                        
                                            <style>
                            table{
                                width: 80%;
                            }
                            table,td,tr,th{
                                border-collapse: collapse;
                                border: 1px solid black;
                                padding:5px;
                                text-align: center;
                            }
                        </style>
                                         
                                         
                                         
                              <center>
                   
    			<table>
                            <tr>
                                <th>ID</th>
                                <th>Doctor Id</th>
                                <th>Doctor Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                 <th>Hospital Name</th>
                                  <th>Specialist</th>
                                <th>Status</th>
                            </tr>
                            <%
                                Connection con=new database().fun();
                                PreparedStatement ps=con.prepareStatement("select * from doctor");
                                ResultSet r=ps.executeQuery();
                                while(r.next()){
                            %>
                            <tr>
                                <td><%=r.getString("id")%>&nbsp;&nbsp;&nbsp;</td>
                                <td><%=r.getString("doctorid")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><%=r.getString("name")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><%=r.getString("email")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><%=r.getString("address")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><%=r.getString("hospitalname")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 <td><%=r.getString("specialist")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <%
                                if(r.getString("status").equalsIgnoreCase("Authorized"))
                                {%>
                                    <td style='color:orangered;'>Already Authorized</td>
                                <%}
                                else{
                                 %> 
                                  <td><a href="Authorize_Action2.jsp?doctorid=<%=r.getString("doctorid")%>&&name=<%=r.getString("name")%>" style='color:darkgreen;font-weight: bold;'>Authorize</a></td>
                                <%}%>
                               
                            </tr>
                            <%}%>
                        </table>
                        <br>
                        <br>
                        
    			
    		</center>                  
                                                
                                                
                      
					</div>
				</div>			
			</div>
		</div>
	</section>		