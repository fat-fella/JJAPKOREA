<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="${pageContext.request.contextPath }/admin/index">
			<img src="${pageContext.request.contextPath }/resources/images/JJAPkorea_logo(투명).png" style="width:120px; height:50px;"> Admin
		</a>

		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<%-- 사용자가 로그인되어 있지 않은 경우 --%>
					<sec:authorize access="isAnonymous()">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/login">로그인</a></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/signup/person">회원가입</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/admin/mypage">마이페이지</a></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
					</sec:authorize>
				</ul></li>
		</ul>
	</nav>