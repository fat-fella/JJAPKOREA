<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/view/msg/message.jsp"></jsp:include>
<c:set var="bwriteDateStr" value="${bvo.bwriteDate}" />
<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
  Date bwriteDate = sdf.parse((String)pageContext.getAttribute("bwriteDateStr"));
  pageContext.setAttribute("bwriteDate", bwriteDate);
%>
<meta charset="UTF-8">
<title>취업톡톡상세</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" /> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_layout.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_nav.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/css/jobkh_main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_footer.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/member/css/jobkh_mypage.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="icon" href="resources/favicon.ico">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<style>
body {
    background-color: #f9f9f9;
    margin: 0;
}
.bcontainer {
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
	padding: 3px 6px; /* 수정된 버튼 크기 */
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
	background-color: #ffffff;	
	border: none; /* 테두리 설정 */
	border-radius: 4px; /* 테두리 둥글게 만들기 */
	padding: 12px; /* 여백 설정 */
	font-size: 16px; /* 글꼴 크기 설정 */
	color: #333333; /* 글자색 설정 */
}

.addreply{
	margin-top: 25px;

}

.testappend {
	margin-top: 25px;
	margin-bottom: 25px;
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
.updatereply, .insertreplyreply, .submitreplyreply, .updateDoBtn {
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 1px 4px;
	margin-right: 5px;
	cursor: pointer;
}

.updatereply:hover, .insertreplyreply:hover, .submitreplyreply:hover,
	.updateDoBtn:hover {
	background-color: #0056b3;
}

/* 더보기, 숨기기 버튼 스타일 */
.moreReply, .hideReplies {
	background-color: #007BFF;
	color: #fff;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
}

.moreReply:hover, .hideReplies:hover {
	background-color: #0056b3;
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
.forAppendArea .firstReply {
	padding: 10px;
	background-color: #f3f3f3;
}
.contenttextarea {
	width: 96.6%;
	margin-left: 30px;
	margin-top: 20px;
}
.moreReply {
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
.btnAllService {
	background-color:#ffffff
}
.testappend,
.card.replyCard {
    background-color: #ffffff;
}
.firstReply {
	border: none;
}
.firstReply card{
    position: relative;
}

.show-options {
    position: absolute;
    top: 0;
    right: 0;
    background: #fff;
    padding: 5px 10px;
    z-index: 1;
    cursor: pointer;
}
.addreply {
    text-align: center;
}

.addreply .submitreply {
    display: block;
    margin: 0 auto;
}
.deletereply-button {
   padding: 1px 4px;
   margin-right: 4px;
}

</style>
</head>

<div class="wrap header">
	<div style="background-color:#ffffff">
    	<jsp:include page="/WEB-INF/view/member/header.jsp"></jsp:include>
	</div>    
</div>
<body style="font-family: Pretendard Variable, Pretendard, -apple-system,
			BlinkMacSystemFont, system-ui, Roboto, Helvetca Neue, Segoe UI,
			Apple SD Gothic Neo, Noto Sans KR, Malgun Gothic, Apple Color Emoji,
			Segoe UI Emoji, Segoe UI Symbol, sans-serif">
			
<div class="container">
	<div class="bcontainer" style="max-width: 960px; position: relative; display: flex; flex-direction: column;">
		<div class="content">
			<div>
				<div class="mb-3 mt-3">
					<input type="hidden" class="form-control" id="boardNo"
						name="boardNo" value="${bvo.bno}" disabled>
				</div>
				<form id="infoForm"
					action="${pageContext.request.contextPath }/board/update"
					method="get">
					<h3>
						<c:out value="${bvo.btitle}" />
					</h3>
				    <span style="color: #888; font-size: 11px;">
						<fmt:formatDate value="${bwriteDate}" pattern="yyyy-MM-dd HH시 MM분" /> 작성
				    </span>
				    <hr style="border-top: 2px solid #888; margin: 20px 0;">
					<input type="hidden" name="bno" value="${bvo.bno}">
					<div id="bcontent" style="width: 100%; height: 400px; position: relative;" readonly>${bvo.bcontent}
						 <a href="#" style="position: absolute; bottom: 5px; left: 5px;">${bvo.mid}<span style="color: #888; font-size: 10px;">&nbsp;&nbsp;작성자</span></a>
					</div>
					<hr style="border-top: 2px solid #888; margin: 5px 0;">
					<br> <label for="likehit">좋아요: (${bvo.likehit })</label>
					<c:choose>
						<c:when test="${memberid eq bvo.mid}">
							<a
								href="${pageContext.request.contextPath}/board/update?bno=${bvo.bno}">
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
    				<button type="button" id="btn-board-list" style="position: absolute; bottom: 10px; right: 20px;">목록으로</button>
					<button type="button" id="btn-board-dislike" style="display: none;"
						onclick="updateLike();">좋아요 취소</button>
					<button type="button" id="btn-board-like" onclick="updateLike();">좋아요</button>
					<button type="button" id="btn-board-report"
						onclick="report('${bvo.bno}', '${bvo.mid}')">게시글 신고</button>
					<input type="hidden" id="bno" name="bno"
						value='<c:out value="${bvo.bno}"/>'>
					<input type="hidden" name="pageNum"
						value='<c:out value="${cri.pageNum}"/>'>
					<input type="hidden" name="amount"
						value='<c:out value="${cri.amount}"/>'>
					<input type="hidden" name="type" value="${cri.type }">
					<input type="hidden" name="keyword" value="${cri.keyword }">
				</form>
			<!-- 댓글 Area -->
				<c:if test="${not empty memberid}">
					<div class="addreply">
						<div class="card">
							<form method="post"
								action="${pageContext.request.contextPath}/replyboard/insert">
								<div class="card-body addaddreply contenttextarea">
									<textarea rows="3" cols="100" class="col-xl-12" name="replyContent"
										class="replyContent" placeholder="솔직하고 따듯한 댓글을 남겨주세요."></textarea>
									<button class="submitreply" type="button"
										onclick="submitreplyHandler()">댓글 작성
									</button>
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
</div>
<script>
let form = $("#infoForm");
/* ---------- 리스트로 ---------- */
$("#btn-board-list").on("click", function(e){
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
var liked = false;

function fetchLikeStatus() {
    $.ajax({
        type: 'GET',
        url: '${pageContext.request.contextPath}/board/getLikeStatus',
        data: { 'bno': bno, 'mid': mid },
        dataType: 'json',
        success: function (likeCheck) {
            liked = likeCheck === 0;
            updateButtonDisplay();
        }
    });
}

function updateButtonDisplay() {
    if (liked) {
        $('#btn-board-like').show();
        $('#btn-board-dislike').hide();
    } else {
        $('#btn-board-dislike').show();
        $('#btn-board-like').hide();
    }
}

$(document).ready(function () {
    fetchLikeStatus();
});

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
            liked = likeCheck === 0;
            updateButtonDisplay(); // 버튼 상태 업데이트
            location.reload();
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
                    if (result[i].memberId === "${bvo.mid}") {
                   	htmlVal += 			'<div class="updatewriter">' + result[i].memberId + '<span style="color: #888; font-size: 10px;">&nbsp;&nbsp;작성자</span>' + '</div>'}
                    else {
                   	htmlVal += 			'<div class="updatewriter">' + result[i].memberId + '</div>'}
                    htmlVal += 			'<div cla ss="updatereplyContent">' + result[i].replyContent + '</div>' 
                    htmlVal += 			'<div class="updatereplyDate">' + result[i].replyDate + '</div>' 
                    htmlVal += 			'<div class="groupbtn">' 
                   	htmlVal += 				'<button class="updatereply">수정</button>' 
                	htmlVal += 				'<button class ="deletereply deletereply-button" onclick="deletereplyHandler(\'' + result[i].replyNo + '\');">삭제</button>' 
                 	htmlVal += 				'<button class="insertreplyreply">댓글</button>'
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
                        if (result[i].memberId === "${bvo.mid}") {
                        	htmlVal += 			'<div class="updatewriter">↳' + result[i].memberId + '<span style="color: #888; font-size: 10px;">&nbsp;&nbsp;작성자</span>' + '</div>'
                        } else {
                        	htmlVal += 			'<div class="updatewriter">↳' + result[i].memberId + '</div>'		
                        }
                        htmlVal += '<div class="updatereplyContent">' + result[i].replyContent + '</div>'
                        htmlVal += '<div class="updatereplyDate">' + result[i].replyDate + '</div>'
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
                if (result[i].memberId === "${bvo.mid}") {
                	htmlVal += 			'<div class="updatewriter">' + result[i].memberId + '<span style="color: #888; font-size: 10px;">&nbsp;&nbsp;작성자</span>' + '</div>'
                } else {
                	htmlVal += 			'<div class="updatewriter">' + result[i].memberId + '</div>'		
                }               
                htmlVal += '<div class="updatereplyContent">' + result[i].replyContent + '</div>'
                htmlVal += '<div class="updatereplyDate">' + result[i].replyDate + '</div>'
                htmlVal += '</div>'
                htmlVal += '<div class="groupbtn">'
                htmlVal += '<button class="updatereply">수정</button>'
                htmlVal += '<button onclick="deletereplyHandler(' + result[i].replyNo + ');">삭제</button>'
                htmlVal += '<button class="insertreply">댓글</button>'
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
        addreplyreply += 		'<div>↳${memberid}</div>'
        addreplyreply += 		'<div>'
        addreplyreply += 			'<textarea id="rereplyContent" rows="3" class="col-xl-12 replyContent" name="replyreplyContent"></textarea>' //@' + replyreplywriter + " " + '
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
                            var htmlVal =  '<div class="firstReply card" style="padding-left:' + replyreplyleftpadding + 'px" data-replyno="' + result[i].replyNo + '" data-writer="' + result[i].memberId + '">'
                            if (result[i].memberId === "${bvo.mid}") {
                            	htmlVal += '<div class="updatewriter">' + result[i].memberId + '<span style="color: #888; font-size: 10px;">&nbsp;&nbsp;작성자</span>' + '</div>'
                            } else {
                            	htmlVal += '<div class="updatewriter">' + result[i].memberId + '</div>'		
                            }               
                            htmlVal += '<div class="updatereplyContent">' + result[i].replyContent + '</div>'
                            htmlVal += '<div class "updatereplyDate">' + result[i].replyDate + '</div>'
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
	<!-- 모달 창 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" id="closeBtn" data-dismiss="modal"
				onclick="removeBackdrop()">&times;</span> <select id="reasonSelect">
				<option value="1">스팸홍보/도배글입니다.</option>
				<option value="2">음란물입니다.</option>
				<option value="3">불법정보를 포함하고 있습니다.</option>
				<option value="4">개인정보 노출 게시물입니다.</option>
				<option value="5">욕설/혐오/차별적 표현입니다.</option>
				<option value="6">불쾌한 표현이 있습니다.</option>
				<option value="7">기타</option>
			</select>
			<textarea id="description" placeholder="사유를 입력해주세요"
				style="width: 100%; max-width: 400px; height: 100px; padding: 5px; font-size: 14px; margin-top: 10px;"></textarea>

			<button id="submitBtn">신고</button>
		</div>
	</div>

	<script>
	function report(bno, rid) {
		console.log(bno, rid);
		// 모달 창 열기
		$('#myModal').modal('show');
		// 모달 뒤 배경 생성
	    $('<div class="modal-backdrop"></div>').appendTo('body');
		
	 	// "신고" 버튼 활성화 여부를 감시하고 업데이트
        $("#reasonSelect").change(function() {
            var selectedCategory = $("#reasonSelect").val();
            // 1~7 중 하나를 선택한 경우 버튼 활성화, 그 외에는 비활성화
        });
	 	
     	// 모달 창 내 "신고" 버튼 클릭 시 AJAX 요청을 보내기
        $("#submitBtn").off("click").on("click", function() {
			var selectedCategory = $("#reasonSelect").val();
			var description = $("#description").val();
			console.log(JSON.stringify({
			    bno: bno,
			    rid: rid,
			    rCategory: selectedCategory,
			    rContent: description
			}));
            
			$.ajax({
			    url: "${pageContext.request.contextPath}/board/declarationWait",
			    type: "POST",
			    data: JSON.stringify ({
			        bno: bno, // 게시물 번호
			        rid: rid, // 작성자 ID
			        rcategory: selectedCategory,
			        rcontent: description
			    }),
			    contentType: "application/json",
			    success: function (data) {
			    	if(data === "success") {
			    		alert("신고가 접수되었습니다.");
			    		 $('#myModal').modal('hide');
			    	} else if(data === "fail") {
			        	alert("이미 신고하셨습니다.");
			            $('#myModal').modal('hide');
			        } else {
			        	alert("본인 게시글은 신고할 수 없습니다.");
			            $('#myModal').modal('hide');
			        }
			    },
			    error: function (xhr, textStatus, errorThrown) {
			        if (xhr.status === 401) {
			            // HTTP 상태 코드가 401인 경우, 로그인이 필요한 경우 처리
			            alert("로그인 후에 이용해주세요.");
			            window.location.href = "${pageContext.request.contextPath}/login/";
			        } else {
			            // 그 외의 오류인 경우 처리
			        	alert("서버 오류입니다.");
			            $('#myModal').modal('hide');
			        }
			    }
			});
	    });
	}
	
	// 초기화 함수 정의
	function resetModal() {
	    // 모달 창 내 필드 초기화 (예: 내용 지우기)
	    $("#description").val("");
	    // 모달 창을 닫음
	    $('#myModal').modal('hide');
	}
	
    window.onclick = function(event) {
    	if (event.target == $('#myModal')[0]) {
  		  $('#myModal').modal('hide'); // 모달 창 닫기
  	  }
	}

	function removeBackdrop() {
		$('.modal-backdrop').remove();
	}
	</script>
	
<div class="wrap footer">
	<jsp:include page="/WEB-INF/view/member/footer.jsp"></jsp:include>
</div>
</body>
<style>
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	border: 1px solid #ccc;
}
</style>
</html>