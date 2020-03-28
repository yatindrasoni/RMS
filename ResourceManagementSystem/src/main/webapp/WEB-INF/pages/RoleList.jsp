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
	style="margin-top: -8; margin-left: -100;">
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

	<div class="form-group" style="margin-left: -140;">


		<sf:label path="roleName" for="inputPassword3">
			<s:message code="label.rolename"></s:message>
		</sf:label>
		<sf:input path="roleName" class="form-control" id="inputEmail3"
			placeholder="Name" />

	</div>


	<button type="submit" class="btn btn-primary" name="operation"
		value="Search">
		<span class="glyphicon glyphicon-search"></span>
		<s:message code="label.search"></s:message>
	</button>
	<br>
	<br>
	<%-- <s:message code="label.name" />
    <sf:input path="roleName" />

    <input type="submit" value="Search" name="operation"> --%>

	<table class="table table-inverse table-striped">

		<c:if test="${!empty list}">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)" />&emsp;<span
					class="glyphicon glyphicon-check"></span></th>
				<th><span class="glyphicon glyphicon-list-alt"></span> <s:message
						code="label.sno" /></th>
				<th><span class="glyphicon glyphicon-user"></span> <s:message
						code="label.rolename" /></th>
				<th><span class="glyphicon glyphicon-book"></span> <s:message
						code="label.description" /></th>
				<th><span class="glyphicon glyphicon-edit"></span> <s:message
						code="label.edit" /></th>
			</tr>

			<c:forEach items="${list}" var="role" varStatus="ct">
				<tr>

					<td><input type="checkbox" name="ids" value="${role.id}"></td>
					<td><c:out
							value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
					<td><c:out value="${role.name}" /></td>
					<td><c:out value="${role.description}" /></td>
					<td><a href="${editUrl}${role.id}"><span
							class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>

			<!--             <tr>
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
