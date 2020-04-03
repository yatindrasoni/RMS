<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="text-center">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b style="margin-left: -30"><s:message code="label.editCandiate"></s:message></b>

			</c:when>
			<c:otherwise>
				<b style="margin-left: -30"><s:message code="label.addCandidate"></s:message></b>
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

		<sf:form id="sandbox-container" action="Candidate" method="POST"
			class="form-inline" commandName="form">


			<sf:hidden path="id" />
			<sf:hidden path="createdBy" />
			<sf:hidden path="modifiedBy" />
			<sf:hidden path="createdDatetime" />
			<sf:hidden path="modifiedDatetime" />


			<div class="row text-center">

					<div class="col-sm-4">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-user"></span>
							</span>
							<sf:input path="firstName" class="form-control" id="inputEmail3" placeholder="First Name"/>
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
							<sf:input path="lastName" class="form-control" id="inputEmail3" placeholder="Last Name"/>
						</div>

						<div class="text-center">
							<sf:errors path="lastName" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>


					<c:choose>
						<c:when test="${form.id > 0}">
							<div class="input-group">
							   <span class="input-group-addon"> <span
								class="glyphicon glyphicon-envelope"></span>
							   </span>
								<label for="readonly"></label>
								<sf:input path="email" class="form-control" id="inputEmail3"
									readonly="true" placeholder="Email Id"/>

							</div>

							<div class="text-center">
								<sf:errors path="email" cssClass="error"
									class="control-label text-danger" for="inputError1" />
							</div>
				
				</c:when>

				<c:otherwise>
					<div class="col-sm-4">
						<div class="input-group">
						   <span class="input-group-addon"> <span
								class="glyphicon glyphicon-envelope"></span>
							</span>
						  <sf:input path="email" class="form-control" id="inputEmail3" placeholder="Email Id"/>
						</div>

						<div class="text-center">
							<sf:errors path="email" cssClass="error"
								class="control-label text-danger" for="inputError1" />
						</div>
					</div>
				</c:otherwise>
				</c:choose>

			</div>
			<br>
			<br>

			<div class="row text-center">

				<div class="col-sm-4">
					<div class="input-group">
					   <span class="input-group-addon"> <span
								class="glyphicon glyphicon-education"></span>
					   </span>
						<sf:input path="collegeName" class="form-control" id="inputEmail3" placeholder="College Name"/>
					</div>

					<div class="text-center">
						<sf:errors path="collegeName" cssClass="error"
							class="control-label text-danger" for="inputError1" />
					</div>
				</div>


				<div class="col-sm-4">
					<div class="input-group">
					   <span class="input-group-addon"> <span
								class="glyphicon glyphicon-phone"></span>
					   </span>
						<sf:input path="contactNo" maxlength="10" class="form-control"
							id="inputEmail3" placeholder="Contact No."/>

					</div>

					<div class="text-center">
						<sf:errors path="contactNo" cssClass="error"
							class="control-label text-danger" for="inputError1" />
					</div>
				</div>

				<div class="col-sm-4">
					<div class="input-group">
					   <span class="input-group-addon"> <span
								class="glyphicon glyphicon-user"></span>
					   </span>
						<sf:input path="aadharNo" class="form-control" id="inputEmail3"
							placeholder="Aadhar No. Optional" />

					</div>

					<div class="text-center">
						<sf:errors path="aadharNo" cssClass="error"
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
						   <span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
							</span>
							<sf:input class="form-control" path="dob" id="dob"
								readonly="true" placeholder="DOB"/>
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
								class="glyphicon glyphicon-envelope"></span>
					   </span>
						<sf:input path="address" class="form-control" id="inputEmail3" placeholder="Address"/>

					</div>

					<div class="text-center">
						<sf:errors path="address" cssClass="error"
							class="control-label text-danger" for="inputError1" />
					</div>
				</div>

				<div class="col-sm-4">
					<div class="input-group">
					  <span class="input-group-addon"> <span
								class="glyphicon glyphicon-map-marker"></span>
					  </span>
						<sf:input path="country" class="form-control" id="inputEmail3" placeholder="Country"/>

					</div>

					<div class="text-center">
						<sf:errors path="country" cssClass="error"
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
								class="glyphicon glyphicon-map-marker"></span>
					  </span>
						<sf:input path="state" class="form-control" id="inputEmail3" placeholder="State"/>

					</div>

					<div class="text-center">
						<sf:errors path="state" cssClass="error"
							class="control-label text-danger" for="inputError1" />
					</div>
				</div>

				<div class="col-sm-4">
					<div class="input-group">
					  <span class="input-group-addon"> <span
								class="glyphicon glyphicon-map-marker"></span>
					  </span>
						<sf:input path="city" class="form-control" id="inputEmail3" placeholder="City"/>

					</div>

					<div class="text-center">
						<sf:errors path="city" cssClass="error"
							class="control-label text-danger" for="inputError1" />
					</div>
				</div>

				<div class="col-sm-4">
					<div class="input-group">
					   <span class="input-group-addon"> <span
								class="glyphicon glyphicon-user"></span>
					   </span>
						<sf:select class="form-control" STYLE="width: 193px" size="0"
							path="gender">
							<sf:option value="" label="Select" />
							<sf:option value="Male" label="Male" />
							<sf:option value="Female" label="Female" />
						</sf:select>
					</div>

					<div class="text-center">
						<sf:errors path="gender" cssClass="error"
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
								class="glyphicon glyphicon-calendar"></span>
					  </span>
						<sf:input path="year" class="form-control" id="inputEmail3" placeholder="Year"/>
					</div>

					<div class="text-center">
						<sf:errors path="year" cssClass="error"
							class="control-label text-danger" for="inputError1" />
					</div>
				</div>

				<div class="col-sm-4">
					<div class="input-group">
					   <span class="input-group-addon"> <span
								class="glyphicon glyphicon-education"></span>
						</span>
						<sf:select class="form-control" STYLE="width: 190px" size="0"
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
					<div class="text-center">
						<sf:errors path="semester" cssClass="error"
							class="control-label text-danger" for="inputError1" />
					</div>
				</div>

				<div class="col-sm-4">
					<div class="input-group">
					   <span class="input-group-addon"> <span
								class="glyphicon glyphicon-education"></span>
						</span>
						<sf:select class="form-control" STYLE="width: 190px" size="0"
							path="branchName">

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
					<div class="text-center">
						<sf:errors path="branchName" cssClass="error"
							class="control-label text-danger" for="inputError1" />
					</div>
				</div>
			</div>
			<br>
			<br>

			<div class="text-center">
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
				</div>
			

	</sf:form>

<script type="text/javascript">
	$('#sandbox-container .input-group.date').datepicker({
		orientation : "bottom auto",
		autoclose : true,
		todayHighlight : true

	});
</script>
