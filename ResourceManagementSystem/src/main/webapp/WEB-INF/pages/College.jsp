<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>

<div class="text-center " style="margin-right: -150;">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b><s:message code="label.editCollege"></s:message></b>
			</c:when>
			<c:otherwise>
				<b><s:message code="label.addCollege"></s:message></b>
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
	<sf:form method="POST" class="form-horizontal" commandName="form">

		<sf:hidden path="id" />
		<sf:hidden path="createdBy" />
		<sf:hidden path="modifiedBy" />
		<sf:hidden path="createdDatetime" />
		<sf:hidden path="modifiedDatetime" />

		<div class="form-group">
			<sf:label path="name" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.collegeName1"></s:message>
				</div>
			</sf:label>

			<div class="col-sm-4" style="margin-left: -30;">
				<sf:input path="name" class="form-control" id="inputEmail3" />
			</div>
			
			<div class="text-right">
			  <sf:errors path="name" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="form-group">
			<sf:label path="address" class="col-sm-3 ">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.address"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:input path="address" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right">  
			  <sf:errors path="address" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group">
			<sf:label path="state" class="col-sm-3 ">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.state"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:input path="state" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right">
			  <sf:errors path="state" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group">
			<sf:label path="city" class="col-sm-3 ">
				<div class="text-left" style="margin-left: 10;">
					<s:message code="label.city"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -30;">
				<sf:input path="city" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right">
			   <sf:errors path="city" cssClass="error"
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

		<div class="col-sm-offset-2 col-sm-10" style="margin-left: -190; margin-top: 30;">
			<button type="submit" style="margin-left: 20;"
				class="btn btn-primary" name="operation" value="Save">
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





	</sf:form>
</div>