<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page isELIgnored="false"%>

<div class="text-center" style="margin-right: -230;">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b style="margin-left: -120"><s:message code="label.editProgram"></s:message></b>

			</c:when>
			<c:otherwise>
				<b style="margin-left: -120"><s:message code="label.addProgram"></s:message></b>
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
	<sf:form action="Program" method="post" class="form-inline"
		commandName="form">


		<sf:hidden path="id" />
		<sf:hidden path="createdBy"></sf:hidden>
		<sf:hidden path="modifiedBy"></sf:hidden>
		<sf:hidden path="createdDatetime"></sf:hidden>
		<sf:hidden path="modifiedDatetime"></sf:hidden>


<div class="row" style="margin-top: 10">

	<div class="row" style="margin-bottom: -50">
	
		<div class="col-sm-4">
			<sf:label path="programName" class="col-sm-3 control-label">
				<div class="text-left" style="margin-right: -60;">
					<s:message code="label.programName"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: 50;">
				<sf:input path="programName" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right" style="margin-top: 35; margin-right: 12">
			  <sf:errors path="programName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="col-sm-4">
			<sf:label path="description" for="inputPassword3"
				class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 15;">
					<s:message code="label.description"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: 40;">
				<sf:input path="description" class="form-control" id="inputEmail3" />

			</div>
			  
			 <div class="text-right" style="margin-top: 35; margin-right: 48"> 
			   <sf:errors path="description" cssClass="error"
				class="control-label text-danger" for="inputError1" />
		    </div>
		</div>


		<div class="col-sm-4">
			<sf:label path="duration" for="inputPassword3"
				class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: 5;">
					<s:message code="label.duration"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: 5;">
				<sf:input path="duration" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right" style="margin-top: 35; margin-right: 105">
			   <sf:errors path="duration" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

      </div>

		<div class="col-sm-offset-2 col-sm-10" style="margin-left: -220; margin-top: 30;">
			<button type="submit" style="margin-left: 10;"
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
		</div>
      </div>
	</sf:form>
</div>
</div>
