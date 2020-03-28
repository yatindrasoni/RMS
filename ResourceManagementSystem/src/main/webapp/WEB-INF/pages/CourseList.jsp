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
	style="margin-top: -4; margin-left: -100;">
	<b><span class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
			code="label.listProgram"></s:message></b>
</h2>
<br>
<div class="container  text-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>



<c:url var="editUrl" value="/ctl/Course?id=" />

<sf:form class="form-inline container  text-center" action="search"
	commandName="form" method="post">

	<sf:hidden path="pageNo" />
	<sf:hidden path="pageSize" />

	<div class="form-group" style="margin-left: -140;">


		<sf:label path="courseName" for="inputPassword3">
			<s:message code="label.programName"></s:message>
		</sf:label>
		&emsp;
		<sf:input path="courseName" class="form-control" id="inputEmail3" />
		&emsp;
	</div>

	<div class="form-group">


		<sf:label path="duration" for="inputPassword3">
			<s:message code="label.duration"></s:message>
		</sf:label>
		&emsp;
		<sf:input path="duration" class="form-control" id="inputEmail3" />
		&emsp;
	</div>



	<button type="submit" class="btn btn-primary" name="operation"
		value="Search">
		<span class="glyphicon glyphicon-search"></span>
		<s:message code="label.search"></s:message>
	</button>
	<br>
	<br>


	<table class="table table-inverse table-striped">

		<c:if test="${!empty list}">
			<tr>
				<c:if test="${sessionScope.user.roleId == 1}">
					<th><input type="checkbox" onclick="checkAll(this)" />&emsp;<span
						class="glyphicon glyphicon-check"></span></th>
				</c:if>
				<th><span class="glyphicon glyphicon-list-alt"></span> <s:message
						code="label.sno" /></th>
				<th><span class="glyphicon glyphicon-education"></span> <s:message
						code="label.programName" /></th>
				<th><span class="glyphicon glyphicon-book"></span> <s:message
						code="label.description" /></th>
				<th><span class="glyphicon glyphicon-align-center"></span> <s:message
						code="label.duration" /></th>
				<c:if test="${sessionScope.user.roleId == 1}">
					<th><span class="glyphicon glyphicon-edit"></span> <s:message
							code="label.edit" /></th>
				</c:if>
			</tr>

			<c:forEach items="${list}" var="course" varStatus="ct">
				<tr>
					<c:if test="${sessionScope.user.roleId == 1}">
						<td><input type="checkbox" name="ids" value="${course.id}"></td>
					</c:if>
					<td><c:out
							value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
					<td><c:out value="${course.name}" /></td>
					<td><c:out value="${course.description}" /></td>
					<td><c:out value="${course.duration}" /></td>
					<c:if test="${sessionScope.user.roleId == 1}">
						<td><a href="${editUrl}${course.id}"><span
								class="glyphicon glyphicon-pencil"></span></a></td>
					</c:if>
				</tr>
			</c:forEach>

		</c:if>

	</table>
	<c:if test="${!empty list}">

		<c:if test="${sessionScope.user.roleId == 1}">
			<button type="submit" class="btn btn-primary text-center "
				name="operation" value="New">
				<span class="glyphicon glyphicon-plus"></span>
				<s:message code="label.new"></s:message>
			</button>
		</c:if>	
&nbsp;&nbsp;

<c:if test="${sessionScope.user.roleId == 1}">
			<button type="submit" class="btn btn-primary text-center"
				name="operation" value="Delete">
				<span class="glyphicon glyphicon-trash"></span>
				<s:message code="label.delete"></s:message>
			</button>
		</c:if>
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
