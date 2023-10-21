<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    padding: 1px 4px; /* 수정된 버튼 크기 */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    background-color: #007bff;
    color: #ffffff;
    font-size: 11px;
    transition: background-color 0.2s;
}

button:hover {
    background-color: #0056b3;
}

#bcontent {
    background-color: #f7f7f7; /* 배경색 설정 */
    border: 1px solid #e0e0e0; /* 테두리 설정 */
    border-radius: 4px; /* 테두리 둥글게 만들기 */
    padding: 12px; /* 여백 설정 */
    font-size: 16px; /* 글꼴 크기 설정 */
    color: #333333; /* 글자색 설정 */
}

/* 댓글 카드 스타일 */
.replyCard {
    border: 1px solid #ccc;
    margin: 10px 0;
    padding: 10px;
    background-color: #f9f9f9;
}

/* 댓글 작성자 스타일 */
.updatewriter {
    font-weight: bold;
    color: #333;
}

/* 댓글 내용 스타일 */
.updatereplyContent {
    margin: 10px 0;
    color: #333;
}

/* 댓글 날짜 스타일 */
.updatereplyDate {
    color: #888;
}

/* 버튼 스타일 */
.groupbtn {
    margin: 10px 0;
}

/* 수정, 삭제 버튼 스타일 */
.updatereply,
.insertreplyreply,
.submitreplyreply,
.updateDoBtn {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 1px 4px;
    margin-right: 5px;
    cursor: pointer;
}

.updatereply:hover,
.insertreplyreply:hover,
.submitreplyreply:hover,
.updateDoBtn:hover {
    background-color: #0056b3;
}

/* 더보기, 숨기기 버튼 스타일 */
.moreReply,
.hideReplies {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
}

.moreReply:hover,
.hideReplies:hover {
    background-color: #0056b3 ;
}

/* 대댓글 카드 스타일 */
.replyreplycard {
    border: 1px solid #ccc;
    padding: 10px;
    background-color: #f3f3f3;
    margin-left: 20px;
}
 /* 대댓글 목록 스타일 */
.forAppendArea {
    margin-left: 30px;
}

.forAppendArea {
    padding: 10px;
    background-color: #f3f3f3;
}

.moreReply{
    padding: 1px 4px; /* 수정된 버튼 크기 */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    background-color: #007bff;
    color: #ffffff;
    font-size: 11px;
    transition: background-color 0.2s;
}
.moreReply:hover {
    background-color: #0056b3;
}

</style>
</head>
<body>
<div class="container">
	<div class="content">
		<div>
			<div class="mb-3 mt-3">
				<input type="hidden" class="form-control" id="boardNo"
					name="boardNo" value="${bvo.bno}" disabled>
			</div>
			<form id="infoForm" action="${pageContext.request.contextPath }/board/update" method="get">
			<h3><c:out value="${bvo.bno}"/>번글</h3>
				<input type="hidden" name="bno" value="${bvo.bno}"> 
				<label for="btitle">제목:</label> 
				<input type="text" id="btitle" name="btitle" value="${bvo.btitle}" readonly> 
				<br> 
				<label for="bcontent">내용:</label>
				<div id="bcontent" style="width: 97%; height: 300px;" readonly>${bvo.bcontent}</div>
				<br> 
				<label for="likehit">좋아요수: (${bvo.likehit })</label>
				<c:choose>
				    <c:when test="${memberid eq bvo.mid}">
				        <a href="${pageContext.request.contextPath}/board/update?bno=${bvo.bno}">
				            <button id="btn-board-update">글 수정</button>
				        </a>
				        <button id="btn-board-delete">글 삭제</button>
				    </c:when>
				    <c:otherwise>
				        <script>
				            var btnUpdate = document.getElementById("btn-board-update");
				            var btnDelete = document.getElementById("btn-board-delete");
				            if (btnUpdate) {
				                btnUpdate.style.display = "none";
			            	}
				            if (btnDelete) {
				                btnDelete.style.display = "none";
			            	}
				        </script>
				    </c:otherwise>
				</c:choose>
				<button type="button" id="btn-board-list">글 목록으로 이동</button>
				<button type="button" id="btn-board-like" onclick="updateLike(); return false;">좋아요</button>
				<input type="hidden" id="bno" name="bno" value='<c:out value="${bvo.bno}"/>'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			 	<input type="hidden" name="type" value="${cri.type }">
			 	<input type="hidden" name="keyword" value="${cri.keyword }">
			</form>
		<!-- 댓글 Area -->
			<c:if test="${not empty memberid}">
			    <div class="addreply">
			        <div class="card">
			            <form method="post" action="${pageContext.request.contextPath}/replyboard/insert">
			                <div class="card-body addaddreply contenttextarea">
			                    <label>댓글 작성자 : ${memberid}</label>
			                    <textarea rows="3" class="col-xl-12" name="replyContent" class="replyContent"></textarea>
			                    <button class="submitreply" type="button" onclick="submitreplyHandler()">댓글 작성</button>
			                </div>
			            </form>
			        </div>
			    </div>
			</c:if>
	<!-- 댓글 대댓글 리스트 -->
			<div class="testappend"></div>
		</div>
	</div>
