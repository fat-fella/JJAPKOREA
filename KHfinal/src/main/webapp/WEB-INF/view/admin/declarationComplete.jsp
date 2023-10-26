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
<title>JJapKorea | 신고 처리 완료 페이지</title>
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
							<li style="font-weight: bold;"><a>신고 처리 완료 리스트</a></li>
						</ul>
					</div>
					<jsp:include page="./frame/adminmenu.jsp"></jsp:include>
					<table>
						<tr>
							<th class="bg-secondary">게시판 번호</th>
							<th class="bg-secondary">게시판 제목</th>
							<th class="bg-secondary">신고 카테고리</th>
							<th class="bg-secondary">신고 내용</th>
							<th class="bg-secondary">처리 유무</th>
							<th class="bg-secondary">신고자 아이디</th>
							<th class="bg-secondary">작성자 아이디</th>
						</tr>
						<c:forEach items="${declarationComplete }" var="report">
						<tr>
							<%-- <td class="bg-success"><c:out value="${report.rownum + ((pageMaker.cri.pageNum-1) * 10)}"/></td> --%>
							<td class="bg-success"><c:out value="${report.bno}"/></td>
							<td class="bg-success"><c:out value="${report.btitle}"/></td>
							<td class="bg-success"><c:out value="${report.rcat}"/></td>
							<td class="bg-success"><c:out value="${report.rcontent}"/></td>
							<td class="bg-success"><c:out value="${report.rcheck}"/></td>
							<td class="bg-success"><c:out value="${report.mid}"/></td>
							<td class="bg-success"><c:out value="${report.rid}"/></td>
							
						</tr>
						</c:forEach>
					</table>
					<div class="search_wrap">
						<div class="search_area">
							<select name="type">
								<option value="P"
									<c:out value="${pageMaker.cri.type eq 'P'?'selected':'' }"/>>신고자 아이디</option>
								<option value="L"
									<c:out value="${pageMaker.cri.type eq 'L'?'selected':'' }"/>>게시판 제목</option>
							</select> 
							<input type="text" name="keyword" class="searchInput" value="${pageMaker.cri.keyword }">
							<button class="btn btn-outline-primary">Search</button>
						</div>
					</div>
					<div class="pageInfo_wrap">
						<div class="pageInfo_area">
							<ul id="pageInfo" class="pageInfo">
								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li class="pageInfo_btn previous"><a
										href="${pageMaker.startPage-1}">Previous</a></li>
								</c:if>
								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
										href="${num}">${num}</a></li>
								</c:forEach>
								<!-- 다음페이지 버튼 -->
								<c:if test="${pageMaker.next}">
									<li class="pageInfo_btn next"><a
										href="${pageMaker.endPage + 1 }">Next</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<form id="moveForm" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
						<input type="hidden" name="type" value="${pageMaker.cri.type }">
				    </form>
				</div>
			</main>
			<jsp:include page="./frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script>
	
		let moveForm = $("#moveForm");

		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "${pageContext.request.contextPath}/admin/declarationComplete");
			moveForm.submit();
		});
		
		$(".search_area button").on("click", function(e) {
			e.preventDefault();
		    doSearch();
		});
		
		$(".searchInput").on("keypress", function(e) {
			if (e.which === 13) {
		        e.preventDefault();
		        doSearch();
		    }
		});
		
		function doSearch() {
			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();
			
			if(!keyword){
				alert("키워드를 입력하세요.");
				return false;
			}		
			
			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		}
		
		$(".suspended_btn").on("click", function() {
	        var mid = $(this).val();
	        console.log(mid);
	        $.ajax({
	            type: "POST", // 또는 GET 등 HTTP 메소드 선택
	            url: "${pageContext.request.contextPath}/admin/suspended/active",
	            data: { mid: mid },
	            success: function(response) {
	                // 성공 시 수행할 로직
	                location.href="${pageContext.request.contextPath}/admin/declarationComplete";
	                console.log(response);
	            },
	            error: (request, status, error) => {
	                // 에러 시 수행할 로직
	            	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + request.error);
	            }
	        });
	    });
	</script>
</body>
</html>
