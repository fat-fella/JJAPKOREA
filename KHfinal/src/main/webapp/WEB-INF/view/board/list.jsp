<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/view/msg/message.jsp"></jsp:include>
<meta charset="UTF-8">
<title>취업톡톡</title>
<link rel="icon" href="resources/favicon.ico">
   
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jobkh_findid.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_banner.promotion-sv.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_gnb-sv.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_mtu_common-sv.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_mtu_tpl-sv.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_mtu_popup-sv-202308211127.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_notification-sv.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_footer-sv.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_tooltip.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_flow.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_common-sv.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_mtu_style-sv.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_swiper.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_mtu_popup-sv-202309061743.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_faba.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_font-awesome-css.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_pretendard-dynamic-subset.css">
	
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" /> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_layout.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_nav.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/css/jobkh_main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_footer.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/member/css/jobkh_mypage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/member/css/swiper-bundle.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="icon" href="resources/favicon.ico">

<style>
body {
    background-color: #f9f9f9;
    margin: 0;
}

.title {
    text-align: center;
    margin-top: -53px;
    padding-bottom: 10px;
    font-family: Pretendard Variable, Pretendard, -apple-system,
			BlinkMacSystemFont, system-ui, Roboto, Helvetica Neue, Segoe UI,
			Apple SD Gothic Neo, Noto Sans KR, Malgun Gothic, Apple Color Emoji,
			Segoe UI Emoji, Segoe UI Symbol, sans-serif
}
.title h2 {
    font-size: 32px;
    color: #333;
}

.styled-board {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
    margin-top: 20px;
}
.styled-board th,
.styled-board td {
    padding: 15px;
    font-size: 16px;
}
.styled-board th {
    background-color: #007bff;
    color: #fff;
}
.styled-board td a {
    color: #333;
    text-decoration: none;
}
.styled-board td a:hover {
    text-decoration: underline;
}

.footer {
    text-align: center;
    margin-top: 40px;
    padding-top: 10px;
/*     border-top: 2px solid #007bff; */
    background-color: #f9f9f9;
}
.footer p {
    font-size: 16px;
    color: #555;
}

/* 공통 스타일 */
.btn-container {
  margin: 10px;
}

a.button-link {
  text-decoration: none;
}

/* 키워드가 있는 경우 버튼 스타일 */
.btn-container-keyword {
  margin: 10px;
  float: right; /* 오른쪽으로 이동 */
}

/* 키워드가 없는 경우 버튼 스타일 */
.btn-container-no-keyword {
  margin: 10px;
  float: right;
}

button:hover {
  background-color: #0056b3;
}

button.keyword {
  padding: 10px 20px;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  background-color: #3399ff;
}

button.keyword:hover {
  background-color: #007bff;
}

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
}

/* 페이지 버튼 컨테이너 스타일 */
.pageInfo-wrap {
    text-align: center;
    margin-top: 20px;
}

/* 페이지 버튼 스타일 */
.pageInfo_btn {
    display: inline-block;
    margin: 5px;
    padding: 10px 15px;
    background-color: #white;
    color: #fff;
    border-radius: 5px;
    font-weight: bold;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
}

.pageInfo_btn:hover {
    background-color: #0056b3;
}

/* 이전 페이지 버튼 스타일 */
.pageInfo_btn.previous {
    background-color: #ccc;
}

.pageInfo_btn.previous:hover {
    background-color: #bbb;
}

/* 다음 페이지 버튼 스타일 */
.pageInfo_btn.next {
    background-color: #ccc;
}

.pageInfo_btn.next:hover {
    background-color: #bbb;
}

/* 현재 페이지 표시 스타일*/
.active{ 
    background-color: #cdd5ec;
}

/* 검색 */
.search_area{
    display: flex;
    margin-left: 700px;
    align-items: center;
    justify-content: flex-end;
}

.search_area input{
   	height: 30px;
  	width: 250px;
}
.search_area button{
   	width: 100px;
   	height: 36px;
}
.search_area select{
	height: 35px;
}
</style>
</head>
<div class="wrap header">
	<div style="background-color:#ffffff">
    	<jsp:include page="/WEB-INF/view/member/header.jsp"></jsp:include>
	</div>    
</div>
    
<body style="font-family: Pretendard Variable, Pretendard, -apple-system,
			BlinkMacSystemFont, system-ui, Roboto, Helvetica Neue, Segoe UI,
			Apple SD Gothic Neo, Noto Sans KR, Malgun Gothic, Apple Color Emoji,
			Segoe UI Emoji, Segoe UI Symbol, sans-serif">
	
