<%@page import="com.dhavisoft.rms.dto.RoleDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@page import="com.dhavisoft.rms.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script src="../js/bootstrap-datepicker.min.js"></script>

<nav class="navbar navbar-default navbar-fixed-top c">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="/bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style="margin-top: -10;"> <img alt="RMS"
				src="http://localhost:8080/ResourceManagementSystem/resource/images/welcomelogo.png"
				width="46"></a>
		</div>


		<!-- Collect the nav links, forms, and other content for toggling -->


		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<c:url value="/Welcome" />"> <span
						class="glyphicon glyphicon-home"></span> &nbsp; <s:message
							code="label.Home" />
				</a></li>

				<c:if test="${not empty sessionScope.user}">

					<c:if test="${sessionScope.user.roleId == 1}">

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> <s:message code="label.User" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/User" />"> <span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addUser" />
								</a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/User/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listUser" /></a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.Role" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/Role" />"><span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addRole" /></a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Role/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listRole" /> </a></li>
								<%-- 	<li><a href="<c:url value="/roles/1/5" />"> Role List
										Rest</a></li> --%>
							</ul></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.College" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/College" />"><span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addCollege" /> </a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/College/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listCollege" /></a></li>
							</ul></li>


						<%-- <li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.Student" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/Student" />"><span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addStudent" /></a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Student/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listStudent" /></a></li>
							</ul></li> --%>


						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.Candidate" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/Candidate" />"><span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addCandidate" /></a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Candidate/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listCandidate" /></a></li>
							</ul></li>

						<%-- <li><a href="<c:url value="/ctl/AssignPrograms/search" />"><s:message
											code="label.listAssignPrograms" /></a></li>--%>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.Marksheet" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/Marksheet" />"><span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addMarksheet" /> </a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Marksheet/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listMarksheet" /></a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Marksheet/meritlist" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.getMeritList" /></a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Marksheet/get" />"><span
										class="glyphicon glyphicon-search"></span>&emsp;<s:message
											code="label.getMarksheet" /></a></li>
							</ul></li>

						<%-- <li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.Program" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/Course" />"><span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addProgram" /> </a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Course/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listProgram" /></a></li>
							</ul></li> --%>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.Program" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/Program" />"><span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addProgram" /> </a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Program/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listProgram" /></a></li>
							</ul></li>



						<%-- <li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.Faculty" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/Faculty" />"><span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addFaculty" /></a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Faculty/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp; <s:message
											code="label.listFaculty" /></a></li>
							</ul></li> --%>


						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.Trainer" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/Trainer" />"><span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addTrainer" /></a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Trainer/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp; <s:message
											code="label.listTrainer" /></a></li>
							</ul></li>




						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.TimeTable" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/TimeTable" />"><span
										class="glyphicon glyphicon-plus"></span>&emsp;<s:message
											code="label.addTimeTable" /> </a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/TimeTable/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listTimeTable" /></a></li>
							</ul></li>



					</c:if>
			</ul>
			</li>
			</ul>
			</c:if>

			<%-- <li class="active <%=!userLoggedIn ? "hidden" : " "%>"><a href="<%=ORSView.JAVA_DOC_VIEW%>"> JavaDoc
					</a></li> --%>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="/" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><span class="glyphicon glyphicon-user"></span>&nbsp;

						<s:message code="label.Welcome" /> <c:out
							value="${sessionScope.user.firstName}" /> <%-- <c:out
							value="${sessionScope.user.lastName}" /> --%> ( <c:choose>
							<c:when test="${!empty sessionScope.role}">
								<c:out value="${sessionScope.role}" />
							</c:when>
							<c:otherwise>Guest</c:otherwise>
						</c:choose> ) <span class="glyphicon glyphicon-th-large"></span></a>

					<ul class="dropdown-menu">
						<c:if test="${not empty sessionScope.user}">
							<li><a href="<c:url value="/ctl/User/profile" />"><span
									class="glyphicon glyphicon-user"></span> &nbsp;<s:message
										code="label.myProfile" /> </a></li>
							<c:if test="${sessionScope.user.roleId == 1}">
								<li class=""><a target="blank"
									href="<c:url value="http://localhost:8080/ResourceManagementSystem/resource/doc/index.html"  />"><span
										class="glyphicon glyphicon-book"></span> &nbsp;<s:message
											code="label.JavaDocs" /> </a></li>
							</c:if>
							<li><a href="<c:url value="/ctl/User/changepassword" />"><span
									class="glyphicon glyphicon-cog"></span> &nbsp;<s:message
										code="label.changePassword" /></a></li>
							<!-- <li class=""><a
									href="#"><span
										class="glyphicon glyphicon-send"></span> &nbsp;Forget Password</a> -->
							<li class="divider" style="background-color: Grey;"></li>
							<li><a href="<c:url value="/Logout" />"><span
									class="glyphicon glyphicon-log-out"></span> &nbsp;<b><s:message
											code="label.Logout" /></b></a></li>
						</c:if>

						<c:if test="${empty sessionScope.user}">
							<li class=""><a href="<c:url value="/SignUp/" />"><span
									class="glyphicon glyphicon-user"></span> &nbsp;<s:message
										code="label.UserRegister" /></a></li>
							<li class="divider" style="background-color: Grey;"></li>
							<li class=""><a href="<c:url value="/Login" />"><span
									class="glyphicon glyphicon-user"></span> &nbsp;<s:message
										code="label.FrontLogin" /></a></li>
						</c:if>

					</ul>
			</ul>

			<!--FOR STUDENTS  -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">



					<c:if test="${sessionScope.user.roleId == 2}">

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.College" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">

								<li><a href="<c:url value="/ctl/College/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listCollege" /></a></li>
							</ul></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.Marksheet" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/Marksheet/meritlist" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.getMeritList" /></a></li>
								<li class="divider" style="background-color: Grey;"></li>
								<li><a href="<c:url value="/ctl/Marksheet/get" />"><span
										class="glyphicon glyphicon-search"></span>&emsp;<s:message
											code="label.getMarksheet" /></a></li>
							</ul></li>
							 

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:message code="label.TimeTable" /> <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/ctl/TimeTable/search" />"><span
										class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
											code="label.listTimeTable" /></a></li>
							</ul></li>



					</c:if>
				</ul>

				<!--FOR FACULTY  -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">



						<c:if test="${sessionScope.user.roleId == 5}">

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><s:message code="label.College" /> <span
									class="glyphicon glyphicon-menu-down"></span></a>
								<ul class="dropdown-menu">

									<li><a href="<c:url value="/ctl/College/search" />"><span
											class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
												code="label.listCollege" /></a></li>
								</ul></li>

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><s:message code="label.Marksheet" />
									<span class="glyphicon glyphicon-menu-down"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/ctl/Marksheet/meritlist" />"><span
											class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
												code="label.getMeritList" /></a></li>
									<li class="divider" style="background-color: Grey;"></li>
									<li><a href="<c:url value="/ctl/Marksheet/get" />"><span
											class="glyphicon glyphicon-search"></span>&emsp;<s:message
												code="label.getMarksheet" /></a></li>
								</ul></li>

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><s:message code="label.Course" /> <span
									class="glyphicon glyphicon-menu-down"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/ctl/Course/search" />"><span
											class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
												code="label.listCourse" /></a></li>
								</ul></li>


							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><s:message code="label.TimeTable" />
									<span class="glyphicon glyphicon-menu-down"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/ctl/TimeTable/search" />"><span
											class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
												code="label.listTimeTable" /></a></li>
								</ul></li>



						</c:if>
					</ul>

					<!--FOR KIOSK  -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">



							<c:if test="${sessionScope.user.roleId == 4}">

								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"><s:message code="label.College" /> <span
										class="glyphicon glyphicon-menu-down"></span></a>
									<ul class="dropdown-menu">

										<li><a href="<c:url value="/ctl/College/search" />"><span
												class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
													code="label.listCollege" /></a></li>
									</ul></li>

								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"><s:message code="label.Marksheet" />
										<span class="glyphicon glyphicon-menu-down"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<c:url value="/ctl/Marksheet/meritlist" />"><span
												class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
													code="label.getMeritList" /></a></li>
										<li class="divider" style="background-color: Grey;"></li>
										<li><a href="<c:url value="/ctl/Marksheet/get" />"><span
												class="glyphicon glyphicon-search"></span>&emsp;<s:message
													code="label.getMarksheet" /></a></li>
									</ul></li>

								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"><s:message code="label.Course" /> <span
										class="glyphicon glyphicon-menu-down"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<c:url value="/ctl/Course/search" />"><span
												class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
													code="label.listCourse" /></a></li>
									</ul></li>


								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"><s:message code="label.TimeTable" />
										<span class="glyphicon glyphicon-menu-down"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<c:url value="/ctl/TimeTable/search" />"><span
												class="glyphicon glyphicon-th-list"></span>&emsp;<s:message
													code="label.listTimeTable" /></a></li>
									</ul></li>



							</c:if>
						</ul>






					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</div>
		</div>
	</div>

</nav>

