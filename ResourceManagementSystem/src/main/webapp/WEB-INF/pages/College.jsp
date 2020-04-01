<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>

<div class="text-center " style="margin-right: -150;">
	<h1 class="text-primary">

		<c:choose>
			<c:when test="${form.id > 0}">
				<b style="margin-left: -50"><s:message code="label.editCollege"></s:message></b>
			</c:when>
			<c:otherwise>
				<b style="margin-left: -50"><s:message code="label.addCollege"></s:message></b>
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
	<sf:form method="POST" class="form-inline" commandName="form">

		<sf:hidden path="id" />
		<sf:hidden path="createdBy" />
		<sf:hidden path="modifiedBy" />
		<sf:hidden path="createdDatetime" />
		<sf:hidden path="modifiedDatetime" />

<div class="row" style="margin-top: 10">

     <div class="row" style="margin-bottom: -50">
     
		<div class="col-sm-4">
			<div class="input-group" style="margin-right: -20;">
			   <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-education"></span>
			   </span>
				<sf:input path="name" class="form-control" id="inputEmail3" placeholder="College Name"/>
			</div>
			
			<div class="text-right" style="margin-top: 1; margin-right: 18">
			  <sf:errors path="name" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="col-sm-4">
			<div class="input-group" style="margin-right: 23;">
			  <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-envelope"></span>
			   </span>
				<sf:input path="address" class="form-control" id="inputEmail3" placeholder="Address"/>
			</div>
			
			<div class="text-right" style="margin-top: 1; margin-right: 103">  
			  <sf:errors path="address" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="col-sm-4">
			<div class="input-group" style="margin-right: 65;">
			  <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-map-marker"></span>
			   </span>
				<sf:input path="state" class="form-control" id="inputEmail3" placeholder="State"/>

			</div>
			
			<div class="text-right" style="margin-top: 1; margin-right: 124">
			  <sf:errors path="state" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>
		
	</div>	

    <div class="row" style="margin: 80;">
    
		<div class="col-sm-4">
			<div class="input-group" style="margin-right: 11;">
			   <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-map-marker"></span>
			   </span>
				<sf:input path="city" class="form-control" id="inputEmail3" placeholder="City"/>

			</div>
			
			<div class="text-right" style="margin-top: 1; margin-right: 77">
			   <sf:errors path="city" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>


		<div class="col-sm-4">
			<div class="input-group" style="margin-right: -8;">
			  <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-phone"></span>
			   </span>
				<sf:input path="mobileNo" maxlength="10" class="form-control" id="inputEmail3" placeholder="Mobile No."/>
			</div>
			
			<div class="text-right" style="margin-top: 1; margin-right: 61">
			  <sf:errors path="mobileNo" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

      </div>
    
		<div class="col-sm-offset-2 col-sm-10" style="margin-left: -240; margin-top: -40;">
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
		</div>
	  </div>	
	</sf:form>
</div>
</div>