<div class="container" style="margin-top: 47px;padding-bottom: 85px; line-height: 10px;">
	<div class="title">
		<h2> <img src="<%=request.getContextPath()%>/resources/images/취업톡톡(투명).png"style="height: 200px;"></h2>
	</div>
	<!-- 검색 -->
	<div class="search_wrap" style="margin: 10px;height: 1px;">
	    <div class="search_area">
	        <select name="type">
	        	<%-- <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>선택</option> --%>
	            <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
	            <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
	            <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
	        </select>   
	        <input type="text" name="keyword" placeholder="키워드를 입력해주세요!" value="${pageMaker.cri.keyword }" style="height: 35px;margin: 0 3px;width: 40%;">
	        <button class="keyword">Search</button>
	    </div>
	</div>   
	<c:if test="${not empty boardList }">
	    <p>총 ${total } 개의 게시물이 있습니다</p>
	    <table class="styled-board">
	        <tr>
	            <th>번호</th>
	            <th>제목</th>
	            <th>작성자</th>
	            <th>작성일</th>
	            <th>조회수</th>
	            <th>좋아요수</th>
	        </tr>
	        <c:forEach items="${boardList }" var="dto">
	            <tr>
	                <td>${dto.bno }</td>
	                <td>
	                   <a class="move" href='<c:out value="${dto.bno}"/>'>
	                        ${dto.btitle }
	                   </a>
	                </td>
	                <td>${dto.mid }</td>
	                <td>${dto.bwriteDate }</td>
	                <td>${dto.readcnt }</td>
	                <td>${dto.likehit }</td>
	            </tr>
	        </c:forEach>
	    </table>
	<!-- 페이징 및 버튼 -->    
	    <div class="pageInfo-wrap">
	    	<div class="pageInfo_area">
	    		<ul>
			        <!-- Previous -->
	                <c:if test="${pageMaker.prev}">
	                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
	                </c:if>
	
	                <!-- Page (현재 페이지 표시)-->
	                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
	                </c:forEach>
		           
		            <!-- Next -->
	                <c:if test="${pageMaker.next}">
	                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
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
	</c:if>
	
	<div class="btn-container btn-container-keyword">
	    <c:choose>
	        <c:when test="${not empty pageMaker.cri.type and not empty pageMaker.cri.keyword}">
	            <a href="<c:url value='/board/list'/>" class="button-link">
	                <button class="keyword">메인으로</button>
	            </a>
	        </c:when>
	        <c:otherwise>
	            <a href="<c:url value='/index'/>" class="button-link">
	                <button class="keyword">홈으로</button>
	            </a>
	        </c:otherwise>
	    </c:choose>
	</div>
	
	<div class="btn-container btn-container-keyword">
	    <c:choose>
	        <c:when test="${not empty memberid}">
	            <a href="<c:url value='/board/insert'/>" class="button-link">
	                <button class="keyword">글 등록</button>
	            </a>
	        </c:when>
	        <c:otherwise>
	            <a href="#" class="button-link" onclick="showAlertAndRedirect()">
	                <button class="keyword">글 등록</button>
	            </a>
	        </c:otherwise>
	    </c:choose>
	</div>
</div>
<script>
function showAlertAndRedirect() {
    alert("로그인이 필요합니다!");
    window.location.href = 'http://127.0.0.1:8090/jjapkorea/login/';
}

/* ------- 페이지 및 검색 ------- */
$(document).ready(function() {
	let moveForm = $("#moveForm");
    $(".pageInfo_btn a").on("click", function(e) {
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	    var pageNum = $(this).attr("href");
        moveForm.find("input[name='pageNum']").val(pageNum);
        moveForm.find("input[name='amount']").val(10); // 보여질 글의 갯수
        moveForm.attr("action", "${pageContext.request.contextPath}/board/list"); // context root를 포함한 URL
        moveForm.submit();
    });
	
	$(".move").on("click", function(e){
		e.preventDefault();
		var bno = moveForm.find("input[name='bno']").val();
		if(bno != ''){
			moveForm.find("input[name='bno']").remove();
		}
		moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
		moveForm.attr("action", "${pageContext.request.contextPath}/board/get");
		moveForm.submit();
	});
		
/* --- 엔터키 --- */
	$(".search_area button").on("click", function(e) {
	    performSearch();
	});
	$(".search_area input[name='keyword']").on("keyup", function(e) {
	    if (e.keyCode === 13) {
	        performSearch();
	    }
	});
	function performSearch() {
	    var type = $(".search_area select").val();
	    var keyword = $(".search_area input[name='keyword']").val();
	    var sKey = '<c:out value="${pageMaker.cri.keyword}"/>';
	    if (!type) {
	        alert("검색 종류를 선택하세요.");
	        return false;
	    }
	    if (!keyword) {
	        alert("키워드를 입력하세요.");
	        return false;
	    }
	    if (sKey != keyword) {
	        moveForm.find("input[name='pageNum']").val(1);
	    }
	    moveForm.attr("action", "${pageContext.request.contextPath}/board/list");
	    moveForm.find("input[name='type']").val(type);
	    moveForm.find("input[name='keyword']").val(keyword);
	    moveForm.submit();
	}
});
</script>


<div class="wrap footer">
	<jsp:include page="/WEB-INF/view/member/footer.jsp"></jsp:include>
</div>
<!-- swiper 스크립트 -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- swiper 기능 스크립트 -->
</body>
</html>