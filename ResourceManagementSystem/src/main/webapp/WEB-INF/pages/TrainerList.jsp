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
			code="label.listTrainer"></s:message></b>
</h2>
<div class="container  text-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>
<c:url var="editUrl" value="/ctl/Trainer?id=" />
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
		<sf:label path="programId" for="inputPassword3">
			<s:message code="label.programName1" />
		</sf:label>


		<sf:select class="form-control" STYLE="width: 195px" size="0"
			path="programId">
			<sf:option value="" label="Select" />
			<sf:options items="${programList}" itemValue="id" itemLabel="name" />
		</sf:select>
		&emsp;
	</div>

	<button type="submit" class="btn btn-primary" name="operation" value="Search" style="margin-top: 20">
		<span class="glyphicon glyphicon-search"></span> Search
	</button>
	<br>
	<br>

	<table class="table table-inverse table-striped">
		<c:if test="${!empty list}">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)" />&emsp;<span
					class="glyphicon glyphicon-check"></span></th>
				
				<th><span class="glyphicon glyphicon-list-alt"></span> <s:message
						code="label.sno" /></th>
				
				<th><span class="glyphicon glyphicon-book"></span> <s:message
						code="label.programName1" /></th>
				
				<th><span class="glyphicon glyphicon-user"></span> <s:message
						code="label.firstName" /></th>
				
				<th><span class="glyphicon glyphicon-user"></span> <s:message
						code="label.lastName" /></th>
				
				<th><span class="glyphicon glyphicon-envelope"></span> <s:message
						code="label.email" /></th>
				
				<th><span class="glyphicon glyphicon-envelope"></span> <s:message
						code="label.address" /></th>		
				
				<th><span class="glyphicon glyphicon-edit"></span> <s:message
						code="label.edit" /></th>
			</tr>

			<c:forEach items="${list}" var="trainer" varStatus="ct">
				<tr>

					<td><input type="checkbox" name="ids" value="${trainer.id}"></td>
					<td><c:out
							value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
				
					<td><c:out value="${trainer.programName}" /></td>
					<td><c:out value="${trainer.firstName}" /></td>
					<td><c:out value="${trainer.lastName}" /></td>
					<td><c:out value="${trainer.email}" /></td>
					<td><c:out value="${trainer.address}" /></td>


					<%--  <td><c:out value="${student.dob}" /></td> --%>
					<td><a href="${editUrl}${trainer.id}"><span
							class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>


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


