<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<script>
    var msgJson = '${msg}';
    var msg = msgJson ? JSON.parse(msgJson) : null;

    if (msg && msg.length > 0) {
        alert(msg.join("\n"));
    }
</script>