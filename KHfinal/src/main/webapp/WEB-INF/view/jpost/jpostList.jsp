<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_jpostupload.css">
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/favicon.ico">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 관리 페이지</title>
<link rel="icon" href="resources/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jpostList.css">
 
</head>
<body>
 	<header>
		<div class="container">
			<a href="<%=request.getContextPath()%>/index" class="logo linkLogo"> <img
				src="<%=request.getContextPath()%>/resources/images/짭코리아3.png"
				alt="JJAPKOREA" class="logoimg"></a>
			<div class="links">
				<a href="<%=request.getContextPath()%>/index" class="link linkHome">기업회원 홈</a>
				<a href="<%=request.getContextPath()%>/business/jobpostingupload/register" class="link linkManage">채용공고 등록</a>
			</div>
		</div>
	</header> 
	<div class="list">
	<div class="jposthead">
			<h2>채용공고 관리</h2>
			<h6>관리할 채용공고를 등록해주세요.</h6>
		</div>
    <div>
        <ul class="job-posting-list">
            <c:forEach var="item" items="${jpostList}">
                <li>
                    <div class="job-posting-box">
                        <a href="<c:url value='/jobpostinginfo'><c:param name='jid' value='${item.jid}'/></c:url>" class="title">${item.reTitle}</a>
                        <div class="">
	                        <input type="button" class="btn_ud" value="수정" onclick="edit('${item.jid}')"><input type="button" class="btn_ud" value="삭제" onclick="remove('${item.jid}')">
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<script>
	function edit(jid){
		location.href = '${pageContext.request.contextPath}/business/jobpostingupload/edit?jid='+jid;
	};
	
	function remove(jid){
		$.ajax({
			type :'POST',
			url:'${pageContext.request.contextPath}/business/jobpostingupload/list',
			data: {jid:jid},
			success: function(){
				alert("채용공고가 삭제되었습니다.");
				window.location.href = "${pageContext.request.contextPath}/business/jobpostingupload/list";
			},
			error: function(error){
				console.error("채용공고 삭제 실패", error);
			}
			
			
		});
	};
	
</script>

</body>
</html>