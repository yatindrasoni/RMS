<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<link rel="shortcut icon" href="http://localhost:8080/ResourceManagementSystem/resource/images/favicon.png" type = "image/png" sizes="16x16">
<!-- <script type="text/javascript">
	$('#sandbox-container .input-group.date').datepicker({
		autoclose : true,
		todayHighlight : true
	});
</script>

 -->


<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
 -->



<link rel="stylesheet"
	href="http://localhost:8080/ResourceManagementSystem/resource/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://localhost:8080/ResourceManagementSystem/resource/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="http://localhost:8080/ResourceManagementSystem/resource/css/jquery-ui.css">
<link rel="stylesheet"
	href="http://localhost:8080/ResourceManagementSystem/resource/css/jquery-ui.min.css">


<style>
.error {
	color: red;
	font-weight: bold;
}

.success {
	color: green;
	font-weight: bold;
}
</style>
</head>
<body>

	<table cellspacing="2" align="left">

		<tr>
			<td colspan="2" height="100px" width="100%"><tiles:insertAttribute
					name="header"></tiles:insertAttribute></td>
		</tr>
		<tr>
			<td colspan="1" height="400px" valign="top" width="20%" align="left">
			<tiles:insertAttribute name="menu"></tiles:insertAttribute></td>
			
			<td colspan="1" height="400px" width="100%" valign="top" align="right" >
			<tiles:insertAttribute name="body"></tiles:insertAttribute></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><tiles:insertAttribute
					name="footer"></tiles:insertAttribute></td>
		</tr>
	</table>


	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script
		src="https://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
   -->

	<script
		src="http://localhost:8080/ResourceManagementSystem/resource/js/jquery.min.js"></script>
	<script
		src="http://localhost:8080/ResourceManagementSystem/resource/js/bootstrap.min.js"></script>
	<script
		src="http://localhost:8080/ResourceManagementSystem/resource/js/bootstrap-datepicker.min.js"></script>
	<script
		src="http://localhost:8080/ResourceManagementSystem/resource/js/calendar.js"></script>
  
     <script
		src="http://localhost:8080/ResourceManagementSystem/resource/js/sandbox-container.js"></script>
		
		
	 <script
		  src="http://localhost:8080/ResourceManagementSystem/resource/js/anima.min.js"></script>
	 <script
		  src="http://localhost:8080/ResourceManagementSystem/resource/js/jquery-ui.js"></script>	  
     <script
		  src="http://localhost:8080/ResourceManagementSystem/resource/js/jquery-ui.min.js"></script>	  
	
	

</body>

</html>