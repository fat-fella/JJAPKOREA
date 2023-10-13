<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 관리</title>
<!-- swiper css -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<!-- 부트스트랩 css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/favicon.ico">
<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%-- <jsp:include page="../member/header.jsp"></jsp:include> --%>

<style>
#resumeMgrSide {
	position: absolute;
	top: 50px;
	left: 210px;
}
header {
    background-color: #007bff;
    color: white;
    padding: 10px 0;
    margin: 0 auto;
}
.logoimg{
	height: 48px;
	width: 90px;
}
</style>

</head>
<body>
	<header>
		<div class="container">
			<a href="<%=request.getContextPath()%>/index" class="logo linkLogo">
				<img src="<%=request.getContextPath()%>/resources/images/짭코리아.png"
					alt="JJAPKOREA" class="logoimg">
			</a>
			<div class="links">
				<a href="<%=request.getContextPath()%>/person/myPage" class="link linkHome">마이페이지</a>
			</div>
		</div>
	</header>

	<div id="resumeMgrSide">
		<!-- resumeMgr 안쪽 페이지 -->
		<jsp:include page="resumeMgrSide.jsp"></jsp:include>
		<jsp:include page="resumeWrite.jsp"></jsp:include>


	</div>

</body>
</html>