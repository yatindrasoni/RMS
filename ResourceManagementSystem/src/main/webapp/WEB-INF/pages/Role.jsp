<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page isELIgnored="false"%>

<div class="text-center" style="margin-right: -190;">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b><s:message code="label.editRole"></s:message></b>

			</c:when>
			<c:otherwise>
				<b><s:message code="label.addRole"></s:message></b>
			</c:otherwise>
		</c:choose>

	</h1>
</div>
<div class="text-center pull-center" style="margin-right: -180;">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>


<div class="col-sm-offset-4">
	<sf:form action="Role" method="post" class="form-horizontal"
		commandName="form">


		<sf:hidden path="id" />
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>



		<div class="form-group">
			<sf:label path="roleName" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 45;">
					<s:message code="label.rolename1"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-right: -160;">
				<sf:input path="roleName" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right">
			  <sf:errors path="roleName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="form-group">
			<sf:label path="roleDescription" for="inputPassword3"
				class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 45;">
					<s:message code="label.description"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-right: -160;">
				<sf:input path="roleDescription" class="form-control"
					id="inputEmail3" />

			</div>
			
			<div class="text-right">
			 <sf:errors path="roleDescription" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-offset-2 col-sm-10" style="margin-left: -160; margin-top: 30;">
			<button type="submit" style="margin-left: 45;" class="btn btn-primary" name="operation" value="Save">
				<span class="glyphicon glyphicon-floppy-save"></span>
				<s:message code="label.save"></s:message>
			</button>
			&emsp;
			<button type="submit" class="btn btn-primary" name="operation"
				value="CANCEL">
				<span class="glyphicon glyphicon-remove"></span>
				<s:message code="label.cancel"></s:message>
			</button>

			<%-- 			<c:if test="${form.id > 0}">
				<button type="submit" class="btn btn-primary" name="operation"
					value="Delete">Delete</button>
			</c:if>
 --%>
		</div>

	</sf:form>
</div>
