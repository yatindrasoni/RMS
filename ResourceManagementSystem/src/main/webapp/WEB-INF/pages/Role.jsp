<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page isELIgnored="false"%>

<div class="text-center">
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
<br>
<div class="text-center pull-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>

	<sf:form action="Role" method="post" class="form-inline"
		commandName="form">


		<sf:hidden path="id" />
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>

   <div class="row text-center" style="margin-left: 230">

		<div class="col-sm-4">
			<div class="input-group">
			   <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:input path="roleName" class="form-control" id="inputEmail3" placeholder="Role Name"/>
			</div>
			
			<div class="text-center">
			  <sf:errors path="roleName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="col-sm-4">
			<div class="input-group">
			   <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-book"></span>
			   </span>
				<sf:input path="roleDescription" class="form-control" id="inputEmail3" placeholder="Description"/>
			</div>
			
			<div class="text-center">
			 <sf:errors path="roleDescription" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
	</div>	
	<br>
	<br>

		<div class="text-center" style="margin-right: -1">
			<button type="submit" class="btn btn-primary" name="operation" value="Save">
				<span class="glyphicon glyphicon-floppy-save"></span>
				<s:message code="label.save"></s:message>
			</button>
			&emsp;
			<button type="submit" class="btn btn-primary" name="operation"
				value="CANCEL">
				<span class="glyphicon glyphicon-remove"></span>
				<s:message code="label.cancel"></s:message>
			</button>
		</div>

	</sf:form>