</div>
<script>
	let form = $("#infoForm");
/* ---------- 리스트로 ---------- */
$("#btn-board-list").on("click", function(e){
/* 	form.find("#bno").remove();
	form.attr("action", "/jjapkorea/board/list");
	form.submit(); */
	window.history.back();
});
/* ---------- 수정으로 ---------- */
$("#btn-board-update").on("click", function(e){
	form.find("#bno").remove();
	form.attr("action", "/jjapkorea/board/update");
	form.submit();
});
/* ---------- 게시글 삭제 ---------- */
$("#btn-board-delete").click(function () {
	var bno = '${bvo.bno}';
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
/* ---------- 좋아요 ---------- */
var bno = '${bvo.bno}';
var mid = '${memberid}';
function updateLike() {
    var memberid = '${memberid}';
    if (memberid === '') {
        alert('로그인이 필요합니다!');
        window.location.href = 'http://127.0.0.1:8090/jjapkorea/login/';
        return;
    }
    $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/board/updateLike',
        dataType: 'json',
        data: { 'bno': bno, 'mid': mid },
        error: function () {
            alert('통신 에러');
        },
        success: function (likeCheck) {
            if (likeCheck == 0) {
                alert('좋아요');
                location.reload();
                $('#btn-board-like').html('좋아요 취소');
            } else if (likeCheck == 1) {
                alert('좋아요 취소');
                location.reload();
                $('#btn-board-like').html('좋아요');
            }
        }
    });
}
/* ---------- 댓글 ---------- */
let replyreplyleftpadding = "";
window.onload = function () {
    replyreplyleftpadding = $(".cardwidth").width() * 0.03;
    $.ajax({
        type: "get",
        url: "${pageContext.request.contextPath}/board/readcnt",
        data: { boardCount: ${bvo.readcnt}, boardNo: ${bvo.bno} },
        success: function (result) {
            console.log("readcnt: success(" + result + ")");
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });

    var moreReply = "";
    $.ajax({
        type: "get",
        url: "${pageContext.request.contextPath}/replyboard/list",
        data: { boardNo: ${bvo.bno} },
        success: function (result) {
            console.log("list: success");
            console.log(result);
            for (var i = 0; i < result.length; i++) {
                if (result[i].rref == 0) {
                    var htmlVal = '<div class="card replyCard" data-replytype="reply" data-replyno="' + result[i].replyNo + '" data-writer="' + result[i].memberId + '"><div class="firstReply card" data-replyno="' + result[i].replyNo + '" data-writer="' + result[i].memberId + '">' 
                    htmlVal += 			'<div class="updatewriter">[작성자] : ' + result[i].memberId + '</div>' 
                    htmlVal += 			'<div cla ss="updatereplyContent">[내용] : ' + result[i].replyContent + '</div>' 
                    htmlVal += 			'<div class="updatereplyDate">[입력날짜] : ' + result[i].replyDate + '</div>' 
                    htmlVal += 			'<div class="groupbtn">' 
                   	htmlVal += 				'<button class="updatereply">수정</button>' 
                	htmlVal += 				'<button class ="deletereply" onclick="deletereplyHandler(\'' + result[i].replyNo + '\');">삭제</button>' 
                 	htmlVal += 				'<button class="insertreplyreply">댓글 삽입</button>' 
                	htmlVal += 				'<button class="moreReply" id="moreReplyButton" data-type="more" data-replyno="' + result[i].replyNo + '">더보기</button>' 
                	htmlVal += 			'</div>'  
                    htmlVal += 	  '</div>'  
                    htmlVal += '<div class="forAppendArea" style="display: none"></div>';
                    $(".testappend").append(htmlVal);                  
		            if(result[i].memberId != "${memberid}"){
		            	$(".testappend .card:last-child .updatereply").hide();
	                    $(".testappend .card:last-child .deletereply").hide();
		            }
                }
            }
            $(".updatereply").click(updatereplyHandler);
            $(".insertreplyreply").click(insertreplyreplyHandler);
            $(".moreReply").click(moreReplyHandler);
            
            if (${bvo.bno} != 0) {
                console.log(${bvo.selectReplyNo});
                var firstReply = document.getElementsByClassName('firstReply');
                for (var i = 0; i < firstReply.length; i++) {
                    if ($(firstReply[i]).data("replyno") == ${bvo.selectReplyNo}) {
                        firstReply[i].classList.add('text-bg-warning');
                    }
                }
            }
        },
        error: function (result) {
            console.log("error");
        },
        dataType: "json"
    });  
}
/* ---------- 대댓글 보기 ---------- */
function moreReplyHandler(e) {
    var rrefReplyNo = $(this).data("replyno");
    var eTarget = e.target;
    var $replyCard = $(eTarget).parents(".replyCard");
    var $forAppendArea = $replyCard.find(".forAppendArea");
    var $moreReplyButton = $(this);

    if ($forAppendArea.css("display") === "block") {
        $forAppendArea.css("display", "none");
        $moreReplyButton.text("더보기");
        location.reload(false);
    } else {
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/replyboard/moreReplylist",
            data: { rref: rrefReplyNo },
            success: function (result) {
                $forAppendArea.html("");
                console.log("moreReplylist: success");
                console.log(result.length);
                if (result.length == 0) {
                    alert("댓글이 없습니다.");
                    return true;
                } else {
                    for (var i = 0; i < result.length; i++) {
                        var htmlVal = '<div class="firstReply card" data-replytype="child" style="padding-left:' + replyreplyleftpadding + 'px" data-replyno="' + result[i].replyNo + '" data-writer="' + result[i].memberId + '">'
                        htmlVal += '<div class="updatewriter"><작성자> : ' + result[i].memberId + '</div>'
                        htmlVal += '<div class="updatereplyContent"><내용> : ' + result[i].replyContent + '</div>'
                        htmlVal += '<div class="updatereplyDate"><입력날짜> : ' + result[i].replyDate + '</div>'
                        htmlVal += '<div class="groupbtn">';
                        if (result[i].memberId === "${memberid}") {
                            htmlVal += '<button class="deletereplyreply" onclick="deletereplyHandler(' + result[i].replyNo + ');">삭제</button>';
                        }
                        htmlVal += '<button class="insertreplyreply">답글달기</button>';
                        htmlVal += '</div>';
                        htmlVal += '</div>';
                        $forAppendArea.append(htmlVal);
                    }
                }
                $(".insertreplyreply").click(insertreplyreplyHandler);
                $forAppendArea.css("display", "block");
                $moreReplyButton.text("숨기기");
            },
            error: function () {
                console.log("error");
            },
            dataType: "json"
        });
    }
}
/* ---------- 댓글 등록 ---------- */
function submitreplyHandler() {
    var replyContent = $("[name=replyContent]").val();
    var memberid = '${memberid}';
    if (replyContent === '') {
        alert("댓글을 입력해주세요.");
        return false;
    }
    $.ajax({
        type: "post",
        url: "${pageContext.request.contextPath}/replyboard/insert",
        data: {
            memberId: "${memberid}",
            replyContent: replyContent,
            boardNo: $("#boardNo").val(),
            rstep: ${bvo.rstep} + 1,
            rlevel: ${bvo.rlevel} + 1
        },
        success: function (result) {
            console.log("submitreplyHandler : success");
            for (var i = 0; i < result.length; i++) {
                var htmlVal = '<div class="card replyCard" data-replyno="' + result[i].replyNo + '" data-writer="' + result[i].memberId + '">'
                htmlVal += '<div class="firstReply card">'
                htmlVal += '<div class="updatewriter">[작성자] : ' + result[i].memberId + '</div>'
                htmlVal += '<div class="updatereplyContent">[내용] : ' + result[i].replyContent + '</div>'
                htmlVal += '<div class="updatereplyDate">[입력날짜] : ' + result[i].replyDate + '</div>'
                htmlVal += '</div>'
                htmlVal += '<div class="groupbtn">'
                htmlVal += '<button class="updatereply">수정</button>'
                htmlVal += '<button onclick="deletereplyHandler(' + result[i].replyNo + ');">삭제</button>'
                htmlVal += '<button class="insertreply">댓글 삽입</button>'
                htmlVal += '</div>';
                htmlVal += '</div>'
                $(".testappend").append(htmlVal);
                $("[name=replyContent]").val("");
            };
            $(".updatereply").click(updatereplyHandler);
            $(".insertreply").click(insertreplyreplyHandler);
            location.reload(false);
        },
        error: function (request, status, error) {
            alert("code: " + request.status + "\n" + "error: " + error);
        },
        dataType: "json"
    });
}
/* ---------- 댓글 및 대댓글 삭제 ---------- */
function deletereplyHandler(forNumber) {
   	$.ajax({
    	type: "get",
    	url: "${pageContext.request.contextPath}/replyboard/one",
      	data: { replyNo: forNumber },
      	success: function (result) {
      		if(result.memberId != "${memberid}"){
	    		   alert("작성자가 아닙니다.");
      		}else{
	      		$.ajax({
	            	type: "post",
	              	url: "${pageContext.request.contextPath}/replyboard/delete",
	              	data: { replyNo: forNumber },
	              	success: function (result) {
	              		console.log("forNumber: "+ forNumber +"삭제");
	                  	if(forNumber > 0){
	             			alert("삭제되었습니다.");
	             		 	$(".replyCard[data-replyno='" + forNumber + "']").remove();
	             		 	$(".firstReply[data-replyno='" + forNumber + "']").remove();
	             		}else {
	             			alert("삭제 실패했습니다");
	             		}
	              },
	              error: function () {
	                  console.log("error");
	              },
	              dataType: "json"
	          });
      	   }
      },
      error: function () {
          console.log("error");
      },
      dataType: "json"
  });
}
/*  ---------- 답글 수정 ---------- */
function updatereplyHandler(){
		var replyWriter= $(this).parents(".replyCard").data("writer");
		if(replyWriter=="${memberid}"){
		$(this).parents(".replyCard").find(".updatereplyContent").html("");
		$(this).parents(".replyCard").find(".updatereplyDate").hide();
		var updateContent ='<textarea rows="3" class="col-xl-12 replyContent" name="replyContent1"></textarea>'
		$(this).parents(".replyCard").find(".updatereplyContent").html(updateContent);	
		 var updateDoBtn ='<button type="button" class="updateDoBtn">댓글 수정</button>'
		$(this).parents(".groupbtn").html(updateDoBtn); 
		 $(".updateDoBtn").click(updateDoBtnHandler);
		}else{
			alert("작성자가 아닙니다");
		}
	}

