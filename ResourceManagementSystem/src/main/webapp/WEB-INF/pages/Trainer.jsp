<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page isELIgnored="false"%>


<div class="text-center">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b><s:message code="label.editTrainer"></s:message></b>

			</c:when>
			<c:otherwise>
				<b><s:message code="label.addTrainer"></s:message></b>
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

<sf:form action="Trainer" method="POST" class="form-inline"
	commandName="form" id="sandbox-container">

	<sf:hidden path="id" />
	<sf:hidden path="createdBy"></sf:hidden>
	<sf:hidden path="modifiedBy"></sf:hidden>
	<sf:hidden path="createdDatetime"></sf:hidden>
	<sf:hidden path="modifiedDatetime"></sf:hidden>

	<div class="row text-center">

		<div class="col-sm-4">
			<div class="input-group">
				<span class="input-group-addon"> <span
					class="glyphicon glyphicon-user"></span>
				</span>
				<sf:input path="firstName" class="form-control" id="inputEmail3"
					placeholder="First Name" />
			</div>
			<div class="text-center">
				<sf:errors path="firstName" cssClass="error"
					class="control-label text-danger" for="inputError1" />
			</div>
		</div>

		<div class="col-sm-4">
			<div class="input-group">
				<span class="input-group-addon"> <span
					class="glyphicon glyphicon-user"></span>
				</span>
				<sf:input path="lastName" class="form-control" id="inputEmail3"
					placeholder="Last Name" />
			</div>

			<div class="text-center">
				<sf:errors path="lastName" cssClass="error"
					class="control-label text-danger" for="inputError1" />
			</div>
		</div>

		<div class="col-sm-4">
			<div class="input-group">
				<span class="input-group-addon"> <span
					class="glyphicon glyphicon-envelope"></span>
				</span>
				<c:if test="${form.id==0}">
					<sf:input path="email" class="form-control" id="inputEmail3"
						placeholder="Email Id" />
				</c:if>
				<c:if test="${form.id>0}">
					<sf:input path="email" class="form-control" id="inputEmail3"
						readonly="true" />
				</c:if>
			</div>
			<div class="text-center">
				<sf:errors path="email" cssClass="error"
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
					<span class="input-group-addon" id="basic-addon2"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
					<sf:input class="form-control" path="dob" id="dob" readonly="true"
						placeholder="DOB" />
				</div>
			</div>
			<div class="text-center">
				<sf:errors path="dob" cssClass="error"
					class="control-label text-danger" for="inputError1" />
			</div>
		</div>

		<div class="col-sm-4">
			<div class="input-group">
				<span class="input-group-addon"> <span
					class="glyphicon glyphicon-phone"></span>
				</span>
				<sf:input path="mobileNo" maxlength="10" class="form-control"
					id="inputEmail3" placeholder="Mobile No." />
			</div>
			<div class="text-center">
				<sf:errors path="mobileNo" cssClass="error"
					class="control-label text-danger" for="inputError1" />
			</div>
		</div>

		<div class="col-sm-4">
			<div class="input-group">
				<span class="input-group-addon"> <span
					class="glyphicon glyphicon-education"></span>
				</span>
				<sf:select class="form-control" STYLE="width: 193px" size="0"
					path="programId">
					<sf:option value="" label="Select" />
					<sf:options items="${programList}" itemValue="id" itemLabel="name" />
				</sf:select>
			</div>

			<div class="text-center">
				<sf:errors path="programId" cssClass="error"
					class="control-label text-danger" for="inputError1" />
			</div>
		</div>

	</div>
	<br>
	<br>

	<div class="row text-center">

		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"> <span
					class="glyphicon glyphicon-envelope"></span>
				</span>
				<sf:input path="address" maxlength="10" class="form-control"
					id="inputEmail3" placeholder="Address" />
			</div>
			<div class="text-center">
				<sf:errors path="address" cssClass="error"
					class="control-label text-danger" for="inputError1" />
			</div>
		</div>

	</div>
	<br>
	<br>

	<div class="text-center">
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

