<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이직은 원픽 | KH</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/onpick/css/onpick_layout.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/onpick/css/onpick_header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/onpick/css/onpick_nav.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/onpick/css/onpick_main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/onpick/css/onpick_footer.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="icon"
	href="<%=request.getContextPath() %>/resources/onpick/favicon.ico">
<script
	src="<%=request.getContextPath() %>/resources//onpick/js/onpick_main_scroll.js"></script>
<script
	src="<%=request.getContextPath() %>/resources//onpick/js/onpick_main.js"></script>
<script
	src="<%=request.getContextPath() %>/resources//onpick/js/onpick_nav.js"></script>
<script
	src="<%=request.getContextPath() %>/resources//onpick/js/onpick_nav2.js"></script>
</head>
<body>
	<div class="abc"></div>
	<div class="wrap header">
		<jsp:include page="onpick_header.jsp"></jsp:include>
		<!-- onpick_header.html 파일 불러오기 -->
	</div>
	<div class="wrap nav">
		<jsp:include page="onpick_nav.jsp"></jsp:include>
	</div>
	<div class="wrap content">
		<jsp:include page="onpick_main.jsp"></jsp:include>
	</div>
	<div class="wrap footer">
		<jsp:include page="onpick_footer.jsp"></jsp:include>
	</div>
</body>
</html>