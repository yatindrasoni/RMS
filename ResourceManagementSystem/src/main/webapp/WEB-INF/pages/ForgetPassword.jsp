<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>

	
 <div class="text-center">
	  <h1 class="text-primary">
		<b><s:message code="label.forgetPassword" /></b>
	  </h1>	
</div>	
	

	<br> <br>
</div>
<div class="text-center pull-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>
<div class="form-horizontal col-sm-offset-4">
	<sf:form method="POST" class="form-horizontal" commandName="form">

<div class="text-center">
		<div class="form-group">
			<div class="input-group">
			   <span class="input-group-addon"> 
			     <span class="glyphicon glyphicon-user"></span>
			   </span>
				<sf:input path="login" class="form-control"
					placeholder="Enter ID Here" id="inputEmail3" />
			</div>
			<div class="text-center" style="margin-right: 445">
			   <sf:errors path="login" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		
			<div style="margin-top: -50">
				<button type="submit" class="btn btn-primary" name="operation"
					value="Go">
					<s:message code="label.go"></s:message>
				</button>
			</div>
		</div>
</div>
		
	</sf:form>
</div>