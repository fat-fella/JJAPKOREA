<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_jpostupload.css">
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/favicon.ico">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 관리 페이지</title>
<link rel="icon" href="resources/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header>
		<div class="container">
			<a href="<%=request.getContextPath()%>/index" class="logo linkLogo"> <img
				src="<%=request.getContextPath()%>/resources/images/짭코리아.png"
				alt="JJAPKOREA" class="logoimg"></a>
			<div class="links">
				<a href="<%=request.getContextPath()%>/index" class="link linkHome">기업회원 홈</a>
				<a href="#" class="link linkManage">채용공고 관리</a>
			</div>
		</div>
	</header>
	<div class="list">
		<div>
			<ul>
				<c:forEach var="jpostlist" items="${list}">
					<li><a
						href="<c:url value='/info'><c:param name='reTitle' value='${jpostlist.reTitle}'/></c:url>">${jpostlist.reTitle}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>