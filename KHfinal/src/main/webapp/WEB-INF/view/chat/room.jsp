<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP Page</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
    <div class="container">
        <div class="col-6">
            <h1>${room.name}</h1>
        </div>
        <div>
            <div id="msgArea" class="col"></div>
            <div class="col-6">
                <div class="input-group mb-3">
               		<input type="text" id="msg" class="form-control">
               		<div class="input-group-append">
                    	<button class="btn btn-outline-secondary" id="button-send">전송</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-6"></div>
    </div>

    <script>
        $(document).ready(function(){

            var roomName = "${room.name}";
            var roomId = "${room.roomId}";
            var username = "${room.writer}";

            console.log(roomName + ", " + roomId + ", " + username);

            var sockJs = new SockJS("/jjapkorea/stomp/chat");
            var stomp = Stomp.over(sockJs);

            stomp.connect({}, function (){
                console.log("STOMP Connection");

                stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
                    var content = JSON.parse(chat.body);

                    var writer = content.writer;
                    var message = content.message;
                    var str = '';

                    if(writer === username){
                        str = "<div class='col-6'>";
                        str += "<div class='alert alert-secondary'>";
                        str += "<b>" + writer + " : " + message + "</b>";
                        str += "</div></div>";
                        $("#msgArea").append(str);
                    }
                    else{
                        str = "<div class='col-6'>";
                        str += "<div class='alert alert-warning'>";
                        str += "<b>" + writer + " : " + message + "</b>";
                        str += "</div></div>";
                        $("#msgArea").append(str);
                    }
                });

                $("#button-send").on("click", function(e){
                    var msg = document.getElementById("msg");

                    console.log(username + ":" + msg.value);
                    stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username}));
                    msg.value = '';
                });

                stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username}));
            });
        });
        $(document).ready(function() {
            $("#button-send").click(function() {
                // 입력된 채팅 메시지 가져오기
                var chatMessage = $("#msg").val();

                // Ajax 요청 보내기
                $.ajax({
                    type: "POST",
                    url: "/jjapkorea/insertChat", // Spring Controller의 URL로 변경
                    data: {
                        message: chatMessage // 채팅 메시지 데이터 전송
                    },
                    success: function(response) {
                        // Ajax 요청이 성공했을 때의 처리
                        console.log("채팅 메시지가 성공적으로 전송되었습니다.");
                        // 이후 필요한 작업을 수행할 수 있습니다.
                    },
                    error: function(xhr, status, error) {
                        // Ajax 요청이 실패했을 때의 처리
                        console.error("채팅 메시지 전송 중 오류가 발생했습니다.");
                        console.error(xhr.responseText);
                    }
                });
            });
        });
    </script>
</body>
</html>
