<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>
<script type="text/javascript">
	function checkAll(master) {
		var checked = master.checked;
		var col = document.getElementsByTagName("INPUT");
		for (var i = 0; i < col.length; i++) {
			col[i].checked = checked;
		}
	}
</script>
<h2 class="container  text-center text-primary"
	style="margin-top: -4; margin-left: -60;">
	<b><span class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
			code="label.listTimeTable"></s:message></b>
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



<c:url var="editUrl" value="/ctl/TimeTable?id=" />

<sf:form class="form-inline container  text-center" action="search"
	commandName="form" method="post">

	<sf:hidden path="pageNo" />
	<sf:hidden path="pageSize" />

	<div class="form-group">

		<sf:label path="programId" for="inputPassword3">
			<s:message code="label.programName" />
		</sf:label>
		&emsp;
		<sf:select class="form-control" STYLE="width: 195px" size="0"
			path="programId">
			<sf:option value="" label="Select" />
			<sf:options items="${programList}" itemValue="id" itemLabel="name" />
		</sf:select>

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
				<th><span class="glyphicon glyphicon-education"></span> <s:message
						code="label.trainerName" /></th>		
				
				<%-- <th><span class="glyphicon glyphicon-calendar"></span> <s:message
						code="label.examDate" /></th> --%>
				
				<th><span class="glyphicon glyphicon-time"></span> <s:message
						code="label.time" /></th>
						
				<%-- <th><span class="glyphicon glyphicon-calendar"></span> <s:message
						code="label.day" /></th> --%>
						
				<c:if test="${sessionScope.user.roleId == 1}">
					<th><span class="glyphicon glyphicon-edit"></span> <s:message
							code="label.edit" /></th>
				</c:if>
			</tr>

			<c:forEach items="${list}" var="timetable" varStatus="ct">
				<tr>
					<c:if test="${sessionScope.user.roleId == 1}">
						<td><input type="checkbox" name="ids" value="${timetable.id}"></td>
					</c:if>
					<td><c:out
							value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
							
					<td><c:out value="${timetable.programName}" /></td>
					<td><c:out value="${timetable.trainerName}" /></td>
					
					<%-- <td><c:out value="${timetable.trainerName}" /></td> --%>
					
					<%-- <td><fmt:formatDate pattern="dd-MM-yyy" type="date" value="${timetable.examinationDate}" /></td> --%>
							
					<%-- <td><c:out value="${timetable.examinationDate}" /></td> --%>
					<td><c:out value="${timetable.time}" /></td>
					
					<%-- <td><c:out value="${timetable.day}" /></td> --%>
					
					<c:if test="${sessionScope.user.roleId == 1}">
						<td><a href="${editUrl}${timetable.id}"><span
								class="glyphicon glyphicon-pencil"></span></a></td>
					</c:if>
				</tr>
			</c:forEach>

		</c:if>

	</table>

	<%-- <button type="submit" class="btn btn-primary text-center"
		name="operation" value="Next">
		<span class="glyphicon glyphicon-plus"></span> Next
	</button> --%>
	<c:if test="${!empty list}">
		<c:if test="${sessionScope.user.roleId == 1}">
			<button type="submit" class="btn btn-primary text-center"
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
	<%-- <button type="submit" class="btn btn-primary text-center"
		name="operation" value="Previous">
		<span class="glyphicon glyphicon-plus"></span> Previous
	</button> --%>


	<div class="container" style="margin-top: 10; margin-left: -15;">
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
