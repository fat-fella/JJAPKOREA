<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>고객센터 채팅</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jobkh_jpostupload.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jobkh_chatroom.css">


</head>
<header>
		<div class="container">
			<a href="index" class="logo linkLogo"> <img
				src="<%=request.getContextPath()%>/resources/images/짭코리아3.png"
				alt="JJAPKOREA" class="logoimg"></a>
			<div class="links">
				<a href="<%=request.getContextPath()%>/index" class="link linkHome">기업회원 홈</a>
				<a href="<%=request.getContextPath()%>/business/jobpostingupload/list" class="link linkManage">채용공고 관리</a>
			</div>
		</div>
	</header>
<body>
		<div class="chatcontainer">
    <div class="col-12">
        <h1>${room.name}</h1>
    </div>
    <div class="chat-container col-12" id="msgArea">
        <c:if test="${!empty showChat}">
            <c:forEach items="${showChat}" var="item">
                <div class="chat-message alert alert-secondary">
                    <b>${item.writer}: ${item.message}</b>
                </div>
            </c:forEach>
        </c:if>
    </div>
    <div class="col-12 chat-input">
        <div class="input-group mb-3">
            <input type="text" id="msg" class="form-control" placeholder="메시지를 입력하세요">
            <div class="input-group-append">
                <button class="btn btn-outline-secondary send-button" id="button-send">전송</button>
            </div>
        </div>
    </div>
</div>
		
		<div class="col-6"></div>

    <script>
        $(document).ready(function() {
            var roomName = "${room.name}";
            var roomId = "${room.roomId}";
            var username = "${room.writer}";

            var sockJs = new SockJS("/jjapkorea/stomp/chat");
            var stomp = Stomp.over(sockJs);

            stomp.connect({}, function() {
                stomp.subscribe("/sub/chat/room/" + roomId, function(chat) {
                    var content = JSON.parse(chat.body);

                    var writer = content.writer;
                    var message = content.message;
                    var str = '';

                    if (writer === username) {
                        str = "<div class='alert alert-secondary'>";
                        str += "<b>" + writer + " : " + message + "</b>";
                        str += "</div>";
                    } else {
                        str += "<div class='alert alert-warning'>";
                        str += "<b>" + writer + " : " + message + "</b>";
                        str += "</div>";
                    }

                    $("#msgArea").append(str);
                    $("#msgArea").scrollTop($("#msgArea")[0].scrollHeight);
                });

                $("#button-send").on("click", function(e) {
                    sendMessage();
                });

                $("#msg").on("keyup", function(e){
                    if(event.keyCode === 13){
                        sendMessage();
                    }
                });

                function sendMessage() {
                    var msg = document.getElementById("msg").value;
                    if(msg !== '') {
                        console.log(username + ":" + msg);
                        stomp.send('/pub/chat/message', {}, JSON.stringify({
                            roomId : roomId,
                            message : msg,
                            writer : username
                        }));
                        document.getElementById("msg").value = '';
                    }
                }

                stomp.send('/pub/chat/enter', {}, JSON.stringify({
                    roomId : roomId,
                    writer : username
                }));
            });
        });
    </script>

</body>
</html>









<%-- 	<div class="container">
		<div class="col-6">
			<h1>${room.name}</h1>
		</div>
		<div>
			<!-- 			<div id="msgArea" class="col"></div>
 -->
			<div class="col-6" id="msgArea">
				<c:if test="${!empty showChat}">
					<c:forEach items="${showChat}" var="item">
						<div class='alert alert-secondary'>
							<b> ${item.writer}: ${item.message} </b>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="input-group mb-3">
				<input type="text" id="msg" class="form-control">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" id="button-send">전송</button>
				</div>
			</div>
		</div> --%>

	<!-- <script>
		$(document).ready(function() {

			var roomName = "${room.name}";
			var roomId = "${room.roomId}";
			var username = "${room.writer}";

			console.log(roomName + ", " + roomId + ", " + username);

			var sockJs = new SockJS("/jjapkorea/stomp/chat");
			var stomp = Stomp.over(sockJs);

			stomp.connect({}, function() {
				console.log("STOMP Connection");

				stomp.subscribe("/sub/chat/room/" + roomId, function(chat) {
					var content = JSON.parse(chat.body);

					var writer = content.writer;
					var message = content.message;
					var str = '';
					if (writer === username) {
						/* str = "<div class='col-6'>";
						str += "<div class='alert alert-secondary'>";
						str += "<b>" + writer + " : " + message + "</b>";
						str += "</div></div>";
						$("#msgArea").append(str); */
						str = "<div class='alert alert-secondary'>";
						str += "<b>" + writer + " : " + message + "</b>";
						str += "</div>";
						$("#msgArea").append(str);
					} else {
						/* str = "<div class='col-6'>";
						str += "<div class='alert alert-warning'>";
						str += "<b>" + writer + " : " + message + "</b>";
						str += "</div></div>";
						$("#msgArea").append(str); */
						str += "<div class='alert alert-warning'>";
						str += "<b>" + writer + " : " + message + "</b>";
						str += "</div>";
						$("#msgArea").append(str);
					}
				});

				$("#button-send").on("click", function(e) {
					var msg = document.getElementById("msg");

					console.log(username + ":" + msg.value);
					stomp.send('/pub/chat/message', {}, JSON.stringify({
						roomId : roomId,
						message : msg.value,
						writer : username
					}));
					msg.value = '';
				});
				
				$("#msg").on("keyup", function(e){
					if(event.keyCode === 13){
						console.log(username + ":" + msg.value);
						stomp.send('/pub/chat/message', {}, JSON.stringify({
							roomId : roomId,
							message : msg.value,
							writer : username
						}));
						msg.value = '';
					}
				});

				

				

				stomp.send('/pub/chat/enter', {}, JSON.stringify({
					roomId : roomId,
					writer : username
				}));
			});
		});
	</script> -->