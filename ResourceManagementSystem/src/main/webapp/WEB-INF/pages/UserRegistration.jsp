<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>


<div class="text-center">
	<h1 class="text-primary">
		<b><s:message code="label.UserRegister"></s:message></b>
	</h1>
</div>
<br>


<div class="text-center pull-center" style="margin-left: 140;">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>

	<sf:form class="form-inline" method="POST" commandName="form" id="sandbox-container">

		<sf:hidden path="id" />
     
       <div class="row text-center"> 
		
		 <div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:input path="firstName" class="form-control" id="inputEmail3" placeholder="First Name"/>
			</div>
			<div class="text-center">
			  <sf:errors path="firstName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:input path="lastName" class="form-control" id="inputEmail3" placeholder="Last Name"/>
			</div>
			<div class="text-center">
			  <sf:errors path="lastName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:input path="login" class="form-control" id="inputEmail3" placeholder="Login Id"/>
			</div>
			<div class="text-center">
			  <sf:errors path="login" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
	 </div>
	 	
	 	<br>
	 	<br>
	
	  <div class="row text-center">

		<div class="col-sm-4">
			<div class="input-group">
			   <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-lock"></span>
			   </span>
				<sf:password class="form-control" id="inputPassword3" path="password" placeholder="Password"/>
			  </div>	
			
			<div class="text-center">
			  <label class="control-label text-danger" for="inputError1"> <sf:errors
					path="password" cssClass="error" />
			  </label>
            </div>
		</div>

		<div class="col-sm-4">
			<div class="input-group">
				<div class="input-group date">
				  <span class="input-group-addon"><span
						class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
				  </span>
					<sf:input class="form-control" path="dob" id="dob" readonly="true" placeholder="DOB"/>
				</div>
			</div>
			  <div class="text-center">
			    <sf:errors path="dob" cssClass="error"
				 class="control-label text-danger" for="inputError1" />
			 </div>	 
		</div>
		
		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-phone"></span>
			   </span>
				<sf:input path="mobileNo" class="form-control" id="inputEmail3" placeholder="Mobile No."/>
			</div>
			
			<div class="text-center">
			  <sf:errors path="mobileNo" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
     </div>
     
     <br>
     <br>

     <div class="row text-center">
	 	
	 	<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:select class="form-control" STYLE="width: 190px" size="0" path="gender">
					<sf:option value="" label="Select" />
					<sf:option value="Male" label="Male" />
					<sf:option value="Female" label="Female" />
				</sf:select> 
			</div>
			
			<div class="text-center">
			   <sf:errors path="gender" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
      
      </div> 
       
      <div class="text-center">
			<button type="submit" class="btn btn-primary" style="margin-left: -40;" name="operation" value="SignUp">
				<span class="glyphicon glyphicon-check"></span>
				
				  <s:message code="label.SignUp"></s:message>
	
			</button>
			&emsp;
		
			 <a class="btn btn-primary labelMargin"
				href="<c:url value="http://localhost:8080/ResourceManagementSystem/SignUp" />"><span
				class="glyphicon glyphicon-remove"></span> 
				  <s:message code="label.cancel" /> </a>
		  </div>
		
	</sf:form>


