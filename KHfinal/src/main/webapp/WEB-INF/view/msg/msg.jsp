<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<script>
    var msgJson = '${msg}';
    var msg = JSON.parse(msgJson);

    if (msg && msg.length > 0) {
        alert(msg.join("\n"));
    }
    
    var message = '${message}';
    if(message){
    	alert(message);
    }
</script>