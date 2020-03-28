<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://localhost:8080/ResourceManagementSystem/resource/css/w3.css">


<head>
<%@ page isELIgnored="false"%>
</head>
<style>
body{
  background: url("http://localhost:8080/ResourceManagementSystem/resource/images/background1.jpg") no-repeat center center fixed;
  -webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

</style>

 <body>
   
   
	${message}
	<br>
	<br>
	
	
 <div class="w3-container w3-center w3-animate-zoom ">
     <div class="text-left" style="margin-left: 200;">
	<H1 align="center" style="color: white">
	<s:message code="label.RMSWelcome"></s:message></H1>
   </div>

</div>
</body>

</html>