function updateDoBtnHandler(){
	var replyContent1= $("[name=replyContent1]").val();
    if(replyContent1 === ""){
    	alert("내용을 입력해주세요");
    	return false;
    }
	 $.ajax({
	       type: "post",
	       url: "${pageContext.request.contextPath}/replyboard/update",
	       data: {replyNo : $(this).parents(".replyCard").data("replyno"), replyContent : replyContent1},
	       success: function (result) {
	    	   console.log("updateDoBtnHandler : success");
	    	   location.reload(true);
	    	   },
			error : function (){
				 console.log("error");
			},
			dataType:"json"
	});
}
/* ---------- 대댓글 insert ---------- */	
 function insertreplyreplyHandler() {
    var $replyCard = $(this).parents(".replyCard");
    var replyreplywriter = $(this).parents(".replyCard").data("writer");
    var $contentTextarea = $replyCard.find(".contenttextarea");
    
    if ($contentTextarea.length === 0) {
        // 입력창이 존재하지 않는 경우
        var memberid = '${memberid}';
        if (memberid === '') {
            alert('로그인이 필요합니다!');
            window.location.href = 'http://127.0.0.1:8090/jjapkorea/login';
        }
        var addreplyreply = '<div class="contenttextarea card replyreplycard" data-writer="${memberid}">'
        addreplyreply += 		'<div>↳작성자: ${memberid}</div>'
        addreplyreply += 		'<div>'
        addreplyreply += 			'<textarea id="rereplyContent" rows="3" class="col-xl-12 replyContent" name="replyreplyContent">@' + replyreplywriter + " " + '</textarea>' //@' + replyreplywriter + " " + '
        addreplyreply += 		'</div>'
        addreplyreply += 		'<div>'
        addreplyreply += 			'<button class="submitreplyreply">답글 저장</button>'
        addreplyreply += 		'</div>'
        addreplyreply += 	'</div>';
        $replyCard.append(addreplyreply);
        $(".submitreplyreply").click(submitreplyreplyHandler);
        $replyCard.find(".forAppendArea").css("display", "block");
    } else {
        $contentTextarea.remove(); // 입력창을 제거하여 숨김
        location.reload(true);
    }
}
function insertreplyreplyHandler() {
    var $replyCard = $(this).parents(".replyCard");
    var replyreplywriter = $(this).parents(".replyCard").data("writer");
    var $contentTextarea = $replyCard.find(".contenttextarea");
    var textarea = document.getElementById("rereplyContent");
    if ($contentTextarea.length === 0) {
        // 입력창이 존재하지 않는 경우
        var replyreplywriter = $replyCard.data("writer");
        var memberid = '${memberid}';
        if (memberid === '') {
            alert('로그인이 필요합니다!');
            window.location.href = 'http://127.0.0.1:8090/jjapkorea/login';
        }
        var addreplyreply = '<div class="contenttextarea card replyreplycard" data-writer="${bvo.mid}">'
        addreplyreply += '<div>↳작성자: ${bvo.mid}</div>'
        addreplyreply += '<div>'
        addreplyreply += '<textarea rows="3" id="rereplyContent" class="col-xl-12 replyContent" name="replyreplyContent"></textarea>' //@' + replyreplywriter + " " + '
        addreplyreply += '</div>'
        addreplyreply += '<div>'
        addreplyreply += '<button class="submitreplyreply">답글 저장</button>'
        addreplyreply += '</div>'
        addreplyreply += '</div>';
        $replyCard.append(addreplyreply);
        $(".submitreplyreply").click(submitreplyreplyHandler);
        $replyCard.find(".forAppendArea").css("display", "block");

        textarea.value = '@' + replyreplywriter + " ";
        textarea.readOnly = true;
    } else {
        $contentTextarea.remove(); // 입력창을 제거하여 숨김
    }
}

