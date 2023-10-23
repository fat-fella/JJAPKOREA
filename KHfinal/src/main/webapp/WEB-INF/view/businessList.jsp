<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 정보</title>
<link rel="icon" href="resources/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jobkh_layout.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jobkh_header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jobkh_main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jobkh_footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', Arial, sans-serif;
}

#content {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 10px;
}

table tr {
	border: none;
}

table td {
	border: none;
	text-align: center;
}

table td:first-child {
	width: 100px;
}

table.outer-table {
	width: 100%;
	border: 1px solid #000;
	border-collapse: separate;
	background-color: rgba(33, 150, 243, 0);
	padding: 10px;
	cursor: pointer;
}

table.outer-table td {
	width: 40%;
	vertical-align: middle;
}

table.outer-table td:last-child {
	width: 60%;
}

table.outer-table td img {
	width: 112.19px;
    height: 72px;
	display: block;
	margin: 0 auto;
}

table.inner-table {
	width: 100%;
}

table.inner-table td {
	text-align: right;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 100px;
}

#loadMoreContainer {
	width: 1240px;
	margin: 5px auto;
}

#loadMoreButton {
	float: right;
}
</style>
</head>
<body>
	<div class="wrap">
		<header><jsp:include page="/WEB-INF/view/header.jsp"></jsp:include></header>
		<main>
			<div id="content">
				<c:forEach items="${getBusinessWithBusinessform}" var="item">
					<table class="outer-table" onclick="send('${item.MID}')">
						<tr>
							<td><img src="${item.LI}" onerror="this.src='${pageContext.request.contextPath}/resources/images/maru/180x72.png';" width="112.19px" height="72px"></td>
							<td>
								<table class="inner-table">
									<tr>
										<td>${item.BIZNAME}</td>
									</tr>
									<tr>
										<td>${item.BFORM_NAME}</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</c:forEach>
			</div>
			<div id="loadMoreContainer">
				<button id="loadMoreButton">더 보기 ∨</button>
			</div>
		</main>
		<footer><jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include></footer>
	</div>
	<script>
		function send(mid) {
			var url = '${pageContext.request.contextPath}/businessInfo';
			$.ajax({
			type : 'GET',
			url : url,
			data : {
				mid : mid
			},
			success : function(response) {
				window.location.href = url + "?mid=" + mid;
			},
			error : function(error) {
				console.log('Error:', error);
			}
			});
		}

		var visibleElements = 32; // 페이지 로드 시 처음에 보이는 요소 수
		var elementsPerLoad = 4; // "더 보기" 버튼을 누를 때 로드할 요소 수
		var totalElements = ${getBusinessWithBusinessform.size()}; // 전체 요소 수
		var loadedElements = visibleElements; // 초기로드한 요소 수

		// 초기로드에 보여줄 요소 설정
		showElements(visibleElements);

		// "더 보기" 버튼 클릭 시 호출되는 함수
		function loadMore() {
			loadedElements += elementsPerLoad;
			if (loadedElements >= totalElements) {
				// 모든 요소가 로드된 경우 "더 보기" 버튼을 숨김
				document.getElementById("loadMoreButton").style.display = "none";
			}
			// 다음 요소를 보여줌
			showElements(loadedElements);
		}

		// 지정된 수만큼 요소를 화면에 표시
		function showElements(count) {
			var elements = document.querySelectorAll(".outer-table");
			for (var i = 0; i < elements.length; i++) {
				if (i < count) {
					elements[i].style.display = "block";
				} else {
					elements[i].style.display = "none";
				}
			}
		}

		document.getElementById("loadMoreButton")
				.addEventListener("click", loadMore);
	</script>
</body>
<style>
#banner-area .bnr-marketing a img {
	width: 240px;
}
</style>
</html>
