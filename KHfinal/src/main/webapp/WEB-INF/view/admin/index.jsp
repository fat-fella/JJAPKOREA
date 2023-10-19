<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>JJapKorea | ADMIN 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<!-- 템플릿의 기본 css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/styles.css">
<!-- 템플릿의 상세내용의 css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/scss.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mypage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/adminTable.css">
<script	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="./frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="./frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="Menu_container">
						<ul class="Menu_list">
							<li style="font-weight: bold;"><a>Admin 페이지</a></li>
						</ul>
					</div>
					<jsp:include page="./frame/adminmenu.jsp"></jsp:include>
				</div>
			</main>
			<jsp:include page="./frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>
