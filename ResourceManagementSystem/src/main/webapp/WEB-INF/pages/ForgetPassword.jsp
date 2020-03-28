<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>


<div class="container text-center">

	<h1 class="text-primary" >
	 <div class="text-right" style="margin-right: 390;">
		<b><s:message code="label.forgetPassword" /></b>
	</div>	
	</h1>

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

		<div class="form-group" >
			<sf:label path="login" class="col-sm-3 control-label">
				<div class="text-left" style="margin-left: -50;">
					<s:message code="label.login"></s:message>
				</div>
			</sf:label>
			<div class="col-sm-4" style="margin-left: -170;">
				<sf:input path="login" class="form-control"
					placeholder="Enter ID Here" id="inputEmail3" />

			</div>

			<div>
				<button type="submit" class="btn btn-primary" name="operation"
					value="Go">
					<s:message code="label.go"></s:message>
				</button>
			</div>
			
			<div class="text-right" style="margin-top: -25; margin-right: 280;">
			   <sf:errors path="login" cssClass="error"
				class="control-label text-danger" for="inputError1" />
			</div>	

		</div>



		<%-- <table>
        <tr>
            <td><sf:label path="login">
                    <s:message code="label.login" />
                </sf:label> <sf:input path="login" /> <input type="submit" value="Go"
                name="operation"> <sf:errors path="login" cssClass="error" /></td>
        </tr>
    </table>
 --%>
	</sf:form>
</div>