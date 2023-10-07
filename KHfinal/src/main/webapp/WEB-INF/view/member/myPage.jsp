<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/msg/message.jsp"></jsp:include>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" href="resources/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_jpostupload.css">
</head>
<body>
	<header>
		<div class="container">
			<a href="../index" class="logo linkLogo">
				<img src="<%=request.getContextPath()%>/resources/images/짭코리아.png"
					alt="JJAPKOREA" class="logoimg">
			</a>
			<div class="links">
				<a href="infoModifyPerson" class="link linkHome">회원 정보 수정</a>
				<a href="scrap" class="link linkManage">스크랩</a>
			</div>
		</div>
	</header>
	<div class="jposthead">
		<h2>마이페이지</h2>
	</div>
	<button onclick="deleteAccount()">회원 탈퇴</button>
	<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
<script>
	function deleteAccount() {
	    var mid = "${mid}";
	    var csrfToken = $("meta[name='_csrf']").attr("content");
	
	    // 회원 탈퇴 처리 AJAX 요청
	    $.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/person/myPage",
	        data: { mid: mid },
	        success: function(response) {
	            if (response === "success") {
	                // 회원 탈퇴 성공 시, 로그아웃 요청 AJAX 요청
	                $.ajax({
	                    type: "POST",
	                    url: "${pageContext.request.contextPath}/logout",
	                    beforeSend: function(xhr) {
	                        xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
	                    },
	                    success: function() {
	                        alert("회원 탈퇴와 로그아웃이 완료되었습니다.");
	                        window.location.href = "${pageContext.request.contextPath}/index";
	                    },
	                    error: function(error) {
	                        console.error("로그아웃 요청 실패:", error);
	                    }
	                });
	            } else {
	                console.error("회원 탈퇴 요청 실패:", response);
	            }
	        },
	        error: function(error) {
	            console.error("회원 탈퇴 요청 실패:", error);
	        }
	    });
	}
</script>
</body>
</html>