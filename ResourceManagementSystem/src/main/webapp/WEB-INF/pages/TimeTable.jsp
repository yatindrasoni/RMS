<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page isELIgnored="false"%>

<div class="text-center">
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

<div class="text-center pull-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>

	<sf:form action="TimeTable" method="POST" class="form-inline"
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
					class="glyphicon glyphicon-education"></span>
				</span>
				<sf:select class="form-control" STYLE="width: 195px" size="0"
					path="programId">
					<sf:option value="" label="Select" />
					<sf:options items="${programList}" itemValue="id" itemLabel="name" />
				</sf:select>
			</div>
			
			<div class="text-center">
			  <sf:errors path="programId" cssClass="error"
				class="control-label text-danger" for="inputError" />
			</div>	
		</div>
		
		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"> <span
					class="glyphicon glyphicon-user"></span>
				</span>
				<sf:select class="form-control" STYLE="width: 193px" size="0"
					path="trainerId">
					<sf:option value="" label="Select" />
					<sf:options items="${trainerList}" itemValue="id" itemLabel="value" />
				</sf:select>
			</div>
			
			<div class="text-center">
			  <sf:errors path="trainerId" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
		<div class="col-sm-4">
			<div class="input-group">
			  <span class="input-group-addon"> <span
					class="glyphicon glyphicon-time"></span>
				</span>
				<sf:select class="form-control" STYLE="width: 195px" size="0"
					path="time">
					<sf:option value="" label="Select" />
					<sf:option value="10:00 AM - 1:00 AM" label="10:00 AM - 1:00 AM" />
					<sf:option value="2:00 AM - 5:00 AM" label="2:00 AM - 5:00 AM" />
				</sf:select>
			</div>
			
			<div class="text-center">
			   <sf:errors path="time" cssClass="error"
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
      </div>
	</sf:form>
</div>
</div>