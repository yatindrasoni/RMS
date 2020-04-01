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
	style="margin-top: -8; margin-left: -55;">
	<b><span class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
			code="label.listRole"></s:message></b>
</h2>

<div class="container  text-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>



<c:url var="editUrl" value="/ctl/Role?id=" />

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
							data-target="#demo,#demo0,#demo1">
							<span class="glyphicon glyphicon-filter"></span>
						</button>
					</div>
					<div id="demo"  class="collapse" style="margin-left: 50; margin-top: -27">
						  <button type="submit" class="btn btn-primary" name="operation" value="Search">
							<span class="glyphicon glyphicon-search"></span>
						  </button>
					</div>
				</th>
				<th><s:message code="label.rolename" />
				  <div id="demo0" class="collapse">
				    <sf:input path="roleName" class="form-control" id="inputEmail3" placeholder="Role Name" />
				  </div>  
				</th>
				
				<th><s:message code="label.description" /></th>
			</tr>

			<c:forEach items="${list}" var="role" varStatus="ct">
				<tr>

					<td><input type="checkbox" name="ids" value="${role.id}"></td>
					<td><c:out
							value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>

					<td class="dropdown"><a class="btn btn-default actionButton"
						data-toggle="dropdown"> Action </a>
						<ul class="dropdown-menu" role="menu" id="contextMenu">

							<li><a tabindex="-1" href="${editUrl}${role.id}"> <s:message
										code="label.edit" />
							</a></li>

						</ul>
					</td>
					<td><c:out value="${role.name}" /></td>
					<td><c:out value="${role.description}" /></td>
					
				</tr>
			</c:forEach>
		</c:if>

	</table>
</div>	
  <div style="margin-left: -80">
	<c:if test="${!empty list}">
		<button type="submit" class="btn btn-primary text-center"
			name="operation" value="New">
			<span class="glyphicon glyphicon-plus"></span>
			<s:message code="label.new"></s:message>
		</button>
&nbsp;&nbsp;
	<button type="submit" class="btn btn-primary text-center"
			name="operation" value="Delete">
			<span class="glyphicon glyphicon-trash"></span>
			<s:message code="label.delete"></s:message>
		</button>
	</c:if>
	&nbsp;
	 <input type=button
		onClick="parent.location='http://localhost:8080/ResourceManagementSystem/ctl/Role/search'"
		value='Back' class="btn btn-primary">
</div>

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
