<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>
<script type="text/javascript">
	function checkAll(master) {
		var checked = master.checked;
		var col = document.getElementsByTagName("INPUT");
		for ( var i = 0; i < col.length; i++) {
			col[i].checked = checked;
		}
	}
</script>


<h2 class="container  text-center text-primary"
	style="margin-top: -4; margin-left: -30;">
	<b><span class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
			code="label.listCandidate"></s:message></b>
</h2>
<div class="container  text-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>
<c:url var="editUrl" value="/ctl/Candidate?id=" />
<sf:form class="form-inline container  text-center" action="search"
	commandName="form" method="post">

	<sf:hidden path="pageNo" />
	<sf:hidden path="pageSize" />

	<div class="form-group" style="margin-top: 20">
		
		<sf:label path="firstName" for="inputPassword3">
			<s:message code="label.firstName"></s:message>
		</sf:label>
		&emsp;
		<sf:input path="firstName" class="form-control" id="inputEmail3" />
		&emsp;
	
		<sf:label path="lastName" for="inputPassword3">
			<s:message code="label.lastName"></s:message>
		</sf:label>
		&emsp;
		<sf:input path="lastName" class="form-control" id="inputEmail3" />
		&emsp;
		
	</div>

	<button type="submit" class="btn btn-primary" name="operation" value="Search" style="margin-top: 20">
		<span class="glyphicon glyphicon-search"></span> Search
	</button>
	<br>
	<br>

<div class="table-responsive">
	<table class="table table-striped table-bordered">
		<c:if test="${!empty list}">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)" />&emsp;
				  <div style="margin-left: 30; margin-top: -23" >
				    <span class="glyphicon glyphicon-check"></span>
				  </div>  
				</th>
				
				     <th><s:message code="label.sno" /></th>
				     <th><s:message code="label.Action" /></th>
				     <th><s:message code="label.firstName" /></th>
				     <th><s:message code="label.lastName" /></th>	
				     <th><s:message code="label.email" /></th>
					 <th><s:message code="label.gender" /></th>
					 <th><s:message code="label.contactNo" /></th>
				     <th><s:message code="label.aadharNo" /></th>
					 <th><s:message code="label.address" /></th>
				     <th><s:message code="label.country" /></th>
					 <th><s:message code="label.state" /></th>
					 <th><s:message code="label.city" /></th>
					 <th><s:message code="label.collegeName2" /></th>
					 <th><s:message code="label.branch" /></th>
					 <th><s:message code="label.semester" /></th>						
				
				<%-- <th><span class="glyphicon glyphicon-edit"></span> <s:message
						code="label.edit" /></th> --%>
			</tr>

			<c:forEach items="${list}" var="candidate" varStatus="ct">
				
				<c:url var="populate" value="/ctl/Candidate/fetch">
							<c:param name="candidatePopulate" value="${candidate.firstName}" />
							<c:param name="populate" value="${candidate.lastName}" />
							<c:param name="EmailPopulate" value="${candidate.email}" />
				</c:url>
				
				<tr>
					<td><input type="checkbox" name="ids" value="${candidate.id}"></td>
					
					<td><c:out value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
				                      
				               <td class="dropdown"><a class="btn btn-default actionButton"
								data-toggle="dropdown"> Action </a>
								<ul class="dropdown-menu" role="menu" id="contextMenu">

									<li><a tabindex="-1" href="${editUrl}${candidate.id}">
											<s:message code="label.edit" />
									</a></li>

									<li><a href="${populate}"> <s:message
												code="label.assignProgram" />
									</a></li>

									<li><a href="<c:url value="/ctl/AssignPrograms/search" />"><s:message
											code="label.listAssignPrograms" />
									</a></li>


								</ul></td> 
				                     
					
					        <td><c:out value="${candidate.firstName}" /></td>
							<td><c:out value="${candidate.lastName}" /></td>
							<td><c:out value="${candidate.email}" /></td>
							<%-- <td><c:out value="${candidate.dob}" /></td> --%>
							<td><c:out value="${candidate.gender}" /></td>
							<td><c:out value="${candidate.contactNo}" /></td>
							<td><c:out value="${candidate.aadharNo}" /></td>
							<td><c:out value="${candidate.address}" /></td>
							<td><c:out value="${candidate.country}" /></td>
							<td><c:out value="${candidate.state}" /></td>
							<td><c:out value="${candidate.city}" /></td>
							<td><c:out value="${candidate.collegeName}" /></td>
							<td><c:out value="${candidate.branchName}" /></td>
							<td><c:out value="${candidate.semester}" /></td>

				</tr>
			</c:forEach>


		</c:if>
	</table>
</div>	
   <c:if test="${!empty list}">
	<%--<button type="submit" class="btn btn-primary text-center "
		name="operation" value="New">
		<span class="glyphicon glyphicon-plus"></span>
		<s:message code="label.new"></s:message>
	</button> 
&nbsp;&nbsp;--%>
	
	<button type="submit" class="btn btn-primary text-center "
		name="operation" value="Delete">
		<span class="glyphicon glyphicon-trash"></span>
		<s:message code="label.delete"></s:message>
	</button>
	&nbsp;&nbsp;
	 </c:if> 
	
	<input type=button onClick="parent.location='http://localhost:8080/ResourceManagementSystem/ctl/Candidate/search'" value='Back'
				  class="btn btn-primary">


	<div class="container" style="margin-top: 10; margin-left: -20;">
		<ul class="pagination pagination-lg">
			<c:forEach var="i" begin="1" end="${size}">
				<button type="submit" color="blue" class="btn" name="pageNO"
					value="${i}">
					<span
						class="<c:out default="None" escapeXml="true" value="${form.pageNo==i?'text-danger':'text-primary'}"/>">${i}</span>
				</button>
			</c:forEach>
		</ul>
	</div>
</sf:form>


