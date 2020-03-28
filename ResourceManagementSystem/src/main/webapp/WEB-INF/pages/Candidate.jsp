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
				<b><s:message code="label.editCandiate"></s:message></b>

			</c:when>
			<c:otherwise>
				<b><s:message code="label.addCandidate"></s:message></b>
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
		<sf:form id="sandbox-container" action="Candidate" method="POST"
			class="form-inline" commandName="form">


			<sf:hidden path="id" />
			<sf:hidden path="createdBy" />
			<sf:hidden path="modifiedBy" />
			<sf:hidden path="createdDatetime" />
			<sf:hidden path="modifiedDatetime" />


			<div class="row" style="margin-top: 10">

				<div class="row" style="margin-bottom: -50">

					<div class="col-sm-4">
						<sf:label path="firstName" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 32;">
								<s:message code="label.firstName1"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: 15;">
							<sf:input path="firstName" class="form-control" id="inputEmail3" />

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 15">
							<sf:errors path="firstName" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

					<div class="col-sm-4">
						<sf:label path="lastName" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 22;">
								<s:message code="label.lastName1"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -5;">
							<sf:input path="lastName" class="form-control" id="inputEmail3" />

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 35">
							<sf:errors path="lastName" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>


				<c:choose>
						<c:when test="${form.id > 0}">
							<div class="col-sm-4">
								<sf:label path="email" class="col-sm-5 control-label">
									<div class="text-left" style="margin-left: 5;">
										<s:message code="label.email"></s:message>
									</div>
								</sf:label>
								<div class="col-sm-4" style="margin-left: -30;">
								  <label for="readonly"></label>
									<sf:input path="email" class="form-control" id="inputEmail3" readonly="true" />
							
								</div>

								<div class="text-right" style="margin-top: 35; margin-right: 80">
									<sf:errors path="email" cssClass="error"
										class="control-label text-danger" for="inputError1" />
								</div>
							</div>
						</c:when>
						
					<c:otherwise>
					  <div class="col-sm-4">
						<sf:label path="email" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 5;">
								<s:message code="label.email"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -30;">
							<sf:input path="email" class="form-control" id="inputEmail3" />

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 80">
							<sf:errors path="email" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					  </div>
					</c:otherwise>
				</c:choose>

            </div>
            
				<div class="row" style="margin: 70;">

					<div class="col-sm-4">
						<sf:label path="collegeName" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: -52;">
								<s:message code="label.collegeName1"></s:message>
							</div>
						</sf:label>

						<div class="col-sm-4" style="margin-left: -45;">
							<sf:input path="collegeName" class="form-control"
								id="inputEmail3" />
						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 20">
							<sf:errors path="collegeName" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>


					<div class="col-sm-4">
						<sf:label path="contactNo" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: -7;">
								<s:message code="label.contactNo"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -10;">
							<sf:input path="contactNo" maxlength="10" class="form-control"
								id="inputEmail3" />

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: -35">
							<sf:errors path="contactNo" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

					<div class="col-sm-4">
						<sf:label path="aadharNo" class="col-sm-6 control-label">
							<div class="text-left" style="margin-left: 32;">
								<s:message code="label.aadharNo"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -5;">
							<sf:input path="aadharNo" class="form-control" id="inputEmail3"
								placeholder="Optional" />

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: -35">
							<sf:errors path="aadharNo" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>
				
				</div>

				<div class="row" style="margin-top: -50">

					<div class="col-sm-4">
						<label class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 35;">
								<s:message code="label.dob" />
							</div>
						</label>
						<div class="col-sm-6" style="margin-left: 15; width: 200px">
							<div class="input-group date">
								<sf:input class="form-control" path="dob" id="dob"
									readonly="true" />
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
							</div>
						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 65">
							<sf:errors path="dob" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>


					<div class="col-sm-4">
						<sf:label path="address" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 25;">
								<s:message code="label.address"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -5;">
							<sf:input path="address" class="form-control" id="inputEmail3" />

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 50">
							<sf:errors path="address" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

					<div class="col-sm-4">
						<sf:label path="country" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 3;">
								<s:message code="label.country"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -30;">
							<sf:input path="country" class="form-control" id="inputEmail3" />

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 82">
							<sf:errors path="country" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>
				</div>


				<div class="row" style="margin: 20;">

					<div class="col-sm-4">
						<sf:label path="state" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: -3;">
								<s:message code="label.state"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -10;">
							<sf:input path="state" class="form-control" id="inputEmail3" />

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 22">
							<sf:errors path="state" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

					<div class="col-sm-4">
						<sf:label path="city" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 14;">
								<s:message code="label.city"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -7;">
							<sf:input path="city" class="form-control" id="inputEmail3" />

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 28">
							<sf:errors path="city" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

					<div class="col-sm-4">
						<sf:label path="gender" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 15;">
								<s:message code="label.gender"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -8;">
							<sf:select class="form-control" STYLE="width: 193px" size="0"
								path="gender">
								<sf:option value="" label="Select" />
								<sf:option value="Male" label="Male" />
								<sf:option value="Female" label="Female" />
							</sf:select>
						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 50">
							<sf:errors path="gender" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>
				</div>


				<div class="row" style="margin: 10;">

					<div class="col-sm-4">
						<sf:label path="year" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 8;">
								<s:message code="label.year"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -3;">
							<sf:input path="year" class="form-control" id="inputEmail3" />

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 72">
							<sf:errors path="year" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

					<div class="col-sm-4">
						<sf:label path="semester" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 16;">
								<s:message code="label.semester"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -5;">
							<sf:select class="form-control" STYLE="width: 193px" size="0"
								path="semester">
								<sf:option value="" label="Select" />
								<sf:option value="0" label="Graduated" />
								<sf:option value="1" label="1" />
								<sf:option value="2" label="2" />
								<sf:option value="3" label="3" />
								<sf:option value="4" label="4" />
								<sf:option value="5" label="5" />
								<sf:option value="6" label="6" />
								<sf:option value="7" label="7" />
								<sf:option value="8" label="8" />

							</sf:select>
						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 36">
							<sf:errors path="semester" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>

					<div class="col-sm-4">
						<sf:label path="branch" class="col-sm-5 control-label">
							<div class="text-left" style="margin-left: 12;">
								<s:message code="label.branch"></s:message>
							</div>
						</sf:label>
						<div class="col-sm-4" style="margin-left: -14;">
							<sf:select class="form-control" STYLE="width: 193px" size="0"
								path="branch">

								<sf:option value="" label="Select" />
								<sf:option value="Computer Science & Engineering"
									label="Computer Science & Engineering" />
								<sf:option value="Information Technology"
									label="Information Technology" />
								<sf:option value="Civil Engineering" label="Civil Engineering" />
								<sf:option value="Electronics & Communication Engineering"
									label="Electronics & Communication Engineering" />
								<sf:option value="Electrical Engineering"
									label="Electrical Engineering" />
								<sf:option value="Electronics & Instrumentation Engineering"
									label="Electronics & Instrumentation Engineering" />
								<sf:option value="Mechanical Engineering"
									label="Mechanical Engineering" />
								<sf:option value="Automobile Engineering"
									label="Automobile Engineering" />
								<sf:option value="Bachelors in Computer Application"
									label="Bachelors in Computer Application" />
								<sf:option value="B.Sc.Computer Science"
									label="B.Sc.Computer Science" />
								<sf:option value="Master of Computer Application"
									label="Master of Computer Application" />
								<sf:option value="M.Sc. Computer Science"
									label="M.Sc. Computer Science" />
								<sf:option value="B.Com" label="B.Com" />
								<sf:option value="M.com" label="M.com" />
								<sf:option value="BBA" label="BBA" />
								<sf:option value="MBA" label="MBA" />
								<sf:option value="IT" label="IT" />
								<sf:option value="Others" label="Others" />

							</sf:select>

						</div>

						<div class="text-right" style="margin-top: 35; margin-right: 13">
							<sf:errors path="branch" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>
				</div>


				<div class="row" style="margin: 40;">
					<div class="col-sm-offset-2 col-sm-10" style="margin-left: -180;">
						<button type="submit" class="btn btn-primary" name="operation"
							value="Save">
							<span class="glyphicon glyphicon-floppy-save"></span>
							<s:message code="label.save"></s:message>
						</button>
						&emsp;
						<button type="submit" class="btn btn-primary" name="operation"
							value="Cancel">
							<span class="glyphicon glyphicon-remove"></span>
							<s:message code="label.cancel"></s:message>
						</button>

						<%-- 			<c:if test="${form.id > 0}">
				<button type="submit" class="btn btn-primary" name="operation"
					value="Delete">Delete</button>
			</c:if>
 --%>
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
</script>
