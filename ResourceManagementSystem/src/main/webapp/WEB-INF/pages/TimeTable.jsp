<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page isELIgnored="false"%>

<div class="text-center" style="margin-right: -150;">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b><s:message code="label.editTimeTable"></s:message></b>
			</c:when>

			<c:otherwise>
				<b><s:message code="label.addTimeTable"></s:message></b>
			</c:otherwise>

		</c:choose>

	</h1>
</div>
<br>

<div class="text-center pull-center" style="margin-left: 140;">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>


<div class="col-sm-offset-4">
	<sf:form action="TimeTable" method="POST" class="form-horizontal"
		commandName="form" id="sandbox-container">

		<sf:hidden path="id" />
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>
		
	
		<div class="form-group">
			<sf:label path="programId" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.programName"></s:message>
				</div>
			</sf:label>
			
			<div class="col-sm-4" style="margin-left: 10;">
				<sf:select class="form-control" STYLE="width: 195px" size="0"
					path="programId">
					<sf:option value="" label="Select" />
					<sf:options items="${programList}" itemValue="id" itemLabel="name" />
				</sf:select>
			</div>
			
			<div class="text-right">
			  <sf:errors path="programId" cssClass="error"
				class="control-label text-danger" for="inputError" />
			</div>	
		</div>
		
		<div class="form-group">
			<sf:label path="trainerId" class="col-sm-3 control-label ">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.trainerName"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: 10;">
				
				<sf:select class="form-control" STYLE="width: 193px" size="0"
					path="trainerId">
					<sf:option value="" label="Select" />
					<sf:options items="${trainerList}" itemValue="id" itemLabel="value" />
				</sf:select>
			</div>
			
			<div class="text-right control-label">
			  <sf:errors path="trainerId" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
		<%-- <div class="form-group">
			<label class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.examDate" />
				</div>
			</label>
			<div class="col-sm-4" style="margin-left: 10;">
				<div class="input-group date">
					<sf:input class="form-control" path="examinationDate" id="dob"
						readonly="true" />
					<span class="input-group-addon" id="basic-addon2"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
			
			<div class="text-right">
			    <sf:errors path="examinationDate" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div> --%>


		<div class="form-group">
			<sf:label path="time" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.time"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: 10;">
				<sf:select class="form-control" STYLE="width: 195px" size="0"
					path="time">
					<sf:option value="" label="Select" />
					<sf:option value="10:00 AM - 1:00 AM" label="10:00 AM - 1:00 AM" />
					<sf:option value="2:00 AM - 5:00 AM" label="2:00 AM - 5:00 AM" />
				</sf:select>
			</div>
			
			<div class="text-right">
			   <sf:errors path="time" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-offset-2 col-sm-10" style="margin-left: -145; margin-top: 30;">
			<button type="submit" style="margin-left: 20;"
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

			<%-- 			<c:if test="${form.id > 0}">
				<button type="submit" class="btn btn-primary" name="operation"
					value="Delete">Delete</button>
			</c:if>
 --%>
		</div>

	</sf:form>
</div>
