<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page isELIgnored="false"%>

<div class="col-sm-offset-4" style="margin-right: 190; margin-top: -10;">
	<h1 class="text-primary">
		<b><s:message code="label.getMarksheet"></s:message></b>
	</h1>
</div>
<br>
<div class="text-center pull-center" style="margin-left: 140;">
	<c:if test="${success!=null}">
		<div style="max-width: 10px" class="alert alert-success"
			class="success">${success}</div>
	</c:if>
	<c:if test="${error!=null}">

		<div class="alert alert-danger">
			<font>${error}</font>
		</div>

	</c:if>
</div>


<div class="col-sm-offset-2">
	<sf:form method="post" class="form-horizontal" commandName="form">


		<sf:hidden path="id" />
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>



		<div class="form-group">
			<sf:label path="rollNo" class="col-sm-2 control-label">
			
			<div class="text-right" style="margin-right: -180;">
				<s:message code="label.rollNo"></s:message>
			</div>	
			</sf:label>
			<div class="col-sm-4" style="margin-left: 200;">
				<sf:input path="rollNo" class="form-control" required="required"
					id="inputEmail3" />

			</div>
			
			<div class="text-right">
			  <sf:errors path="rollNo" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	

			<button type="submit" class="btn btn-primary" name="operation"
				value="Go">
				<s:message code="label.go"></s:message>
			</button>
		</div>
	</sf:form>
	<HR>
	<div class="col-sm-7" style="margin-left: 210;">
		<table class="table table-hover table-bordered">

			<c:if test="${ form.rollNo!=null }">
				<c:if test="${ error==null }">


					<tr class="info">
						<td><span class="glyphicon glyphicon-user"></span> <s:message
								code="label.student" /></td>
						<td><c:out value="${form.candidateName}" /></td>
					</tr>
					<tr class="danger">
						<td><span class="glyphicon glyphicon-education"></span> <s:message
								code="label.collegeName1" /></td>
						<td><c:out value="${form.collegeName}" /></td>
					</tr>
					<tr class="info">
						<td><span class="glyphicon glyphicon-tasks"></span> <s:message
								code="label.rollNo" /></td>
						<td><c:out value="${form.rollNo}" /></td>
					</tr>
					<tr class="danger">
						<td><span class="glyphicon glyphicon-align-center"></span> <s:message
								code="label.chemistry" /></td>
						<td><c:out value="${form.chemistry}" /></td>
					</tr>
					<tr>
					<tr class="info">
						<td><span class="glyphicon glyphicon-align-center"></span> <s:message
								code="label.physics" /></td>
						<td><c:out value="${form.physics}" /></td>
					</tr>
					<tr>
					<tr class="danger">
						<td><span class="glyphicon glyphicon-align-center"></span> <s:message
								code="label.maths" /></td>
						<td><c:out value="${form.maths}" /></td>
					</tr>
					<tr>
					<tr class="info">
						<td><span class="glyphicon glyphicon-align-center"></span> <s:message
								code="label.total" /></td>
						<td><c:out
								value="${form.maths  +form.physics + form.chemistry}" /></td>
					</tr>

				</c:if>
			</c:if>
		</table>
	</div>
</div>
