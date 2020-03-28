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

<div class="text-center " style="margin-top: -30; margin-right: -10;">

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

<div class="container">
   <div>
	 <sf:form action="User" method="POST" class="form-horizontal"
		commandName="form" id="sandbox-container">

		<sf:hidden path="id" />
		<sf:hidden path="lastLogin"></sf:hidden>
		<sf:hidden path="registeredIP"></sf:hidden>
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>


     <div class="row" style="margin-top: 10">
         
        <div class="row" style="margin-bottom: -50">       
 
		  <div class="col-sm-4">
			 <sf:label path="firstName" class="col-sm-5 control-label">
				<div class="text-left" style="margin-left: -20;">
					<s:message code="label.firstName1"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-8" style="margin-left: -45;">
				<sf:input path="firstName" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right" style="margin-top: 35; margin-right: 75">
			  <sf:errors path="firstName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<sf:label path="lastName" class="col-sm-5 control-label">
				<div class="text-left" style="margin-left: -20;">
					<s:message code="label.lastName1"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-8" style="margin-left: -60;">
				<sf:input path="lastName" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right" style="margin-top: 35; margin-right: 92">
			  <sf:errors path="lastName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<sf:label path="login" class="col-sm-5 control-label">
				<div class="text-left" style="margin-left: -45;">
					<s:message code="label.login"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-8" style="margin-left: -90;">
				<c:if test="${form.id==0}">
					<sf:input path="login" class="form-control" id="inputEmail3" />
				</c:if>
				<c:if test="${form.id>0}">
					<sf:input path="login" class="form-control" id="inputEmail3"
						readonly="true" />
				</c:if>
			</div>
			
			<div class="text-right" style="margin-top: 35; margin-right: 140">
			  <sf:errors path="login" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
	</div>	

      <div class="row" style="margin: 70;">
		  
		  <c:if test="${form.id==0}">

			<div class="col-sm-4">

				<label for="text" class="col-sm-5 control-label" style="margin-left: -130;">
					<sf:label path="password">
						<s:message code="label.password"></s:message>
					</sf:label>
				</label>
				<div class="col-sm-9" style="margin-left: 33; padding-left: 0.35em;">

					<sf:password class="form-control" id="inputPassword3"
						path="password" />
				</div>
				
				<div class="text-right" style="margin-top: 35; margin-right: 112">
				  <label class="control-label text-danger" for="inputError1">
					<sf:errors path="password" cssClass="error" />
			      </label>
                </div>
			</div>
		</c:if>

		<c:if test="${form.id>0}">
			<sf:hidden class="form-control" id="inputPassword3" path="password" />

		</c:if>

		<div class="col-sm-4">
			<label class="col-sm-5 control-label">
				<div class="text-left" style="margin-left: -49;">
					<s:message code="label.dob" />
				</div>
			</label>
			<div class="col-sm-8" style="margin-left: -65;">
				<div class="input-group date">
					<sf:input class="form-control" path="dob" id="dob"
						readonly="true" />
					<span class="input-group-addon" id="basic-addon2"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
			
			<div class="text-right" style="margin-top: 35; margin-right: 115">
			  <sf:errors path="dob" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<sf:label path="mobileNo" class="col-sm-5 control-label">
				<div class="text-left" style="margin-left: -18;">
					<s:message code="label.mobileNo"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-8" style="margin-left: -37;">
				<sf:input path="mobileNo" maxlength="10" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right" style="margin-top: 35; margin-right: 43">
			  <sf:errors path="mobileNo" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
      
       </div>
      
      <div class="row" style="margin-top: -50">

		<div class="col-sm-4">
			<sf:label path="roleId" class="col-sm-5 control-label">
				<div class="text-left" style="margin-left: -20;">
					<s:message code="label.role"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-7" style="margin-left: -45;">
				<sf:select class="form-control" STYLE="width: 195px" size="0"
					path="roleId">
					<sf:option value="" label="Select" />
					<sf:options items="${roleList}" itemValue="id" itemLabel="name" />
				</sf:select>
			</div>
			
			<div class="text-right" style="margin-top: 35; margin-right: 77">
			  <sf:errors path="roleId" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="col-sm-4">
			<sf:label path="gender" class="col-sm-5 control-label">
				<div class="text-left" style="margin-left: -20;">
					<s:message code="label.gender"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -85;margin-top: 10">
				<sf:radiobutton path="gender" value="Male" />
				<s:message code="label.male"></s:message>
				<sf:radiobutton path="gender" value="Female" />
				 <div style="margin-top: -19; margin-right: -56">
			     	<s:message code="label.female"></s:message>
	             </div>  		
			</div>
			
			 <div class="text-right" style="margin-top: 35; margin-right: 115">
			  <sf:errors path="gender" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>
		</div>
      </div>


		<div class="col-sm-offset-2 col-sm-10" style="margin-left: -250; margin-top: 30;">
			
			<button type="submit" class="btn btn-primary"
				style="margin-left: -40;" name="operation" value="Save">
				<span class="glyphicon glyphicon-floppy-save"></span>
				<s:message code="label.save"></s:message>
			</button>
			&emsp;&emsp;
			<button type="submit" class="btn btn-primary" name="operation"
				value="Cancel">
				<span class="glyphicon glyphicon-remove"></span>
				<s:message code="label.cancel"></s:message>
			</button>

		</div>
      </div>
	</sf:form>
  </div>
</div>

</body>
</html>