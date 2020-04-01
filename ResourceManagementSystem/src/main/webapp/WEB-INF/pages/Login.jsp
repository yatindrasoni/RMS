<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>
<%-- <div class="text-center pull-center">

	<h2 class="error">${error}</h2>
</div> --%>
<div class=" col-sm-offset-4 col-sm-7">
	<!-- <h1 class="col-sm-offset-2 text-primary">Login</h1> -->
	
	<div class="col-sm-offset-2" style="margin-right: 250;">
		<img
			src="http://localhost:8080/ResourceManagementSystem/resource/images/login2.png"
			alt="Brand" width="100" height="100">
	</div>
	<div class="text-center pull-center" style="margin-right: 100;">
		<h2 class="error">${error}</h2>
	</div>
	<div class="text-center pull-center" style="margin-right: 100;">
		<h2 class="success">${success}</h2>
	</div>
	<br>
	<sf:form class="form-horizontal col-sm-6" action="Login" method="post"
		commandName="form">

		<div class="form-group" style="margin-right: -160;">
			<div class="input-group">
				<span class="input-group-addon"> <span
					class="glyphicon glyphicon-user"></span>
				</span>
				<sf:input path="emailId" class="form-control" placeholder="Login Id" />
			</div>
			
			  <sf:errors path="emailId" cssClass="error" class="text-center" />
			
		</div>


		<div class="form-group" style="margin-right: -160;">
			<div class="input-group">
				<span class="input-group-addon"><span
					class="glyphicon glyphicon-lock"></span></span>

				<sf:password path="password" class="form-control"
					placeholder="Password" />
			</div>
		
			<sf:errors path="password" cssClass="error"
				class="control-label text-danger" />

		</div>

		<div class="form-group" style="margin-right: -160;">
			<button type="submit" class="btn btn-primary btn-block"
				name="operation" value="SignIn">
				<s:message code="label.SignIn" />
				<span class="glyphicon glyphicon-log-in"></span>
			</button>
		</div>

		<div class="checkbox" style="margin-top: -20; margin-right: -160;">

			<span class="pull-right"> <a class="text-danger"
				href='<c:url value="/ForgetPassword" />'> <s:message
						code="label.ForgetPassword" />?&nbsp; <span
					class="glyphicon glyphicon-forward"></span>
			</a>
			</span>
		</div>

		<div class="checkbox" style="margin-right: -160;">
			<span class="pull-right"><a class="primary"
				href='<c:url value="/SignUp"/>'> <s:message
						code="label.CreateAccount" />?&nbsp; <span
					class="glyphicon glyphicon-forward"> </span>
			</a> </span>


		</div>

	</sf:form>
</div>
