<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="text-center " style="margin-top: -15; margin-right: -150;">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b><s:message code="label.editAssignPrograms"></s:message></b>

			</c:when>
			<c:otherwise>
				<b><s:message code="label.addAssignPrograms"></s:message></b>
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

<div class="container">
	<div>
		<sf:form id="sandbox-container" action="AssignPrograms" method="POST"
			class="form-inline" commandName="form">


			<sf:hidden path="id" />
			<sf:hidden path="createdBy" />
			<sf:hidden path="modifiedBy" />
			<sf:hidden path="createdDatetime" />
			<sf:hidden path="modifiedDatetime" />
			<%-- <sf:hidden path="email" /> --%>


			<div class="row" style="margin-top: 10">

				<div class="row" style="margin-bottom: -50">

					<div class="col-sm-4">
						<div class="input-group" style="margin-right: 10;">
						  <span class="input-group-addon"> 
			                <span class="glyphicon glyphicon-user"></span>
			              </span>
							<sf:input path="firstName" class="form-control" id="inputEmail3"
								value="${sessionScope.firstName }" readonly="true" />
						</div>
						<div class="text-right" style="margin-top: 1; margin-right: 15">
							<sf:errors path="firstName" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

					<div class="col-sm-4">
						<div class="input-group" style="margin-right: 29;">
						  <span class="input-group-addon"> 
			                <span class="glyphicon glyphicon-user"></span>
			              </span>
							<sf:input path="lastName" class="form-control" id="inputEmail3"
								value="${sessionScope.lastName}" readonly="true" />
						</div>

						<div class="text-right" style="margin-top: 1; margin-right: 38">
							<sf:errors path="lastName" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					
					</div>
					

					<div class="col-sm-4">
						<div class="input-group" style="margin-right: 60;">
						  <span class="input-group-addon"> 
			                <span class="glyphicon glyphicon-user"></span>
			              </span>
							<sf:select class="form-control" STYLE="width: 195px" size="0" path="programId">
								<sf:option value="" label="Select" />
								<sf:options items="${programList}" itemValue="id"
									itemLabel="name" />
							</sf:select>
						</div>

						<div class="text-right" style="margin-top: 1; margin-right: 178">
							<sf:errors path="programId" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

				</div>
				 <div class="row" style="margin: 80;">

					<div class="col-sm-4">
						<div class="input-group" style="margin-right: 44;">
						  <span class="input-group-addon"> 
			                 <span style="font-size:22px">&#8377;</span>
			              </span>
							<sf:input path="fee" class="form-control" id="inputEmail3" placeholder="Fee"/>
						</div>

						<div class="text-right" style="margin-top: 1; margin-right: 174">
							<sf:errors path="fee" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>


					<div class="col-sm-4">
						<div class="input-group" style="margin-right: -2;">
						  <span class="input-group-addon"> 
			                <span style="font-size:22px">&#8377;</span>
			              </span>
							<sf:input path="paid" class="form-control" id="inputEmail3" placeholder="Paid"/>
						</div>
						<div class="text-right" style="margin-top: 1; margin-right: 121">
							<sf:errors path="paid" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

					<div class="col-sm-4">
						<div class="input-group" style="margin-right: -44;">
						  <span class="input-group-addon"> 
			               <span style="font-size:22px">&#8377;</span>
			              </span>
							<sf:input path="due" class="form-control" id="inputEmail3" placeholder="Due"/>
						</div>
						<div class="text-right" style="margin-top: 1; margin-right: 84">
							<sf:errors path="due" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

				</div>

				<div class="row" style="margin-top: -50">

					<div class="col-sm-4">
						<div class="input-group" style="margin-right: 12;">
						  <span class="input-group-addon"> 
			               <span style="font-size:22px">&#8377;</span>
			              </span>
							<sf:input path="discount" class="form-control" id="inputEmail3" placeholder="Discount"/>
						</div>
						<div class="text-right" style="margin-top: 1; margin-right: 102">
							<sf:errors path="discount" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>
					
						<div class="col-sm-4" style="margin-left: -5;">
							<sf:input path="email" type="hidden" class="form-control" id="inputEmail3" value="${sessionScope.email}" readonly="true" />
						</div>
						
				</div>


				<div class="row" style="margin: 40;">
					<div class="col-sm-offset-2 col-sm-10" style="margin-left: -230;">
						<button type="submit" class="btn btn-primary" name="operation"
							value="Save">
							<span class="glyphicon glyphicon-floppy-save"></span>
							<s:message code="label.save"></s:message>
						</button>
						&emsp;
						
		<c:choose>
			<c:when test="${form.id > 0}">
				<input type=button onClick="parent.location='http://localhost:8080/ResourceManagementSystem/ctl/AssignPrograms/search'" value='Back'
				  class="btn btn-primary">

			</c:when>
			
			<c:otherwise>
			
				<button type="submit" class="btn btn-primary" name="operation" value="Cancel">
							<span class="glyphicon glyphicon-remove"></span>
							<s:message code="label.cancel"></s:message>
				</button>
			</c:otherwise>
		</c:choose>
						

					</div>
				</div>


			</div>

		</sf:form>
	</div>
</div>
<script type="text/javascript">
	$('#sandbox-container .input-group.date').datepicker({
		orientation : "bottom auto",
		autoclose : true,
		todayHighlight : true

	});
	
	/* function NewTab() { 
        window.open("http://localhost:8080/ResourceManagementSystem/ctl/Candidate/search"); 
    }  */
</script>
