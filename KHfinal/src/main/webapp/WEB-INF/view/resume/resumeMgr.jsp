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
<!-- [1] 해상도 - 최적해상도 1260 결정 -->
<!-- [2] content 영역 1260px -->
<!-- [3] reset.css 폴더경로 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!-- [4] project명 또는 core.css 폴더경로 - bootstrap 등으로 대체 -->
<!-- [4] 기본색상 10~15개 정도 class 미리 만들어두기 -->
<!-- [4] 폰트크기 3~7개 정도 class 미리 만들어두기 -->
<!-- [4] button 3개 class 미리 만들어두기 -->
<!-- [4] a 모양 미리 만들어두기 -->
<!-- [5] layout 영역 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_layout.css">
<!-- [6] header 영역 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_header.css">
<!-- [7] nav 영역 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_nav.css">
<!-- [8] main 영역 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_main.css">
<!-- [9] footer 영역 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_footer.css">
<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../member/header.jsp"></jsp:include>
<jsp:include page="resumeMgrSide.jsp"></jsp:include>
<style>
#resumeMgrSide {
	position: absolute;
	top: 210px;
	left: 210px;
}
</style>
</head>
<body>
	<div id="resumeMgrSide">
		<jsp:include page="resumeWrite.jsp"></jsp:include>
	</div>

</body>
</html>