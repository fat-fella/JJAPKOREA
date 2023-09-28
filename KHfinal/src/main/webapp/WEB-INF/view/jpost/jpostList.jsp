<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 관리 페이지</title>
<link rel="icon" href="resources/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header class="jobkorea-header">
		<div class="jobkorea-logo">
			<a href="#">JJAPKorea</a>
		</div>
		<div class="jobkorea-menu">
			<ul>
				<li><a href="#">홈</a></li>
				<li><a href="#">채용정보</a></li>
				<li><a href="#">기업정보</a></li>
				<li><a href="#">스카우트</a></li>
			</ul>
		</div>
	</header>
	<div class="container">
		<div>
			<ul>
				<c:forEach var="jpostlist" items="${list}">
					<li>
					<a href="<c:url value='/info'><c:param name='reTitle' value='${jpostlist.reTitle}'/></c:url>">${jpostlist.reTitle}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>