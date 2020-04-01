<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	style="margin-top: -4; margin-left: -30;">
	<b><span class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
			code="label.listAssignPrograms"></s:message></b>
</h2>
<div class="container  text-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>
<c:url var="editUrl" value="/ctl/AssignPrograms?id=" />
<sf:form class="form-inline container  text-center" action="search"
	commandName="form" method="post">

	<sf:hidden path="pageNo" />
	<sf:hidden path="pageSize" />

<div class="table-responsive">
	<table class="table table-striped table-bordered">
		<c:if test="${!empty list}">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)" />&emsp;<span
					class="glyphicon glyphicon-check"></span></th>

				<th><s:message code="label.sno" /></th>

				<th><s:message code="label.Action" />
					<div style="margin-left: 2">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#demo,#demo1">
							<span class="glyphicon glyphicon-filter"></span>
						</button>
					</div>
					<div id="demo" class="collapse"
						style="margin-left: 50; margin-top: -27">
						<button type="submit" class="btn btn-primary" name="operation"
							value="Search">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div></th>

				<th><s:message code="label.firstName2" />
					<div id="demo" class="collapse">
						<sf:input path="firstName" class="form-control" id="inputEmail3" placeholder="First Name" />
					</div></th>

				<th><s:message code="label.lastName2" />
					<div id="demo" class="collapse">
						<sf:input path="lastName" class="form-control" id="inputEmail3"
							placeholder="Last Name" />
					</div></th>

				<th><s:message code="label.programName" />
					<div id="demo" class="collapse">
						<sf:select class="form-control" STYLE="width: 195px" size="0"
							path="programId">
							<sf:option value="" label="Select" />
							<sf:options items="${programList}" itemValue="id"
								itemLabel="name" />
						</sf:select>
					</div></th>

				<th><s:message code="label.fee" />
				   <div id="demo" class="collapse">
					  <sf:input path="fee" class="form-control" id="inputEmail3" placeholder="Fee" />
				   </div>
				</th>

				<th><s:message code="label.paid" />
				   <div id="demo" class="collapse">
					  <sf:input path="paid" class="form-control" id="inputEmail3" placeholder="Paid" />
				   </div>
				</th>

				<th><s:message code="label.due" />
				   <div id="demo" class="collapse">
					  <sf:input path="due" class="form-control" id="inputEmail3" placeholder="Due" />
				   </div>
				</th>

				<th><s:message code="label.discount" />
				   <div id="demo" class="collapse">
					  <sf:input path="discount" class="form-control" id="inputEmail3" placeholder="Discount" />
				   </div>
				</th>

			</tr>

			<c:forEach items="${list}" var="assignPrograms" varStatus="ct">
				<tr>

					<td><input type="checkbox" name="ids"
						value="${assignPrograms.id}"></td>
					<td><c:out
							value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>

					<td class="dropdown"><a class="btn btn-default actionButton"
						data-toggle="dropdown"> Action </a>
						<ul class="dropdown-menu" role="menu" id="contextMenu">

							<li><a tabindex="-1" href="${editUrl}${assignPrograms.id}">
									<s:message code="label.edit" />
							</a></li>

						</ul></td>


					<td><c:out value="${assignPrograms.firstName}" /></td>
					<td><c:out value="${assignPrograms.lastName}" /></td>
					<td><c:out value="${assignPrograms.programName}" /></td>
					<td><c:out value="${assignPrograms.fee}" /></td>
					<td><c:out value="${assignPrograms.paid}" /></td>
					<td><c:out value="${assignPrograms.due}" /></td>
					<td><c:out value="${assignPrograms.discount}" /></td>

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

	<input type=button
		onClick="parent.location='http://localhost:8080/ResourceManagementSystem/ctl/AssignPrograms/search'"
		value='Back' class="btn btn-primary">


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


