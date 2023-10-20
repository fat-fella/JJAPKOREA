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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
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

.jjapkorea-menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.jjapkorea-menu li {
	display: inline;
	margin-right: 20px;
}

.jjapkorea-menu a {
	color: #fff;
	text-decoration: none;
	font-size: 16px;
}

.readSumWrap {
	width: 50%;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
	border-bottom: 1px solid #000;
	padding-bottom: 20px;
}

ul.apply-list {
	list-style-type: none;
	padding: 0;
}

ul.apply-list li {
	margin-bottom: 10px;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

.apply-box {
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 5px;
	display: flex;
	justify-content: space-between;
	text-align: center;
	margin: auto;
}

.btn_ud {
	background-color: rgba(245, 245, 245);
	border: 2px solid rgba(245, 245, 245);
	color: #212529;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 12px;
}

.btn_ud:hover {
	background-color: #212529;
	color: white;
}

.btn_ud:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
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
		<div class="jjapkorea-menu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/person/resume/write"
						class="link">이력서 관리</a></li>
				<li>|</li>
				<li><a href="<%=request.getContextPath()%>/person/myPage"
						class="link">스크랩</a></li>
				<li>|</li>
				<li><a
						href="<%=request.getContextPath()%>/person/infoModifyPerson"
						class="link">개인정보 수정</a></li>
			</ul>
		</div>
	</header>
	<section>
		<div class="readSumWrap clear">
			<h1 class="h1">${selectOnePerson.pname}님의 입사지원 현황입니다.</h1>
		</div>
		<div>
			<ul class="apply-list">
				<c:forEach var="item" items="">
					<li>
						<div class="apply-box">
							<a
								href="<c:url value='/jobpostinginfo'><c:param name='jid' value=''/></c:url>"
								class="title"></a>
							<div class="">
								<button type="button" class="btn_ud" onclick="remove('')">삭제</button>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>
</body>
</html>