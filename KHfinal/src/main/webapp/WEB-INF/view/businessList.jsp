<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 정보</title>
<link rel="icon" href="resources/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_layout.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
    crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
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
    vertical-align: middle;
}

table.outer-table td img {
    width: 100%;
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
                        <td><img src="${item.LI}"></td>
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
    </main>
    <footer><jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include></footer>
</div>
<script>
function send(mid) {
	var url = '${pageContext.request.contextPath}/businessInfo';
    $.ajax({
        type: 'POST',
        url: url,
        data: { mid: mid },
        success: function(response) {
        	window.location.href = url;
        },
        error: function(error) {
            console.log('Error:', error);
        }
    });
}
</script>
</body>
</html>
