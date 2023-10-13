<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_jpostupload.css">
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/favicon.ico">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 관리 페이지</title>
<link rel="icon" href="resources/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
ul.job-posting-list {
    list-style-type: none;
    padding: 0;
}

ul.job-posting-list li {
    margin-bottom: 10px;
    width: 80%;
    margin-left: auto;
    margin-right: auto;
}

.job-posting-box {
    border: 1px solid #ddd;
    padding: 10px;
    border-radius: 5px;
    display: flex;
    justify-content: space-between;
}
.btn_ud{
            background-color: rgba(245,245,245)/* #f8f9fa */;
            border: 2px solid rgba(245,245,245);
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
.btn_ud:hover{
            background-color: #212529;
            color: white;

}
.btn_ud:active{
            background-color: #3e8e41;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
}




</style>
</head>
<body>
	<header>
		<div class="container">
			<a href="<%=request.getContextPath()%>/index" class="logo linkLogo"> <img
				src="<%=request.getContextPath()%>/resources/images/짭코리아.png"
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
                        <a href="<c:url value='/jobpostinginfo'><c:param name='jid' value='${item.jid}'/></c:url>">${item.reTitle}</a>
                        <div class="">
	                        <input type="button" class="btn_ud" value="수정"><input type="button" class="btn_ud" value="삭제">
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

</body>
</html>