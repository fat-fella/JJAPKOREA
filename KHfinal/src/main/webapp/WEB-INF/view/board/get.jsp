<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardOne</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
}

.container {
	max-width: 800px;
	margin: 20px auto;
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.content {
	padding: 20px;
}

h2 {
	margin-top: 0;
	font-size: 24px;
	color: #333333;
}

input[type="text"], textarea {
	width: 100%;
	padding: 12px;
	margin-bottom: 10px;
	border: 1px solid #e0e0e0;
	border-radius: 4px;
	background-color: #f7f7f7;
	font-size: 16px;
	color: #333333;
}

button {
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #007bff;
	color: #ffffff;
	font-size: 16px;
	transition: background-color 0.2s;
}

button:hover {
	background-color: #0056b3;
}

/* 댓글 */
.replyCard {
    border: 1px solid #ccc;
    padding: 10px;
    margin-bottom: 10px;
}

.updatereplyContent {
    margin-bottom: 10px;
}

.groupbtn button {
    margin-right: 5px;
}

/* 대댓글 */
.replyreplycard {
    border: 1px solid #ddd;
    padding: 10px;
    margin-left: 20px; /* 들여쓰기 조절 */
    margin-top: 10px;
}

.replyreplycard textarea {
    width: 100%;
    padding: 5px;
}

.replyreplycard .submitreplyreply {
    margin-top: 5px;
}
</style>
</head>
<body>
	<c:out value="${like_no}" />
	<div class="container">
		<div class="content">
			<div>
				<div class="mb-3 mt-3">
					<input type="hidden" class="form-control" id="boardNo"
						name="boardNo" value="${detail.bno}" disabled>
				</div>
				<form action="${pageContext.request.contextPath }/board/update" method="get">
				<h3><c:out value="${detail.bno}"/>번글</h3>
					<input type="hidden" name="bno" value="${detail.bno}"> 
					<label for="btitle">제목:</label> 
					<input type="text" id="btitle" name="btitle" value="${detail.btitle}" readonly> 
					<br> 
					<label for="bcontent">내용:</label>
					<textarea id="bcontent" rows="10" cols="50" name="bcontent" readonly>${detail.bcontent}</textarea>
					<br> 
					<label for="likehit">좋아요수: (${detail.likehit })</label>
					<button type="submit" id="btn-board-update">글 수정</button>
					<button type="button" id="btn-board-delete">글 삭제</button>
					<a href="${pageContext.request.contextPath}/board/list">
						<button type="button">글 목록으로 이동</button>
					</a>
					<button type="button" id="btn-board-like" onclick="updateLike(); return false;">좋아요</button>
				</form>
				<!-- 댓글 입력 폼 -->
 				
				<div class="card">
					<form method="post"
						action="${pageContext.request.contextPath}/replyboard/insert">
						<div class="card-body addaddreply contenttextarea">
							<label>댓글 작성자(로그인한 아이디로 변경) : ${detail.mid}</label>
							<textarea rows="3" class="col-xl-12" name="replyContent"
								class="replyContent"></textarea>
							<button class="submitreply" type="button">댓글 작성</button>
						</div>
					</form>
				</div> 
			    <!-- 댓글 -->
			<%-- 			    
				<div class="replyCard" data-replyno="1" data-writer="User1">
			        <div class="updatewriter">이름: ${rlist.mid}</div>
			        <div class="updatereplyContent">내용: ${rlist.replyContent}</div>
			        <div class="updatereplyDate">입력날짜: ${rlist.replyDate}</div>
			        <div class="groupbtn">
			            <button class="updatereply">수정</button>
			            <button class="deletereply">삭제</button>
			            <button class="insertreplyreply">댓글 삽입</button>
			    </div>
		     --%>
			    
 				<div class="card-body addreply"></div>
				<!-- 댓글 리스트 -->
				<div class="testappend"></div>
			</div>
		</div>
	</div>
<script>
/* 댓글 삭제 */
   $("#btn-board-delete").click(function () {
       var bno = '${detail.bno}';
       if (confirm("글 삭제하시겠습니까?")==true) {
         $.ajax({
           type: "post",
           url: "${pageContext.request.contextPath}/board/delete",
           data: { bno: bno },
           success: function (response) {
           	console.log(response);
            if(response > 0){
            	alert("삭제되었습니다.");
            }else {
            	alert("삭제 실패했습니다");
            }
			location.href = "${pageContext.request.contextPath}/board/list";
			}
		});
	}
});
   
	var bno = '${detail.bno}';
	var mid = '${detail.mid}';
	function updateLike(){ 
	     $.ajax({
	            type : "POST",  
	            url : "${pageContext.request.contextPath}/board/updateLike",       
	            dataType : "json",   
	            data : {'bno' : bno, 'mid' : mid },
	            error : function(){
	               alert("통신 에러");
	            },
	            success : function(likeCheck) {	                
	                    if(likeCheck == 0){
	                    	alert("좋아요");
	                    	$("#btn-board-like").html("좋아요 취소");
	                    	location.reload();
	                    }
	                    else if (likeCheck == 1){
	                     	alert("좋아요 취소");
	                    	$("#btn-board-like").html("좋아요");
	                    	location.reload();
	                    }
	            	}
	        	});
			} 
	
	/* Reply */
	   let replyreplyleftpadding = "";
	   window.onload = function () {
			replyreplyleftpadding=$(".cardwidth").width()*0.03;
			$.ajax({
		           type: "get",
		           url: "${pageContext.request.contextPath}/board/boardReadCnt",
		           data: {  readcnt :${detail.readcnt},bno:${detail.bno}  },
		           success: function (result) {
		        	   console.log("boardReadCnt : success");
					},error : function(result){
						console.log("error");
					}
				});
	       var moreReply = "";
	       $.ajax({
	           type: "get",
	           url: "${pageContext.request.contextPath}/replyboard/list",
	           data: { bno:${detail.bno}},
	           success: function (result) {
	               for (var i = 0; i < result.length; i++) {
	                   if (result[i].rref == 0) {
	                	   var  htmlVal =  '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="firstReply card" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
		    		   		+'<div class="groupbtn"><button class="updatereply">수정</button><button onclick="deletereplyHandler(\''+result[i].replyNo+'\');">삭제</button><button class="insertreplyreply">댓글 삽입</button>'
		    		   		+'<button class="moreReply" data-replyno="'+result[i].replyNo+'">댓글 더보기</button>';
		    		   	 	htmlVal+='</div></div><div class="forAppendArea"></div>';
		    		   		$(".testappend").append(htmlVal);
	                   	}
	               }
	        	   $(".updatereply").click(updatereplyHandler);
	        	   $(".insertreplyreply").click(insertreplyreplyHandler);
	        	   $(".moreReply").click(moreReplyHandler);
	           },
	           error: function (result) {
	               console.log("error");
	           },
	           dataType: "json"
	       });

	   }
	   function moreReplyHandler(e){
			var rrefReplyNo=$(this).data("replyno");
			var eTarget=e.target;
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/replyboard/moreReplylist",
				data: { rref:rrefReplyNo},
				success : function (result) {
					$(".forAppendArea").html("");
					console.log(result.length);
					if(result.length==0){
						alert("답글이 없습니다.");
					}else{
					for (var i = 0; i < result.length; i++) {
	       			var  htmlVal =  '<div class="firstReply card"  style="padding-left :'+replyreplyleftpadding+'px" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
	   		   		+'<div class="groupbtn"><button onclick="deletereplyHandler('+result[i].replyNo+');">삭제</button></div>';
	   		   		$(eTarget).parents(".replyCard").find(".forAppendArea").append(htmlVal);
					 }
	   		      }  
					 
		        },  // success,
				error : function () {
		        	  console.log("error");
				},
				dataType:"json"
			});
		}
	   $(".submitreply").click(submitreplyHandler);
	   function submitreplyHandler() {
	       var replyContent = $("[name=replyContent]").val();
	       $.ajax({
	           type: "post",
	           url: "${pageContext.request.contextPath}/replyboard/insert",
	           data: {
	               memberId: "${detail.mid}",
	               replyContent: replyContent,
	               boardNo: $("#boardNo").val(),
	               rstep: ${detail.rstep} + 1,
	               rlevel: ${detail.rlevel} + 1
	           },
	           success: function (result) {
	    		   $(".testappend").html("");
						for (var i = 0; i < result.length; i++) {
		   		   		var  htmlVal =  '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="firstReply card"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
		   		   		+'<div class="groupbtn"><button class="updatereply">수정</button><button onclick="deletereplyHandler('+result[i].replyNo+');">삭제</button><button class="insertreplyreply">댓글 삽입</button></div></div>';
		   				$(".testappend").append(htmlVal);   
	   				
		   	   		};
		   	   		$(".addreply").html("");
		   			$(".updatereply").click(updatereplyHandler);
		   			$(".insertreplyreply").click(insertreplyreplyHandler);
	           },
		           error: function () {
		               console.log("error");
	           },
	           dataType: "json"
	       });
	   }

	   function refreshCommentList(comments) {
	       $(".testappend").html("");
	       for (var i = 0; i < comments.length; i++) {
	           var htmlVal = '<div class="card replyCard" data-replyno="' + comments[i].replyNo + '" data-writer="' + comments[i].memberId + '"><div class="firstReply card"><div class="updatewriter">작성자 : ' + comments[i].memberId + '</div><div class="updatereplyContent">내용 : ' + comments[i].replyContent + '</div><div class="updatereplyDate">입력날짜 : ' + comments[i].replyDate + '</div>'
	               + '<div class="groupbtn"><button class="updatereply">수정</button><button class="deletereply">삭제</button><button class="insertreplyreply">댓글 삽입</button></div></div>';
	           $(".testappend").append(htmlVal);
	       }
	       $(".deletereply").click(deletereplyHandler);
	       $(".updatereply").click(updatereplyHandler);
	       $(".insertreplyreply").click(insertreplyreplyHandler);
	   }
	   function deletereplyHandler(forNumber) {
		    console.log(forNumber);
		    $.ajax({
		        type: "get",
		        url: "${pageContext.request.contextPath}/replyboard/one",
		        data: { replyNo: forNumber },
		        success: function (result) {
		            console.log(result.memberId);
		            console.log("${detail.mid}");
		            $.ajax({
		                type: "post",
		                url: "${pageContext.request.contextPath}/replyboard/delete",
		                data: { replyNo: forNumber },
		                success: function (result) {
		                    location.reload(true);
		                },
		                error: function () {
		                    console.log("error");
		                },
		                dataType: "json"
		            });
		        },
		        error: function () {
		            console.log("error");
		        },
		        dataType: "json"
		    });
		}

		function updatereplyHandler() {
		    var replyWriter = $(this).parents(".replyCard").data("writer");
		    console.log("test123");
		    if (replyWriter == "${detail.mid}") {
		        $(this).parents(".replyCard").find(".updatereplyContent").html("");
		        $(this).parents(".replyCard").find(".updatereplyDate").hide();
		        //$(this).parents(".groupbtn").hide();
		        var updateContent = '<textarea rows="3" class="col-xl-12 replyContent" name="replyContent1"></textarea>'

		        $(this).parents(".replyCard").find(".updatereplyContent").html(updateContent);
		        var updateDoBtn = '<button type="button" class="updateDoBtn">댓글 수정</button>'
		        $(this).parents(".groupbtn").html(updateDoBtn);
		        $(".updateDoBtn").click(updateDoBtnHandler);
		    } else {
		        alert("작성자가 아닙니다");
		    }
		}

		function updateDoBtnHandler() {
		    var replyContent1 = $("[name=replyContent1]").val();
		    $.ajax({
		        type: "post",
		        url: "${pageContext.request.contextPath}/replyboard/update",
		        data: { replyNo: $(this).parents(".replyCard").data("replyno"), replyContent: replyContent1 },
		        success: function (result) {
		            console.log("success");
		            location.reload(true);
		        },
		        error: function () {
		            console.log("error");
		        },
		        dataType: "json"
		    });
		}

		
		function insertreplyreplyHandler(){
			var replyreplywriter=$(this).parents(".replyCard").data("writer");
			var addreplyreply ='<div class="contenttextarea card replyreplycard" style="padding-left :'+replyreplyleftpadding+'px" data-writer="${detail.mid}"><div>↳작성자 : ${detail.mid}</div><div><textarea rows="3" class="col-xl-12 replyContent" name="replyreplyContent">@'+replyreplywriter+'</textarea></div><div><button class="submitreplyreply">답글 저장</button></div></div>'
			$(".contenttextarea").remove();
			$(this).parents(".replyCard ").append(addreplyreply);
			$(".submitreplyreply").click(submitreplyreplyHandler);
		}
		
		function submitreplyreplyHandler(){
			console.log("submitreplyreplyHandler");
			var replyreplyContent= $("[name=replyreplyContent]").val();
			console.log(replyreplyContent);
		  	$.ajax({
		       type: "post",
		       url: "${pageContext.request.contextPath}/replyboard/replyinsert",
		       data: {memberId:"${detail.mid}",  replyContent : replyreplyContent, boardNo:${detail.bno},rref : $(this).parents(".replyCard").data("replyno") },
		       success: function (result) {
		    	   console.log("success");
		    	   },
				error : function (){
					 console.log("error");
					},dataType:"json"
			});
		}

</script>
</body>
</html>