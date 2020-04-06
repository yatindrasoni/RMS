<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>

<div class="text-center">
	<h1 class="text-primary">
		<b><s:message code="label.changePassword"></s:message></b>
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

	<sf:form method="post" class="form-inline" commandName="form">
		<sf:hidden path="id" />
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>

         <div class="row text-center"> 

		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"><span
					class="glyphicon glyphicon-lock"></span>
			  </span>
				<sf:password path="oldPassword" class="form-control"
					id="inputEmail3" placeholder="Old Password"/>
			</div>
			
			<div class="text-center">
			  <sf:errors path="oldPassword" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"><span
					class="glyphicon glyphicon-lock"></span>
			  </span>
				<sf:password path="newPassword" class="form-control"
					id="inputEmail3" placeholder="New Password"/>
			</div>
			
			<div class="text-center">
			   <sf:errors path="newPassword" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"><span
					class="glyphicon glyphicon-lock"></span>
			  </span>
				<sf:password path="confirmPassword" class="form-control"
					id="inputEmail3" placeholder="Confirm Password"/>
			</div>
			
			<div class="text-center">
			   <sf:errors path="confirmPassword" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
	</div>
	<br>
	<br>	

		<div class="text-center">
			<button type="submit" class="btn btn-primary" name="operation"
				value="Go">
				<span class="glyphicon glyphicon-floppy-save"></span>
				<s:message code="label.submit"></s:message>
			</button>
		</div>


	</sf:form>
