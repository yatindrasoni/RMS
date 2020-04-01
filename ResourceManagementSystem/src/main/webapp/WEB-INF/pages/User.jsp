<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<%@ page isELIgnored="false"%>
</head>
<style>
body{
  /* background: url("http://localhost:8080/ResourceManagementSystem/resource/images/background.jpg"); */

  /* #D1EEEE, */
}

</style>
<body>

<div class="text-center " style="margin-top: -30; margin-right: -210;">

	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b><s:message code="label.editUser"></s:message></b>

			</c:when>
			<c:otherwise>
				<b><s:message code="label.addUser"></s:message></b>
			</c:otherwise>
		</c:choose>

	</h1>
</div>
<div class="text-center pull-center" style="margin-left: 140">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>

	 <sf:form action="User" method="POST" class="form-inline"
		commandName="form" id="sandbox-container">

		<sf:hidden path="id" />
		<sf:hidden path="lastLogin"></sf:hidden>
		<sf:hidden path="registeredIP"></sf:hidden>
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>


     <!-- <div class="row" style="margin-top: 10"> -->
         
        <div class="row" style="margin-right: -140">       
 
		  <div class="col-sm-4">
			<div class="input-group">
			   <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:input path="firstName" class="form-control" id="inputEmail3" placeholder="First Name"/>
			</div>
			
			<div class="text-right" style="margin-top: 1; margin-right: 62">
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
			
			<div class="text-right" style="margin-top: 1; margin-right: 64">
			  <sf:errors path="lastName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<div class="input-group">
			   <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<c:if test="${form.id==0}">
					<sf:input path="login" class="form-control" id="inputEmail3" placeholder="Login Id"/>
				</c:if>
				<c:if test="${form.id>0}">
					<sf:input path="login" class="form-control" id="inputEmail3" readonly="true" />
				</c:if>
			</div>
			
			<div class="text-right" style="margin-top: 1; margin-right: 83">
			  <sf:errors path="login" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
	</div>	
	<br>
	<br>

       <div class="row" style="margin-right: -140">
		  
			<div class="col-sm-4">	
				<div class="input-group">
				  <span class="input-group-addon"> 
			         <span class="glyphicon glyphicon-lock"></span>
			      </span>
					<sf:input class="form-control" id="inputEmail3" path="password" placeholder="Password"/>
				</div>
				
				<div class="text-right" style="margin-top: 1; margin-right: 70">
				  <label class="control-label text-danger" for="inputError1">
					<sf:errors path="password" cssClass="error" />
			      </label>
                </div>
			</div>
	
		<div class="col-sm-4">
			<div class="input-group">
				<div class="input-group date">
				    <span class="input-group-addon" id="basic-addon2"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
					<sf:input class="form-control" path="dob" id="dob" readonly="true" placeholder="DOB"/>
				</div>
			</div>
			
			<div class="text-right" style="margin-top: 1; margin-right: 114">
			  <sf:errors path="dob" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<div class="input-group">
			   <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-phone"></span>
			   </span>
				<sf:input path="mobileNo" maxlength="10" class="form-control" id="inputEmail3" placeholder="Mobile No."/>
			</div>
			
			<div class="text-right" style="margin-top: 1; margin-right: 71">
			  <sf:errors path="mobileNo" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
      
       </div>
       <br>
       <br>
      
      <div class="row" style="margin-right: -140">

		<div class="col-sm-4">
			<div class="input-group">
			   <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:select class="form-control" STYLE="width: 195px" size="0" path="roleId" placeholder="Role Name">
					<sf:option value="" label="Select" />
					<sf:options items="${roleList}" itemValue="id" itemLabel="name" />
				</sf:select>
			</div>
			
			<div class="text-right" style="margin-top: 2; margin-right: 67">
			  <sf:errors path="roleId" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="col-sm-4">
			<div class="input-group">
				<span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:select class="form-control" STYLE="width: 195px" size="0" path="gender" placeholder="Gender">
					<sf:option value="" label="Select" />
					<sf:option value="Male" label="Male" />
					<sf:option value="Female" label="Female" />
				</sf:select> 
	        </div>  		
			</div>
			
			 <div class="text-right" style="margin-top: 30; margin-right: 487">
			  <sf:errors path="gender" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>
		
		</div>
		
		<div class="text-left" style="margin-left: 450; margin-top: 30;">
		  <div class="col-sm-offset-2 col-sm-10" >
			<button type="submit" class="btn btn-primary"
				style="margin-left: -40;" name="operation" value="Save">
				<span class="glyphicon glyphicon-floppy-save"></span>
				<s:message code="label.save"></s:message>
			</button>
			&emsp;
			<button type="submit" class="btn btn-primary" name="operation"
				value="Cancel">
				<span class="glyphicon glyphicon-remove"></span>
				<s:message code="label.cancel"></s:message>
			</button>
			
		</div>
      </div>
	</sf:form>

</body>
</html>