<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ page isELIgnored="false"%>

<div style="margin-right: 100;">
	<a style="margin-left: 1%" target="_blank"
		href="http://localhost:8080/ResourceManagementSystem/ctl/Marksheet/reports"><span
		class="glyphicon glyphicon-print"></span> <font color="#2980b9"><b><s:message
					code="label.printmeritlist" /></b></font></a>

</div>

<h2 class="container  text-center text-primary"
	style="margin-top: -5; margin-left: -80;">
	<b><span class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
			code="label.getMeritList"></s:message></b>
</h2>

<br>

<sf:form class="form-inline container  text-center" action="search"
	commandName="form" method="post">

	<sf:hidden path="pageNo" />
	<sf:hidden path="pageSize" />


	<table class="table table-inverse table-striped">
		<c:if test="${!empty list}">
			<tr>
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
				<th><span class="glyphicon glyphicon-align-center"></span> <s:message
						code="label.total" /></th>
			</tr>

			<c:forEach items="${list}" var="marksheet" varStatus="ct">
				<tr>
					<td><c:out value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" /></td>
					<td><c:out value="${marksheet.rollNo}" /></td>
					<td><c:out value="${marksheet.CandidateName}" /></td>
					<td><c:out value="${marksheet.chemistry}"></c:out></td>
					<td><c:out value="${marksheet.physics}" /></td>
					<td><c:out value="${marksheet.maths}" /></td>
					<td><c:out value="${marksheet.maths  +marksheet.physics + marksheet.chemistry}" />
					</td>
				</tr>
			</c:forEach>


		</c:if>

	</table>
	<button type="submit" class="btn btn-primary text-center "
		name="operation" value="Back" style="margin-left: -80;">
		<span class="glyphicon glyphicon-back"></span>
		<s:message code="label.back"></s:message>
	</button>

</sf:form>