function submitreplyreplyHandler() {
    var $replyContentTextarea = $(this).parent().siblings().find(".replyContent");
    var replyreplyContent = $replyContentTextarea.val().trim();
    var $replyCard = $(this).parents(".replyCard");
    var $moreReplyButton = $replyCard.find(".moreReply");
    if(replyreplyContent === ""){
    	alert("내용을 입력해주세요.");
    	return false;
    }
    $.ajax({
        type: "post",
        url: "${pageContext.request.contextPath}/replyboard/replyinsert",
        data: {
            memberId: "${memberid}",
            replyContent: replyreplyContent,
            boardNo: ${bvo.bno},
            rref: $replyCard.data("replyno")
        },
        success: function (result) {
            console.log("result: ", result);
            console.log("success");
            $replyCard.find(".contenttextarea").remove();
            var rrefReplyNo = $replyCard.data("replyno");
            var $forAppendArea = $replyCard.find(".forAppendArea"); // 대댓글이 추가될 영역
        // 대댓글 목록 다시 불러와서 불러온 대댓글 목록 화면에 추가
            $.ajax({ 
                type: "get",
                url: "${pageContext.request.contextPath}/replyboard/moreReplylist",
                data: { rref: rrefReplyNo },
                success: function (result) {
                    $forAppendArea.html(""); // 답글 목록 초기화
                    console.log("moreReplylist: success");
                    console.log(result.length);
                    if (result.length === 0) {
                        alert("답글이 없습니다.");
                    } else {
                        for (var i = 0; i < result.length; i++) {
                            var htmlVal =  '<div class="firstReply card" style="padding-left:' + replyreplyleftpadding + 'px" data-replyno="' + result[i].replyNo + '" data-writer="' + result[i].memberId + '"><div class="updatewriter"><작성자> : ' + result[i].memberId + '</div>'
                            htmlVal += '<div class="updatereplyContent"><내용> : ' + result[i].replyContent + '</div>'
                            htmlVal += '<div class "updatereplyDate"><입력날짜> : ' + result[i].replyDate + '</div>'
                            htmlVal += '<div class="groupbtn">'
                            htmlVal +=		'<button class="deletereplyreply" onclick="deletereplyHandler(' + result[i].replyNo + ');">삭제</button>'
                            htmlVal += 		'<button class="insertreplyreply">답글달기</button>'
                            htmlVal += '</div>'
                            $forAppendArea.append(htmlVal);
                        }
                        $(".insertreplyreply").click(insertreplyreplyHandler);
                        $moreReplyButton.text("숨기기");
                    }
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
</script>
</body>
</html>