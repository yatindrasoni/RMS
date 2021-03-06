<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page isELIgnored="false"%>


<div class="text-center" style="margin-right: -150; margin-top: -20;">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b><s:message code="label.editFaculty"></s:message></b>

			</c:when>
			<c:otherwise>
				<b><s:message code="label.addFaculty"></s:message></b>
			</c:otherwise>
		</c:choose>

	</h1>
</div>

<div class="text-center pull-center" style="margin-left: 140;">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>



<div class="col-sm-offset-4">
	<sf:form action="Faculty" method="POST" class="form-horizontal"
		commandName="form" id="sandbox-container">

		<sf:hidden path="id" />
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>

		<%-- <div class="form-group">
			<sf:label path="collegeId" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -30;">
					<s:message code="label.college"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4 dropdown" style="margin-left: -30;">

				<sf:select class="form-control" STYLE="width: 193px" size="0"
					path="collegeId">
					<li><sf:option value="" label="Select" /></li>
					<li><sf:options items="${collegeList}" itemValue="id"
							itemLabel="name" /></li>
				</sf:select>


			</div>
			
			<div class="text-right">
			  <sf:errors path="collegeId" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div> --%>

		<%-- <div class="form-group" style="margin-top: -8;">
			<sf:label path="primarySubject" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -30;">
					<s:message code="label.primarySubject"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:select class="form-control" STYLE="width: 193px" size="0"
					path="primarySubject">
					<sf:option value="" label="Select" />
					<sf:option value="Physics" label="Physics" />
					<sf:option value="Chemistry" label="Chemistry" />
					<sf:option value="Maths" label="Maths" />

				</sf:select>
			</div>
			
			<div class="text-right">
			  <sf:errors path="primarySubject" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div> --%>


		<%-- <div class="form-group" style="margin-top: -8;">
			<sf:label path="secondarySubject" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -30;">
					<s:message code="label.secondarySubject"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:select class="form-control" STYLE="width: 193px" size="0"
					path="secondarySubject">
					<sf:option value="" label="Select" />
					<sf:option value="Physics" label="Physics" />
					<sf:option value="Chemistry" label="Chemistry" />
					<sf:option value="Maths" label="Maths" />

				</sf:select>
			</div>
			
			<div class="text-right">
			  <sf:errors path="secondarySubject" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div> --%>
		
		
		
		<div class="form-group" style="margin-top: 30;">
			<sf:label path="firstName" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -30;">
					<s:message code="label.firstName"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:input path="firstName" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right">
			   <sf:errors path="firstName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group" style="margin-top: -8;">
			<sf:label path="lastName" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -30;">
					<s:message code="label.lastName"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:input path="lastName" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right">
			  <sf:errors path="lastName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="form-group" style="margin-top: -8;">
			<sf:label path="email" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -30;">
					<s:message code="label.email"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<c:if test="${form.id==0}">
					<sf:input path="email" class="form-control" id="inputEmail3" />
				</c:if>
				<c:if test="${form.id>0}">
					<sf:input path="email" class="form-control" id="inputEmail3"
						readonly="true" />
				</c:if>
			</div>
			
			<div class="text-right">
			  <sf:errors path="email" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group" style="margin-top: -8;">
			<label class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -30;">
					<s:message code="label.dob" />
				</div>
			</label>
			<div class="col-sm-4" style="margin-left: -30;">
				<div class="input-group date">
					<sf:input class="form-control" path="dob" id="dob" readonly="true" />
					<span class="input-group-addon" id="basic-addon2"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
			
			<div class="text-right">
			   <sf:errors path="dob" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="form-group" style="margin-top: -8;">
			<sf:label path="mobileNo" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -30;">
					<s:message code="label.mobileNo"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:input path="mobileNo" maxlength="10" class="form-control"
					id="inputEmail3" />

			</div>
			
			<div class="text-right">
			  <sf:errors path="mobileNo" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
		<div class="form-group" style="margin-top: -8;">
			<sf:label path="programId" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -30;">
					<s:message code="label.programName"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:select class="form-control" STYLE="width: 193px" size="0"
					path="programId">
					<sf:option value="" label="Select" />
					<sf:options items="${programList}" itemValue="id" itemLabel="name" />
				</sf:select>
			</div>
			
			<div class="text-right">
			  <sf:errors path="programId" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		

		<div class="col-sm-offset-2 col-sm-10" style="margin-left: -175; margin-top: 30;">
			<button type="submit" style="margin-left: 15;"
				class="btn btn-primary" name="operation" value="Save">
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
</div>