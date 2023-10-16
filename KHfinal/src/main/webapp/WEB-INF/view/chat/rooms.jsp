<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_chatrooms.css">
<meta charset="UTF-8">
<title>고객센터 채팅</title>

</head>
	<header>
		<div class="container">
			<a href="index" class="logo linkLogo"> <img
				src="<%=request.getContextPath()%>/resources/images/짭코리아3.png"
				alt="JJAPKOREA" class="logoimg"></a>
			<div class="links">
				<a href="<%=request.getContextPath()%>/index" class="link linkHome">개인회원 홈</a>
				<a href="<%=request.getContextPath()%>/person/myPage" class="link linkManage">마이페이지</a>
			</div>
		</div>
	</header>
<body>
 <%--    <div class="container">
        <div>
            <ul>
                <c:forEach var="room" items="${list}">
    				<li><a href="<c:url value='/room'><c:param name='roomId' value='${room.roomId}'/></c:url>">${room.name}</a></li>
				</c:forEach>
            </ul>
        </div>
    </div>
    <form action="/jjapkorea/room" method="post">
        <input type="text" name="name" class="form-control" placeholder="Room Name">
        <input type="text" name="writer" class="form-control" placeholder="Writer Name"> <!-- 추가된 부분 -->
        <button class="btn btn-secondary">개설하기</button>
    </form> --%>

 <div class="containerchat">
        <div>
			<sec:authorize access="hasRole('ROLE_PERSON')">			
	            <ul>
                    <li><a href="<c:url value='/room'><c:param name='roomId' value='${mylist.roomId}'/></c:url>">${mylist.name}</a></li>
	            </ul>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">			
	            <ul>
	                <c:forEach var="room" items="${list}">
	                    <li><a href="<c:url value='/room'><c:param name='roomId' value='${room.roomId}'/></c:url>">${room.name}</a></li>
	                </c:forEach>
	            </ul>
			</sec:authorize>
        </div>
    </div>
    
        <c:if test="${empty list}">
    <form action="/jjapkorea/room" method="post">
        <input type="hidden" name="name" class="form-control" placeholder="Room Name" value="${mid}">
        <input type="hidden" name="writer" class="form-control" placeholder="Writer Name" value="${mid}" > <!-- 추가된 부분 -->
        <button class="btn-create">개설하기</button>
    </form>
        </c:if>

    <script>
        $(document).ready(function(){
            var roomName = "${roomName}";

            if(roomName != null)
                alert(roomName + "방이 개설되었습니다.");

            $(".btn-create").on("click", function (e){
                e.preventDefault();

                var name = $("input[name='name']").val();
                var writer = $("input[name='writer']").val(); // 추가된 부분

                if(name == "" || writer == "") // writer가 비어있는지도 확인
                    alert("Please write both the room name and writer name.");
                else
                    $("form").submit();
            });
        });
    </script>
</body>
</html>
