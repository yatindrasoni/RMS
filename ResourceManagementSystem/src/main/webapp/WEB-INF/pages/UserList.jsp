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

<h2 class="container  text-center text-primary" style="margin-top: -4;">
	<b><span class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
			code="label.listUser"></s:message></b>
</h2>


<div class="container  text-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>



<c:url var="editUrl" value="/ctl/User?id=" />

<sf:form class="form-inline container  text-center" action="search"
	commandName="form" method="post">

	<sf:hidden path="pageNo" />
	<sf:hidden path="pageSize" />

	<div class="table-responsive">
		<table class="table table-striped table-bordered">
			<c:if test="${!empty list}">
				<tr>
					<th><input type="checkbox" onclick="checkAll(this)" />&emsp;
					    <span class="glyphicon glyphicon-check"></span>
					</th>

					<th><s:message code="label.sno" /></th>
					<th><s:message code="label.Action" />
					 <div style="margin-left: 1">
						 <button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#demo,#demo0,#demo1,#demo2,#demo3,#demo4,#demo5">
							<span class="glyphicon glyphicon-filter"></span>
						 </button>
					 </div>
					<div id="demo"  class="collapse" style="margin-left: 50; margin-top: -27">
						  <button type="submit" class="btn btn-primary" name="operation" value="Search">
							<span class="glyphicon glyphicon-search"></span>
						  </button>
					</div>
					
					</th>

					<th><s:message code="label.role" /> 
					 <div id="demo0" class="collapse">
					    <sf:select class="form-control" STYLE="width: 195px" size="0" path="roleId">
							<sf:option value="" label="Select" />
							<sf:options items="${roleList}" itemValue="id" itemLabel="name" />
						</sf:select>
					 </div>	
					</th>

					<th><s:message code="label.firstName" />
					 <div id="demo1" class="collapse"> 
					   <sf:input path="firstName" class="form-control" id="inputEmail3" placeholder="First Name"/>
					 </div>  
					</th>
							
					<th><s:message code="label.lastName" />
					 <div id="demo2" class="collapse">
					    <sf:input path="lastName" class="form-control" id="inputEmail3" placeholder="Last Name"/>
					 </div>   
					</th>
					
					<th><s:message code="label.login" />
					 <div id="demo3" class="collapse">
					    <sf:input path="login" class="form-control" id="inputEmail3" placeholder="LoginId"/>
					 </div>
					</th>
					
					<th><s:message code="label.password" /></th>
					
					<th><s:message code="label.mobileNo" />
					 <div id="demo4" class="collapse">
					   <sf:input path="mobileNo" class="form-control" id="inputEmail3" placeholder="Mobile No."/>
					 </div>  
					</th>
					
					<th><s:message code="label.gender"/>
					 <div id="demo5" class="collapse">
					    <sf:input path="gender" class="form-control" id="inputEmail3" placeholder="Gender"/>
					 </div>   
					</th>
				</tr>

				<c:forEach items="${list}" var="user" varStatus="ct">
					<tr>

						<td><input type="checkbox" name="ids" value="${user.id}"></td>
						<td><c:out
								value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>

						<td class="dropdown"><a class="btn btn-default actionButton"
							data-toggle="dropdown"> Action </a>
							<ul class="dropdown-menu" role="menu" id="contextMenu">

								<li><a tabindex="-1" href="${editUrl}${user.id}"> <s:message
											code="label.edit" />
								</a></li>

								<td><c:out value="${user.roleName}" /></td>
								<td><c:out value="${user.firstName}" /></td>
								<td><c:out value="${user.lastName}" /></td>
								<td><c:out value="${user.login}"></c:out></td>
								<td><c:out value="${user.password}"></c:out></td>
								<%--  <td><c:out value="${user.dob}" /></td> --%>
								<td><c:out value="${user.mobileNo}" /></td>
								<%-- <td><c:out value="${user.role}" /></td> --%>
								<td><c:out value="${user.gender}"></c:out></td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
	</div>

	<%-- <c:if test="${form.pageNo==1}">
		<button type="submit" class="btn btn-primary text-center"
			name="operation" value="Previous">
			<span class="glyphicon glyphicon-plus"></span> Previous
		</button>
	</c:if> --%>
	<c:if test="${!empty list}">
		<button type="submit" class="btn btn-primary text-center"
			name="operation" value="New">
			<span class="glyphicon glyphicon-plus"></span>
			<s:message code="label.new"></s:message>
		</button>
	&nbsp;&nbsp;&nbsp;&nbsp;

	<button type="submit" style="margin-left: -20;"
			class="btn btn-primary text-center " name="operation" value="Delete">
			<span class="glyphicon glyphicon-trash"></span>
			<s:message code="label.delete"></s:message>
		</button>
	</c:if>
	&nbsp;
	 <input type=button
		onClick="parent.location='http://localhost:8080/ResourceManagementSystem/ctl/User/search'"
		value='Back' class="btn btn-primary">

	<%-- <button type="submit" class="btn btn-primary text-center"
		name="operation" value="Next">
		<span class="glyphicon glyphicon-plus"></span> Next
	</button>
 --%>
	<div class="container" style="margin-top: 10; margin-left: -20;">
		<ul class="pagination pagination-lg">
			<c:forEach var="i" begin="1" end="${size}">
				<button type="submit" class="btn" name="pageNO" value="${i}">
					<span
						class="<c:out default="None" escapeXml="true" value="${form.pageNo==i?'text-danger':'text-primary'}"/>">${i}</span>
				</button>
			</c:forEach>
		</ul>
	</div>


</sf:form>