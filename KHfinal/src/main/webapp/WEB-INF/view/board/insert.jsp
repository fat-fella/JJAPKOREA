<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardInsert</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="//cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
<style>     
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

h2 {
    text-align: center;
    margin-top: 20px;
}

div {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
    form input[type="text"],
    form textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
        resize: vertical;
    }

    form button[type="submit"],
    form button[type="button"] {
        padding: 10px 20px;
        background-color: #007bff;
        border: none;
        border-radius: 3px;
        color: #fff;
        cursor: pointer;
    }

    form button[type="button"] {
        background-color: #ccc;
        margin-left: 10px;
    }
    
    #btn-board-list {
        background-color: #ccc;
        margin-left: 10px;
    }
</style>
</head>
<body>
<div>
   <form id="frmBoard">
   		<div>
        	제목: <input type="text" name="btitle">
   		</div>
       	내용: <textarea id="bcontent" rows="10" cols="50" name="bcontent" ></textarea>
       	<script type="text/javascript">
			CKEDITOR.replace('bcontent', {
 				filebrowserUploadUrl:'${pageContext.request.contextPath}/image/upload',
 				enterMode: CKEDITOR.ENTER_BR, // 엔터키 입력시 <br>로 바꿔준다.
 			    shiftEnterMode: CKEDITOR.ENTER_P, // Shift + 엔터키 입력시 <p> 태그로 바꿔준다.
 			    autoParagraph: false, // 자동으로 <p> 태그를 추가하지 않도록 설정.
 			    removePlugins: 'enterkey',
 			   	/* clipboard_handleImages: true */
 			   	clipboard_handleImages: false
 			});
		</script>
        <div id="btn">
	        <button type="button" id="btn-board-insert">글 등록</button>
			<a href="${pageContext.request.contextPath}/board/list">
				<button type="button">글 목록으로 이동</button>
			</a>	
        </div>     
    </form>
</div>
<script>
$("#btn-board-insert").click(function() {	
    const btitle = $("input[name='btitle']").val().trim();
    const bcontent = CKEDITOR.instances.bcontent.getData();
    if(btitle ===''){
    	alert("제목을 입력해주세요");
    	return;
    }
     if(bcontent ===''){
    	alert("내용을 입력해주세요");
    	return;
    }
     if (confirm("글을 등록하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/board/insert",
            data: { 
                btitle: btitle,
                bcontent: bcontent 
            },
            success: function(response) {
                if (response > 0) {
                    alert("글 등록되었습니다.");
                    location.href = "${pageContext.request.contextPath}/board/list";
                }else {
                    alert("글 등록에 실패했습니다.");
                } 
            },
            error : ( request, status, error) => {
             	console.log("Ajax오류");
             	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             	/*
            	console.log(request);
            	console.log(status);
            	console.log(error);
            	*/
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           	}
        });
    }
});
</script>
</body>
</html>