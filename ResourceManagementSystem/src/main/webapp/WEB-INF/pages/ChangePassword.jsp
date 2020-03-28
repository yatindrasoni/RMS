<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>

<div class="text-center" style="margin-right: -150;">
	<h1 class="text-primary">
		<b><s:message code="label.changePassword"></s:message></b>
	</h1>
</div>
<br>
<div class="text-center pull-center" style="margin-left: 140">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>

<div class="col-sm-offset-4">
	<sf:form method="post" class="form-horizontal" commandName="form">
		<sf:hidden path="id" />
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>

		<div class="form-group">
			<sf:label path="oldPassword" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -20;">
					<s:message code="label.oldPassword"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:password path="oldPassword" class="form-control"
					id="inputEmail3" />

			</div>
			
			<div class="text-right">
			  <sf:errors path="oldPassword" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group">
			<sf:label path="newPassword" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -20;">
					<s:message code="label.newPassword"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:password path="newPassword" class="form-control"
					id="inputEmail3" />

			</div>
			
			<div class="text-right">
			   <sf:errors path="newPassword" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group">
			<sf:label path="confirmPassword" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -20;">
					<s:message code="label.confirmPassword"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:password path="confirmPassword" class="form-control"
					id="inputEmail3" />

			</div>
			
			<div class="text-right">
			   <sf:errors path="confirmPassword" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-offset-2 col-sm-10" style="margin-left: 160;">
			<button type="submit" class="btn btn-primary" name="operation"
				value="Go">
				<span class="glyphicon glyphicon-floppy-save"></span>
				<s:message code="label.submit"></s:message>
			</button>
		</div>


	</sf:form>
</div>