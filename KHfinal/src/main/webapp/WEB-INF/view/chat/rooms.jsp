<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <meta charset="UTF-8">
    <title>고객센터 채팅</title>
    <!-- 여기에 필요한 CSS 및 JavaScript 파일을 포함할 수 있습니다. -->
</head>
<body>
    <div class="container">
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
    </form>

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
