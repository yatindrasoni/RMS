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
	style="margin-top: -4; margin-left: -90;">
	<b><span class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
			code="label.listStudent"></s:message></b>
</h2>
<div class="container  text-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>
<c:url var="editUrl" value="/ctl/Student?id=" />
<sf:form class="form-inline container  text-center" action="search"
	commandName="form" method="post">

	<sf:hidden path="pageNo" />
	<sf:hidden path="pageSize" />

	<div class="form-group ">
		<sf:label path="firstName" for="inputPassword3">
			<s:message code="label.firstName"></s:message>
		</sf:label>
		&emsp;
		<sf:input path="firstName" class="form-control" id="inputEmail3" />
		&emsp;
	</div>
	<div class="form-group ">
		<sf:label path="lastName" for="inputPassword3">
			<s:message code="label.lastName"></s:message>
		</sf:label>
		&emsp;
		<sf:input path="lastName" class="form-control" id="inputEmail3" />
		&emsp;
	</div>
	
	<div class="form-group ">
		<sf:label path="branch" for="inputPassword3">
			<s:message code="label.branch"></s:message>
		</sf:label>
		&emsp;
		<sf:input path="branch" class="form-control" id="inputEmail3" />
		&emsp;
	</div> 
	
	<button type="submit" class="btn btn-primary" name="operation"
		value="Search">
		<span class="glyphicon glyphicon-search"></span>
		<s:message code="label.search"></s:message>
	</button>
	<br>
	<br>

	<table class="table table-inverse table-stri ped" style="">
		<c:if test="${!empty list}">
		 <col width="130">
         <col width="80">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)" />&emsp;<span
					class="glyphicon glyphicon-check"></span></th>
				<th><span class="glyphicon glyphicon-list-alt"></span> <s:message
						code="label.sno" /></th>
				<th><span class="glyphicon glyphicon-education"></span> <s:message
						code="label.collegeName" /></th>
				<th><span class="glyphicon glyphicon-education"></span> <s:message
						code="label.branch" /></th>		
				<th><span class="glyphicon glyphicon-user"></span> <s:message
						code="label.firstName" /></th>
				<th><span class="glyphicon glyphicon-user"></span> <s:message
						code="label.lastName" /></th>
				<th><span class="glyphicon glyphicon-envelope"></span> <s:message
						code="label.email" /></th>
				<th><span class="glyphicon glyphicon-phone"></span> <s:message
						code="label.mobileNo" /></th>

				<th><span class="glyphicon glyphicon-edit"></span> <s:message
						code="label.edit" /></th>
			</tr>

			<c:forEach items="${list}" var="student" varStatus="ct">
				<tr>

					<td><input type="checkbox" name="ids" value="${student.id}"></td>
					<td><c:out
							value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
					<td><c:out value="${student.collegeName}" /></td>
					<td><c:out value="${student.branchName}" /></td>
					<td><c:out value="${student.firstName}" /></td>
					<td><c:out value="${student.lastName}" /></td>
					<td><c:out value="${student.email}" /></td>
					<td><c:out value="${student.mobileNo}" /></td>

					<%--  <td><c:out value="${student.dob}" /></td> --%>
					<td><a href="${editUrl}${student.id}"><span
							class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>



			<!-- 			<tr>
				<td align="left">
					<button type="submit" class="btn btn-primary pull-left"
						name="operation" value="Previous">Previous</button>
				</td>


				<td align="center" colspan="3">
					<button type="submit" class="btn btn-primary text-center "
						name="operation" value="/ctl/Role">New</button>



					<button type="submit" class="btn btn-primary text-center "
						name="operation" value="Delete">Delete</button>
				</td>



				<td align="right">
					<button type="submit" class="btn btn-primary pull-right"
						name="operation" value="Next">Next</button>
				</td>
			</tr> -->
		</c:if>
	</table>
	<c:if test="${!empty list}">
		<button type="submit" class="btn btn-primary text-center "
			name="operation" value="New">
			<span class="glyphicon glyphicon-plus"></span>
			<s:message code="label.new"></s:message>
		</button>
&nbsp;&nbsp;
	<button type="submit" class="btn btn-primary text-center "
			name="operation" value="Delete">
			<span class="glyphicon glyphicon-trash"></span>
			<s:message code="label.delete"></s:message>
		</button>
	</c:if>
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