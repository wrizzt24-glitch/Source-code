<%@page import="java.sql.*"%>
<%@page import="pack.database"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>Approval Page</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Esteem Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/snow.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/component.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style_grid.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
</head>
<body>
			<!-- /pages_agile_info_w3l -->

						<div class="pages_agile_info_w3l">
							<!-- /login -->
							   <div class="over_lay_agile_pages_w3ls">
								    <div class="registration">
								
                                                                        <%
                                                                            String id    = request.getParameter("id");
                                                                            String pname = request.getParameter("pname");
                                                                            String policy=request.getParameter("policy");
                                                                            String bank="";
                                                                            Connection con=new database().fun();
                                                                            PreparedStatement p=con.prepareStatement("select bankname from bank where name='"+pname+"' ");
                                                                            ResultSet r=p.executeQuery();
                                                                            if(r.next()){
                                                                                bank=r.getString("bankname");
                                                                            }
                                                                        %>
												<div class="signin-form profile">
													<h2>Approval  </h2>
													<div class="login-form">
											<form action="Approval3.jsp" method="POST">
                                                                                                <input type="text" name="id"        value="<%=id%>"        placeholder="id" required="">
                                                                                                <input type="text" name="pname"     value="<%=pname%>"     placeholder="PatientName" required="">
                                                                                                <input type="text" name="policy"     value="<%=policy%>"     placeholder="policynumber" required="">
                                                                                                <input type="text" name="bank"     value="<%=bank%>"     placeholder="Bank Name" required="">
                                                                                                
                                                                                                <input type="text" name="msg" placeholder="msg" required="">
											       <div class="tp">
													<input type="submit" value="submit" name="submit">
											       </div>
														</form>
													</div>
													
													 <h6><a href="index.jsp">Click Back</a><h6>
                                                                                                             
												</div>
										</div>
										<!--copy rights start here-->
											<div class="copyrights_agile">
												 <p>? Designed <a href="#" target="_blank">Dlk Tech  </a> </p>
											</div>	
											<!--copy rights end here-->
						    </div>
						</div>
							

</body>
</html>
