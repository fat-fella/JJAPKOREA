<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입사지원 현황</title>
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/favicon.ico">
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', Arial, sans-serif;
	background-color: #f5f5f5;
	margin-top: 145px;
	padding: 0;
}

.jjapkorea-header {
	background-color: #007bff;
	color: #fff;
	padding: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 50%;
	margin: 0 auto;
}

.jjapkorea-logo a {
	color: #fff;
	font-weight: bold;
	text-decoration: none;
	font-size: 24px;
}

.logoimg {
	height: 40px;
	width: 140px;
}

.readSumWrap {
	position: relative;
	width: 50%;
	height: 464px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

ul.apply-list {
	padding: 0;
	list-style-type: none;
}

ul.apply-list li {
	margin-bottom: 20px;
}

.apply-box {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid #ADADAD;
	padding-bottom: 20px;
}

.title {
	text-decoration: none;
	color: #000;
}

.pagination {
	position: absolute;
	bottom: 30px;
	left: 0;
	right: 0;
	text-align: center;
}

.pagination a {
	text-decoration: none;
	color: #000;
	margin: 0 10px;
}

.pagination span {
	margin: 0 10px;
}
</style>
</head>
<body>
	<header class="jjapkorea-header">
		<div class="jjapkorea-logo">
			<a href="<%=request.getContextPath()%>/index">
				<img src="<%=request.getContextPath()%>/resources/images/짭코리아3.png"
					alt="JJAPKOREA" class="logoimg">
			</a>
		</div>
	</header>
	<section>
		<div class="readSumWrap clear">
			<div>
				<ul class="apply-list">
					<c:set var="startIndex"
						value="${(pagination.currentPage - 1) * pagination.itemsPerPage}" />
					<c:set var="endIndex"
						value="${startIndex + pagination.itemsPerPage}" />
					<c:forEach var="item" items="${applyListAll}" varStatus="loop">
						<c:if test="${loop.index >= startIndex && loop.index < endIndex}">
							<li>
								<div class="apply-box">
									<a
										href="<c:url value='/jobpostinginfo'><c:param name='jid' value='${item.JID}'/>${item.TITLE}</c:url>"
										class="title">${item.TITLE}</a>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="pagination">
				<c:if test="${pagination.totalPages > 0}">
					<c:if test="${pagination.currentPage > 1}">
						<c:if test="${pagination.currentPage > 2}">
							<a href="?page=1&itemsPerPage=${pagination.itemsPerPage}">처음</a>
						</c:if>
						<a
							href="?page=${pagination.currentPage - 1}&itemsPerPage=${pagination.itemsPerPage}">이전</a>
					</c:if>

					<c:choose>
						<c:when test="${pagination.totalPages < 6}">
							<c:forEach var="i" begin="1" end="${pagination.totalPages}">
								<c:choose>
									<c:when test="${i eq pagination.currentPage}">
										<span class="current-page">${i}</span>
									</c:when>
									<c:otherwise>
										<a href="?page=${i}&itemsPerPage=${pagination.itemsPerPage}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${pagination.currentPage < 3}">
									<c:forEach var="i" begin="1" end="5">
										<c:choose>
											<c:when test="${i eq pagination.currentPage}">
												<span class="current-page">${i}</span>
											</c:when>
											<c:otherwise>
												<a href="?page=${i}&itemsPerPage=${pagination.itemsPerPage}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:when
									test="${pagination.currentPage > pagination.totalPages - 3}">
									<c:forEach var="i" begin="${pagination.totalPages - 4}"
										end="${pagination.totalPages}">
										<c:choose>
											<c:when test="${i eq pagination.currentPage}">
												<span class="current-page">${i}</span>
											</c:when>
											<c:otherwise>
												<a href="?page=${i}&itemsPerPage=${pagination.itemsPerPage}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="${pagination.currentPage - 2}"
										end="${pagination.currentPage + 2}">
										<c:choose>
											<c:when test="${i eq pagination.currentPage}">
												<span class="current-page">${i}</span>
											</c:when>
											<c:otherwise>
												<a href="?page=${i}&itemsPerPage=${pagination.itemsPerPage}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>

					<c:if test="${pagination.currentPage < pagination.totalPages}">
						<a
							href="?page=${pagination.currentPage + 1}&itemsPerPage=${pagination.itemsPerPage}">다음</a>
						<c:if test="${pagination.currentPage < pagination.totalPages - 1}">
							<a
								href="?page=${pagination.totalPages}&itemsPerPage=${pagination.itemsPerPage}">마지막</a>
						</c:if>
					</c:if>
				</c:if>
			</div>
		</div>
	</section>
	<script>
	</script>
</html>