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
	style="margin-top: -4; margin-left: -50;">
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

<div class="table-responsive">	
	<table class="table table-striped table-bordered">

		<c:if test="${!empty list}">
			<tr>
				<c:if test="${sessionScope.user.roleId == 1}">
					<th><input type="checkbox" onclick="checkAll(this)" />&emsp;<span
						class="glyphicon glyphicon-check"></span></th>
				</c:if>
				<th><s:message code="label.sno" /></th>
				<th><s:message code="label.Action" />
					<div style="margin-left: 2">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#demo,#demo1">
							<span class="glyphicon glyphicon-filter"></span>
						</button>
					</div>
					<div id="demo"  class="collapse" style="margin-left: 50; margin-top: -27">
						  <button type="submit" class="btn btn-primary" name="operation" value="Search">
							<span class="glyphicon glyphicon-search"></span>
						  </button>
					</div>
				</th>
				
				<th><s:message code="label.programName" />
				   <div id="demo"  class="collapse">
				      <sf:select class="form-control" STYLE="width: 195px" size="0" path="programId">
			             <sf:option value="" label="Select" />
			             <sf:options items="${programList}" itemValue="id" itemLabel="name" />
		              </sf:select>
				   </div>
				</th>
				<th><s:message code="label.trainerName" />
				  <div id="demo"  class="collapse">
				     <sf:select class="form-control" STYLE="width: 193px" size="0" path="trainerId">
					    <sf:option value="" label="Select" />
					    <sf:options items="${trainerList}" itemValue="id" itemLabel="value" />
				     </sf:select>
				  </div>
				</th>		
			
				<th><s:message code="label.time" />
				 <div id="demo"  class="collapse">
				   <sf:select class="form-control" STYLE="width: 195px" size="0" path="time">
					 <sf:option value="" label="Select" />
					 <sf:option value="10:00 AM - 1:00 AM" label="10:00 AM - 1:00 AM" />
					 <sf:option value="2:00 AM - 5:00 AM" label="2:00 AM - 5:00 AM" />
				   </sf:select>
				 </div>
				</th>
						
			</tr>

			<c:forEach items="${list}" var="timetable" varStatus="ct">
				<tr>
					<c:if test="${sessionScope.user.roleId == 1}">
						<td><input type="checkbox" name="ids" value="${timetable.id}"></td>
					</c:if>
					<td><c:out
							value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
					<td class="dropdown"><a class="btn btn-default actionButton"
						     data-toggle="dropdown"> Action </a>
						<ul class="dropdown-menu" role="menu" id="contextMenu">

							<li><a tabindex="-1" href="${editUrl}${timetable.id}"> <s:message
										code="label.edit" />
							</a></li>

					     </ul>
					 </td>
							
					<td><c:out value="${timetable.programName}" /></td>
					<td><c:out value="${timetable.trainerName}" /></td>
					<td><c:out value="${timetable.time}" /></td>
					
				</tr>
			</c:forEach>

		</c:if>

	</table>
</div>
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
	&nbsp;
	<input type=button
		onClick="parent.location='http://localhost:8080/ResourceManagementSystem/ctl/TimeTable/search'"
		value='Back' class="btn btn-primary">
		

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
