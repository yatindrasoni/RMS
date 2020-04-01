<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page isELIgnored="false"%>


<div class="text-center" style="margin-right: -380; margin-top: -20;">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b style="margin-left: -15"><s:message code="label.editTrainer"></s:message></b>

			</c:when>
			<c:otherwise>
				<b style="margin-left: -15"><s:message code="label.addTrainer"></s:message></b>
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




<div>
	<sf:form action="Trainer" method="POST" class="form-horizontal"
		commandName="form" id="sandbox-container">

		<sf:hidden path="id" />
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>
		
  <div class="row" style="margin-top: 10">

	 <div class="row" style="margin-bottom: -50">	
		
		<div class="col-sm-4">
			<sf:label path="firstName" class="col-sm-3 control-label">
				<div class="text-right" style="margin-right: -130;">
					<s:message code="label.firstName1"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-8" style="margin-left: 200; margin-top: -17">
				<sf:input path="firstName" class="form-control" id="inputEmail3" />
			</div>
			<div class="text-right" style="margin-top: 35; margin-right: -75">
			   <sf:errors path="firstName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<sf:label path="lastName" class="col-sm-3 control-label">
				<div class="text-right" style="margin-right: -160;">
					<s:message code="label.lastName1"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-8" style="margin-left: 230; margin-top: -17">
				<sf:input path="lastName" class="form-control" id="inputEmail3" />

		</div>
			
			<div class="text-right" style="margin-top: 35; margin-right: -103">
			  <sf:errors path="lastName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="col-sm-4">
			<sf:label path="email" class="col-sm-3 control-label">
				<div class="text-right" style="margin-right: -180;">
					<s:message code="label.email"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-8" style="margin-left: 304; margin-top: -17; padding-right: 0.10em;">
				<c:if test="${form.id==0}">
					<sf:input path="email" class="form-control" id="inputEmail3" />
				</c:if>
				<c:if test="${form.id>0}">
					<sf:input path="email" class="form-control" id="inputEmail3"
						readonly="true" />
				</c:if>
			</div>
			<div class="text-right" style="margin-top: 35; margin-right: -158">
			  <sf:errors path="email" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
	</div>	
 
     <div class="row" style="margin: 65;">
     
		<div class="col-sm-4">
			<label class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 15;">
					<s:message code="label.dob" />
				</div>
			</label>
			<div class="col-sm-8" style="margin-left: 120; margin-top: -18; padding-right: 0.10em;">
				<div class="input-group date">
					<sf:input class="form-control" path="dob" id="dob" readonly="true" />
					<span class="input-group-addon" id="basic-addon2"> 
					 <span class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
			<div class="text-right" style="margin-top: 35; margin-right: 3">
			   <sf:errors path="dob" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<sf:label path="mobileNo" class="col-sm-3 control-label">
				<div class="text-right" style="margin-right: -142;">
					<s:message code="label.mobileNo"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-9" style="margin-left: 203; padding-right: 0.10em; margin-top: -18">
				<sf:input path="mobileNo" maxlength="10" class="form-control" id="inputEmail3" />
			</div>
			<div class="text-right" style="margin-top: 35; margin-right: -124">
			  <sf:errors path="mobileNo" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
		<div class="col-sm-4" style="margin-top: -8;">
			<sf:label path="programId" class="col-sm-3 control-label">
				<div class="text-right" style="margin-right: -273; margin-top: 10">
					<s:message code="label.programName"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: 330; margin-top: -18">
				<sf:select class="form-control" STYLE="width: 193px" size="0"
					path="programId">
					<sf:option value="" label="Select" />
					<sf:options items="${programList}" itemValue="id" itemLabel="name" />
				</sf:select>
			</div>
			
			<div class="text-right" style="margin-top: 50; margin-right: -208">
			  <sf:errors path="programId" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
	</div>	
	
	<div class="row" style="margin-top: -50">
		
		<div class="col-sm-4">
			<sf:label path="address" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 95;">
					<s:message code="label.address"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-8" style="margin-left: 199; margin-top: -18;">
				<sf:input path="address" maxlength="10" class="form-control" id="inputEmail3" />
			</div>
			<div class="text-right" style="margin-top: 35; margin-right: -56">
			  <sf:errors path="address" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
	</div>

		<div class="col-sm-offset-2 col-sm-10" style="margin-left: -42; margin-top: 30;">
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
	  </div>	
	</sf:form>
</div>
