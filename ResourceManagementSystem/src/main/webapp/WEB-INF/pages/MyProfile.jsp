<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>
<div class="text-center">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b><s:message code="label.myProfile" /></b>

			</c:when>
			<c:otherwise>
                   Add User
                </c:otherwise>
		</c:choose>

	</h1>
</div>
<br>
<div class="text-center pull-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>

	<sf:form id="sandbox-container" method="POST" class="form-inline"
		commandName="form">

		<sf:hidden path="id" />
		<%--   <sf:hidden path="lastLogin"></sf:hidden>
        <sf:hidden path="registeredIP"></sf:hidden>
        <sf:hidden path="createdBy"></sf:hidden>
        <sf:hidden path="modifiedBy"></sf:hidden>
        <sf:hidden path="createdDatetime"></sf:hidden>
        <sf:hidden path="modifiedDatetime"></sf:hidden> --%>

  
    <div class="row text-center"> 

		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:input path="login" class="form-control" id="inputEmail3"
					readonly="true" />
			</div>
			<div class="text-center">
			  <sf:errors path="login" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:input path="firstName" class="form-control" id="inputEmail3" />
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
				<sf:input path="lastName" class="form-control" id="inputEmail3" />
			</div>
			
			<div class="text-center">  
			  <sf:errors path="lastName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
		   </div>
		</div>
		
	</div>
	<br>
	<br>
	
	 <div class="row text-center"> 	

		<div class="col-sm-4">
			<div class="input-group">
				<div class="input-group date">
					<span class="input-group-addon"><span
						class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
					</span>
					<sf:input class="form-control" path="dob" id="dob" readonly="true" />
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
				<sf:input path="mobileNo" maxlength="10" class="form-control"
					id="inputEmail3" />
			</div>
			
			<div class="text-center">
			  <sf:errors path="mobileNo" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
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
     <br>
     <br>

		<div class="text-center">
			<button type="submit" class="btn btn-primary" name="operation"
				value="Save">
				<span class="glyphicon glyphicon-floppy-save"></span>
				<s:message code="label.save" />
			</button>
		</div>


	</sf:form>