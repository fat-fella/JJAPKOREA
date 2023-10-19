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
<title>JJapKorea | 마이페이지</title>
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
					<div class="ant-drawer-body">
						<div class="Menu_container">
							<ul class="Menu_list">
								<li style="font-weight: bold;"><a>Admin 마이페이지</a></li>
							</ul>
							
						</div>
						<jsp:include page="./frame/adminmenu.jsp"></jsp:include>
						<div>
							<div>
								<div class="MyPage_basic_input_row">
									<div class="MyPage_basic_input_title">아이디</div>
									<div class="MyPage_basic_input_content">
										<input disabled=""
											class="MyPage_basic_input"
											type="text" id="mid" value="${adminMypage.mid }">
									</div>
									<div class="MyPage_basic_input_title">이름</div>
									<div class="MyPage_basic_input_content">
										<input class="MyPage_basic_input"
											type="text" id="pname" value="${adminMypage.pname }">
									</div>
								</div>
								<div class="MyPage_basic_input_row">
									<div class="MyPage_basic_input_title">이메일</div>
									<div class="MyPage_basic_input_content">
										<input class="MyPage_basic_input"
											type="text" id="pemail" value="${adminMypage.pemail }">
									</div>
									<div class="MyPage_basic_input_title">휴대폰</div>
									<div class="MyPage_basic_input_content">
										<input class="MyPage_basic_input"
											type="text" id="pphone" value="${adminMypage.pphone }">
									</div>
								</div>
								
								<button class="MyPage_basic_btn" onclick="sendData()">저장하기</button>

							</div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="./frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script>
		
		function sendData() {
	        var admin = {
	        		mid: $("#mid").val(),
	                pname: $("#pname").val(),
	                pemail: $("#pemail").val(),
	                pphone: $("#pphone").val()
	        };

	        $.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath}/admin/update",
	            contentType: "application/json",
	            data: JSON.stringify(admin),
	            success: function(response) {
	            	alert("수정이 완료되었습니다.");
	            	window.location.href = "${pageContext.request.contextPath}/admin/mypage";
	            }
	        });
	    }
	</script>
</body>
</html>
