<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>


<div class="text-center " style="margin-top: -30; margin-right: -150;">
	<h1 class="text-primary">
		<b><s:message code="label.UserRegister"></s:message></b>
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

	<sf:form class="form-horizontal" method="POST" commandName="form" id="sandbox-container">

		<sf:hidden path="id" />

		<div class="form-group">

			<sf:label path="firstName" class="col-sm-3 control-label"
				for="inputPassword3">
				<div class="text-right" style="margin-left: 10;">
					<s:message code="label.firstName"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -10;">
				<sf:input path="firstName" class="form-control" id="inputEmail3" />

			</div>
			<div class="text-right">
			  <sf:errors path="firstName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group">
			<sf:label path="lastName" class="col-sm-3 control-label">
				<div class="text-right" style="margin-left: 10;">
					<s:message code="label.lastName"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -10;">
				<sf:input path="lastName" class="form-control" id="inputEmail3" />

			</div>
			<div class="text-right">
			  <sf:errors path="lastName" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group">
			<sf:label path="login" class="col-sm-3 control-label">
				<div class="text-right" style="margin-left: 10;">
					<s:message code="label.login"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -10;">
				<sf:input path="login" class="form-control" id="inputEmail3" />

			</div>
			<div class="text-right">
			  <sf:errors path="login" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>

		<div class="form-group">
			<label for="text" class="col-sm-3">
			<div class="text-right" style="margin-left: 10;">
				<sf:label path="password">
				  
					<s:message code="label.password"></s:message>
		    </div>	
				</sf:label>
			</label>
			<div class="col-sm-4" style="margin-left: -10;">
			  
			 
				<sf:password class="form-control" id="inputPassword3"
					path="password" />
			  </div>	
			
			<div class="text-right">
			<label class="control-label text-danger" for="inputError1"> <sf:errors
					path="password" cssClass="error" />
			</label>
</div>
		</div>

		<div class="form-group">
			<div class="text-right" >
				<label class="col-sm-3"> <s:message code="label.dob"></s:message>

				</label>
			</div>
			<div class="col-sm-4" style="margin-left: -10;">
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
				<div class="text-right" style="margin-left: 10;">
					<s:message code="label.mobileNo"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -10;">
				<sf:input path="mobileNo" class="form-control" id="inputEmail3" />

			</div>
			
			<div class="text-right">
			  <sf:errors path="mobileNo" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	
		</div>



		<div class="form-group">
			<sf:label path="gender" class="col-sm-3 control-label">
				<div class="text-right" style="margin-left: 10;">
					<s:message code="label.gender" />
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -10; margin-top: 6;">
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
      
      <div class="text-left" style="margin-right: -400;">
		<div class="col-sm-offset-2 col-sm-10" >
			<button type="submit" class="btn btn-primary" style="margin-left: -40;" name="operation" value="SignUp">
				<span class="glyphicon glyphicon-check"></span>
				
				  <s:message code="label.SignUp"></s:message>
	
			</button>
			&emsp;
		
			 <a class="btn btn-primary labelMargin"
				href="<c:url value="http://localhost:8080/ResourceManagementSystem/SignUp" />"><span
				class="glyphicon glyphicon-remove"></span> 
				
				  <s:message code="label.cancel" /> </a>
	
		 </div>
		
		</div> 

		</div>


		<%-- <div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary"
				style="margin-left: -35;" name="operation" value="SignUp">
				<span class="glyphicon glyphicon-check"><b>SignUp</b></span>
			</button>
			&emsp;&emsp;

			<button type="submit" class="btn btn-primary" name="operation"
				value="Cancel">
				<span class="glyphicon glyphicon-remove">Cancel</span>
			</button>
		</div> --%>
	</sf:form>
</div>

