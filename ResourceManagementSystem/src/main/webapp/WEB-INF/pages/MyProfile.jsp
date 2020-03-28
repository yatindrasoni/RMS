<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>
<div class="text-center " style="margin-right: -150;">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b><s:message code="label.myProfile" /></b>

			</c:when>
			<c:otherwise>
                   Add User
                </c:otherwise>
		</c:choose>

	</h1>
</div>
<br>
<div class="text-center pull-center" style="margin-left: 140">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>
<div class="col-sm-offset-4">
	<sf:form id="sandbox-container" method="POST" class="form-horizontal"
		commandName="form">

		<sf:hidden path="id" />
		<%--   <sf:hidden path="lastLogin"></sf:hidden>
        <sf:hidden path="registeredIP"></sf:hidden>
        <sf:hidden path="createdBy"></sf:hidden>
        <sf:hidden path="modifiedBy"></sf:hidden>
        <sf:hidden path="createdDatetime"></sf:hidden>
        <sf:hidden path="modifiedDatetime"></sf:hidden> --%>


		<div class="form-group">
			<sf:label path="login" class="col-sm-3 ">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.login"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:input path="login" class="form-control" id="inputEmail3"
					readonly="true" />

			</div>
			<div class="text-right">
			  <sf:errors path="login" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group">
			<sf:label path="firstName" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.firstName1"></s:message>
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

		<div class="form-group">
			<sf:label path="lastName" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.lastName1"></s:message>
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

		<%-- <div class="form-group">
            <sf:label path="dob" class="col-sm-2 ">
                    <s:message code="label.dob"></s:message>
                </sf:label>
                <div class="col-sm-5">
            <sf:input  path="dob" class="form-control" id="dob" />
           
        </div>
         <sf:errors path="dob"  cssClass="error" class="control-label text-danger" for="inputError1"  />
        </div> --%>

		<div class="form-group">
			<label class="col-sm-3 ">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.dob" />
				</div>
			</label>
			<div class="col-sm-4" style="margin-left: -30;">
				<div class="input-group date">
					<sf:input class="form-control" path="dob" id="dob" readonly="true" />
					<span class="input-group-addon"><span
						class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
				</div>
			</div>
			
			<div class="text-right">
			   <sf:errors path="dob" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group">
			<sf:label path="mobileNo" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 10;">
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
		<div class="form-group">
			<sf:label path="gender" class="col-sm-3 ">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.gender"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:radiobutton path="gender" value="Male" />
				<s:message code="label.male"></s:message>
				<sf:radiobutton path="gender" value="Female" />
				<s:message code="label.female"></s:message>
			</div>
			
			<div class="text-right">
			  <sf:errors path="gender" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-offset-2 col-sm-10" style="margin-left: -160; margin-top: 30;">
			<button type="submit" class="btn btn-primary" name="operation"
				value="Save">
				<span class="glyphicon glyphicon-floppy-save"></span>
				<s:message code="label.save" />
			</button>


		</div>


	</sf:form>
</div>
<%-- <script>
	$(function() {
		$("#dob").datepicker();
	});
</script>
 --%>
