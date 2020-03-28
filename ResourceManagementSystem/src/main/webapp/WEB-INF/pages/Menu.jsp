<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>


<%@ page isELIgnored="false"%>
<!-- <link rel="stylesheet" src="../../css/bootstrap-datepicker3.min.css">
<script type="text/javascript" 	src="../../js/bootstrap-datepicker.min.js"></script> -->

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RMS</title>
<style>

body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 30%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 5;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  transition: 0.3s;
  margin-left: -20;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 30;
  right: 10px;
  font-size: 36px;
  margin-left: px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
     
 
			<a href="<c:url value="/Welcome" />">
			<s:message code="label.Home" /></a>
			<div class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">
				<s:message code="label.language" /><span
					class="caret"></span></a>
		 
				<div class="dropdown-menu" style="font-size: 10px ">
					<li><a href="?lang=en"><s:message code="label.English" /></a>
						<a href="?lang=hi"><s:message code="label.Hindi" /></a></li>
				</div>
				
			</div>


    <c:if test="${sessionScope.user != null }">
            
            <a href="<c:url value="/ctl/User/profile" />"><s:message
							code="label.myProfile" /></a>
				<a href="<c:url value="/ctl/User/changepassword" />"><s:message
							code="label.changePassword" /></a>
							
 </c:if>
 
</div>

<div style="color:#000000; margin-top: -50"><span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span></div>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "230px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
   
</body>
</html>








<%-- <div class="span2 main-menu-span">

	<div class="well nav-collapse sidebar-nav">
	
	
		<ul class="nav nav-tabs nav-stacked main-menu">
			<li>
			<a href="<c:url value="/Welcome" />">
			<s:message code="label.Home" /></a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">
				<s:message code="label.language" /><span
					class="caret"></span></a>
		 
				<ul class="dropdown-menu">
					<li><a href="?lang=en"><s:message code="label.English" /></a>
						<a href="?lang=hi"><s:message code="label.Hindi" /></a></li>
				</ul></li>
        
		</ul>
		

	</div>
	
	<!--/.well -->
</div> --%>

<%-- <UL>
    <LI><a href="<c:url value="/Welcome" />"> Home </a></LI>
   <li> <a href="?lang=en">English</a> | <a href="?lang=hi">Hindi</a></li>
</UL> --%>


<%-- <c:if test="${sessionScope.user != null }">

	<div class="span2 main-menu-span">
		<div class="well nav-collapse sidebar-nav">
			<ul class="nav nav-tabs nav-stacked main-menu">

				<li><a href="<c:url value="/ctl/User/profile" />"><s:message
							code="label.myProfile" /></a></li>
				<li><a href="<c:url value="/ctl/User/changepassword" />"><s:message
							code="label.changePassword" /></a></li>

			</ul>

		</div>
		<!--/.well -->
	</div>


</c:if> --%>

<%-- <c:if test="${sessionScope.user.roleId == 1}">
<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a  href="<c:url value="/ctl/User/search" />">User List </a></li>
						<li><a href="<c:url value="/ctl/Role" />">Role</a></li>
        <li><a href="<c:url value="/ctl/Role/search" />">Role List</a></li>
						
						
					</ul>
					
				</div><!--/.well -->
			</div>
    

</c:if> --%>