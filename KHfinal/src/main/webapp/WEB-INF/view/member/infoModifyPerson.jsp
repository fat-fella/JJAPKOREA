<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" href="resources/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_jpostupload.css">
</head>
<body>
	<header>
		<div class="container">
			<a href="index" class="logo linkLogo">
				<img src="<%=request.getContextPath()%>/resources/images/짭코리아.png"
					alt="JJAPKOREA" class="logoimg">
			</a>
			<div class="links">
				<a href="myPage" class="link linkHome">마이페이지</a>
				<a href="scrap" class="link linkManage">스크랩</a>
			</div>
		</div>
	</header>
	<form action="../jobpostingupload/register" method="POST"
		class="jpostform">
		<div class="jposthead">
			<h2>회원 정보 수정</h2>
		</div>
		<div class="jpostcontent">
			<fieldset class="jpostfieldset">
				<div class="mpwInputBox">
					<label for="mpw">비밀번호</label>
					<input type="password" id="mpw" name="mpw" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!.]).{8,16}">
				</div>
				<div class="pnameInputBox">
					<label for="pname">이름</label>
					<input type="text" id="pname" name="pname">
				</div>
				<div class="pemailInputBox">
					<label for="pemail">이메일</label>
					<input type="email" id="pemail" name="pemail">
				</div>
				<div class="pphoneInputBox">
					<label for="pphone">휴대폰번호</label>
					<input type="text" id="pphone" name="pphone">
				</div>
			</fieldset>
			<div class="jpostsubmitbtn">
				<button type="submit">수정</button>
			</div>
		</div>
	</form>
</body>
</html>