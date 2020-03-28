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
	style="margin-top: -4; margin-left: -40;">
	<b><span class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
			code="label.listMarksheet"></s:message></b>
</h2>
<div class="container  text-center">
	<c:if test="${success!= null }">
		<div class="alert alert-success" role="alert">${success}</div>
	</c:if>
	<c:if test="${error!= null }">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
</div>





<sf:form class="form-inline container  text-center" action="search"
	commandName="form" method="post">

	<sf:hidden path="pageNo" />
	<sf:hidden path="pageSize" />

	<div class="form-group" style="margin-left: -20;">


		<sf:label path="rollNo" for="inputPassword3">
			<s:message code="label.rollNo" />
		</sf:label>
		&emsp;
		<sf:input path="rollNo" class="form-control" id="inputEmail3" />
		&emsp;
	</div>

	<%-- 	<div class="form-group">


		<sf:label path="name" for="inputPassword3">
			<s:message code="label.name" />
		</sf:label>
		<sf:input path="name" class="form-control" id="inputEmail3" />

	</div>
 --%>


	<button type="submit" class="btn btn-primary" name="operation"
		value="Search">
		<span class="glyphicon glyphicon-search"></span>
		<s:message code="label.search"></s:message>
	</button>
	<br>
	<br>

	<table class="table  table-inverse table-striped">
		<c:if test="${!empty list}">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)" />&emsp;<span
					class="glyphicon glyphicon-check"></span></th>
				<th><span class="glyphicon glyphicon-list-alt"></span> <s:message
						code="label.sno" /></th>

				<th><span class="glyphicon glyphicon-tasks"></span> <s:message
						code="label.rollNo" /></th>

				<th><span class="glyphicon glyphicon-user"></span> <s:message
						code="label.candidate1" /></th>

				<th><span class="glyphicon glyphicon-align-center"></span> <s:message
						code="label.chemistry" /></th>
				<th><span class="glyphicon glyphicon-align-center"></span> <s:message
						code="label.physics" /></th>
				<th><span class="glyphicon glyphicon-align-center"></span> <s:message
						code="label.maths" /></th>
				<th><span class="glyphicon glyphicon-education"></span> <s:message
						code="label.collegeName" /></th>		
				<th><span class="glyphicon glyphicon-edit"></span> <s:message
						code="label.edit" /></th>
			</tr>

			<c:url var="editUrl" value="/ctl/Marksheet?id=" />
			
			<c:forEach items="${list}" var="marksheet" varStatus="ct">
				<tr>

					<td><input type="checkbox" name="ids" value="${marksheet.id}"></td>
					
					<td><c:out value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
					<td><c:out value="${marksheet.rollNo}" /></td>
					<td><c:out value="${marksheet.candidateName}" /></td>
					<td><c:out value="${marksheet.chemistry}"></c:out></td>
					<td><c:out value="${marksheet.physics}" /></td>
					<td><c:out value="${marksheet.maths}" /></td>
					<td><c:out value="${marksheet.collegeName}" /></td>
					
					<td><a href="${editUrl}${marksheet.id}"><span
							class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>

			<!-- 			             <tr>
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
	<button type="submit" class="btn btn-primary text-center"
			name="operation" value="Delete">
			<span class="glyphicon glyphicon-trash"></span>
			<s:message code="label.delete"></s:message>
		</button>
	</c:if>
	<div class="container" style="margin-top: 10; margin-left: -40;">
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
