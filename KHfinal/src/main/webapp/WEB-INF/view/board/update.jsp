<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/view/msg/message.jsp"></jsp:include>
<meta charset="UTF-8">
<title>톡톡글수정</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" /> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_layout.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_nav.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/css/jobkh_main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_footer.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/member/css/jobkh_mypage.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="icon" href="resources/favicon.ico">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="//cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
<style>
body {
    background-color: #f9f9f9;
    margin: 0;
}

.jkLogo {
	margin-left: 30px;
}

.search{
	display: none;
}
.spNav{
	display: none;
	border: none;
}
.subSchArea {
	display: none;
}
.subSchLink {
	display: none;
}
.bcontainer {
    max-width: 800px;
    margin: 20px auto;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    display: flex;
    flex-direction: column; /* 컨테이너 안의 요소들을 수직으로 배치 */
    align-items: center; /* 가로 중앙 정렬 */
    padding: 20px;
}

h2 {
    text-align: center;
    margin-top: 20px;
}

form {
    max-width: 760px;
    height: auto;
    margin: 0 auto;
    padding: 20px;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
}

form input[type="text"],
form textarea {
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    resize: vertical;
}


form input[type="text"] {
	width: 720px;
}

form textarea {
	width: 100%;
}

form button[type="button"] {
    padding: 10px 20px;
    background-color: #007bff;
    border: none;
    border-radius: 3px;
    color: #fff;
    cursor: pointer;
    width: auto;
    margin: 0 auto;
}

form button[type="button"] {
    background-color: #3399ff;
    margin-top: 10px;
    margin-left: 10px;
}
#infoForm {
    display: none;
}
</style>
</head>
<div class="wrap header">
	<div style="background-color:#ffffff">
    	<jsp:include page="/WEB-INF/view/member/header.jsp"></jsp:include>
	</div>    
</div>
<body style="font-family: Pretendard Variable, Pretendard, -apple-system,
            BlinkMacSystemFont, system-ui, Roboto, Helvetca Neue, Segoe UI,
            Apple SD Gothic Neo, Noto Sans KR, Malgun Gothic, Apple Color Emoji,
            Segoe UI Emoji, Segoe UI Symbol, sans-serif">
<div class="container">
    <div class="bcontainer">
		<form id="frmBoard">
			<input type="hidden" name="bno" value="${dto.bno}">
		    <input type="text" name="btitle" value="${dto.btitle}" readonly>
		    <br>
		    <textarea rows="10" cols="50" name="bcontent">${dto.bcontent}</textarea>
		    <script type="text/javascript">
		       CKEDITOR.replace('bcontent', {
		           filebrowserUploadUrl:'${pageContext.request.contextPath}/image/upload',
		           enterMode: CKEDITOR.ENTER_BR,
		           shiftEnterMode: CKEDITOR.ENTER_P,
		           autoParagraph: false,
		           removePlugins: 'enterkey',
		           width: '100%',
		           height: '400px',
		       });
		    </script>
		    <br>
		    <div id="btn">
			    <button type="button" id="btn-board-update">수정</button>
			    <button type="button" id="btn-board-list">메인으로</button>
		    </div>
		</form>
    </div>
</div>
<form id="infoForm" action="${pageContext.request.contextPath}/board/update" method="get">
 	<input type="hidden" id="bno" name="bno" value='<c:out value="${dto.bno}"/>'>
	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
	<input type="hidden" name="type" value="${cri.type }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
</form>
<script>   
	let form = $("#infoForm");
	/* ---------- 리스트로 ---------- */
	$("#btn-board-list").on("click", function(e){
		window.history.back();
	});
	
	$("#btn-board-update").click(function(){
	    if(confirm("글 수정하시겠습니까?")){
	        $('[name=bcontent]').val(CKEDITOR.instances.bcontent.getData());
	    	$.ajax({
	            type: "post",
	            url: "${pageContext.request.contextPath}/board/update",
	            data: $("#frmBoard").serialize(),
	            //dataType: "json",
	            success: function(response){
	            	console.log(response);
	                if(response > 0){
	                    alert("글 수정되었습니다.");
	                    location.href = "${pageContext.request.contextPath}/board/get?bno=${dto.bno}";
	                }else{
	                    alert("글 수정에 실패했습니다.");
	                }
	            }
	        });
   		}
	});
</script>
</body>
</html>