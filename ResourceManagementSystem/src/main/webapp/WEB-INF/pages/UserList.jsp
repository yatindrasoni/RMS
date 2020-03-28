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

	<div class="form-group ">


		<sf:label path="firstName" for="inputPassword3">
			<s:message code="label.firstName" />
		</sf:label>

		<sf:input path="firstName" class="form-control" id="inputEmail3"
			placeholder="First Name" />
		&emsp;
		<sf:label path="lastName" for="inputPassword3">
			<s:message code="label.lastName" />
		</sf:label>

		<sf:input path="lastName" class="form-control" id="inputEmail3"
			placeholder="Last Name" />
		&emsp;
		<sf:label path="roleName" for="inputPassword3">
			<s:message code="label.role" />
		</sf:label>

		<sf:select class="form-control" STYLE="width: 195px" size="0"
			path="roleId">
			<sf:option value="" label="Select" />
			<sf:options items="${roleList}" itemValue="id" itemLabel="name" />
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
				<th><input type="checkbox" onclick="checkAll(this)" />&emsp;<span
					class="glyphicon glyphicon-check"></span></th>
				<th><span class="glyphicon glyphicon-list-alt"></span> <s:message
						code="label.sno" /></th>
				<th><span class="glyphicon glyphicon-user"></span> <s:message
						code="label.role" /></th>

				<th><span class="glyphicon glyphicon-user"></span> <s:message
						code="label.firstName" /></th>
				<th><span class="glyphicon glyphicon-user"></span> <s:message
						code="label.lastName" /></th>
				<th><span class="glyphicon glyphicon-envelope"></span> <s:message
						code="label.login" /></th>
				<th><span class="glyphicon glyphicon-phone"></span> <s:message
						code="label.mobileNo" /></th>
				<th><span class="glyphicon glyphicon-user"></span> <s:message
						code="label.gender" /></th>
				<th><span class="glyphicon glyphicon-edit"></span> <s:message
						code="label.edit" /></th>
			</tr>

			<c:forEach items="${list}" var="user" varStatus="ct">
				<tr>

					<td><input type="checkbox" name="ids" value="${user.id}"></td>
					<td><c:out
							value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
					<td><c:out value="${user.roleName}" /></td>
					<td><c:out value="${user.firstName}" /></td>
					<td><c:out value="${user.lastName}" /></td>
					<td><c:out value="${user.login}"></c:out></td>
					<%--  <td><c:out value="${user.dob}" /></td> --%>
					<td><c:out value="${user.mobileNo}" /></td>
					<%-- <td><c:out value="${user.role}" /></td> --%>
					<td><c:out value="${user.gender}"></c:out></td>
					<td><a href="${editUrl}${user.id}"><span
							class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>

			<!--              <tr>
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
                <button type="submit"class="btn btn-primary pull-right"name="operation" value="Next">Next</button>
                </td>
            </tr>
 -->
		</c:if>

	</table>


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