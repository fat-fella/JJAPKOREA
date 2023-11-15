<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짭코리아 취업공고</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_jpostupload.css">
<script src="//cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
<style>
.jpostsubmitbtn{
	display: flex;
	align-items: center;
	margin:0;
}
.btn_submit, .btn_cancel{
	margin: 0;
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<a href="<%=request.getContextPath()%>/index" class="logo linkLogo"> <img
				src="<%=request.getContextPath()%>/resources/images/짭코리아3.png"
				alt="JJAPKOREA" class="logoimg"></a>
			<div class="links">
				<a href="<%=request.getContextPath()%>/index" class="link linkHome">기업회원 홈</a>
				<a href="<%=request.getContextPath()%>/business/jobpostingupload/list" class="link linkManage">채용공고 관리</a>
			</div>
		</div>
	</header>
	<form action="../jobpostingupload/edit" method="POST"
		id="jpostform">
		<div class="jposthead">
		<input type="hidden" name="mid" value="${mid}">
		<input type="hidden" name="jid" value="${jobPosting.JID}">
			<h2>채용공고 수정</h2>
			<h6>양식에 맞게 채용공고를 수정해주세요.</h6>
		</div>
		<div class="jpostcontent">
			<fieldset class="jpostfieldset">
				<div class="retitleinputBox">
					<label for="reTitle">채용제목 <span>*</span></label> <input type="text"
						id="reTitle" name="reTitle" value="${jobPosting.RE_TITLE}" required>
				</div>
				<div class="recruitfieldinputBox">
					<label for="firstRecruitField">채용분야 분류<span>*</span></label> <select
						name="firstRecruitField" id="firstRecruitField"
						onchange="loadOptions()" required>
						<option>선택해주세요</option>
						<option value="0">경영·사무·금융·보험직</option>
						<option value="1">연구직 및 공학 기술직</option>
						<option value="2">교육·법률·사회복지·경찰·소방직 및 군인</option>
						<option value="3">보건·의료직</option>
						<option value="4">예술·디자인·방송·스포츠직</option>
						<option value="5">미용·여행·숙박·음식·경비·청소직</option>
						<option value="6">영업·판매·운전·운송직</option>
						<option value="7">건설·채굴직</option>
						<option value="8">설치·정비·생산직</option>
						<option value="9">농림어업직</option>
					</select> <label style="font-size: 12px; color: red;">1차 세부채용분야<span>*</span></label>
					<select name="secondRecruitField" id="secondRecruitField"
						onchange="loadSecondOptions()">
						<option>선택해주세요</option>
					</select> <label style="font-size: 12px; color: red;">2차 세부채용분야<span>*</span></label>
					<select name="thirdRecruitField" id="thirdRecruitField"
						onchange="loadThirdOptions()">
						<option>선택해주세요</option>
					</select> <label style="font-size: 12px; color: red;">3차 세부채용분야<span>*</span></label>
					<select name="recruitField" id="recruitField">
						<option>선택해주세요</option>
					</select>
				</div>
				<h4>모집조건</h4>
				<div class="usereducationinputBox">
					<label for="userEducation">필요학력 <span>*</span></label> <select
						name="userEducation" id="userEducation">
						<option value="학력무관">학력무관</option>
						<option value="고등학교졸업">고등학교졸업</option>
						<option value="대학원 박사졸업">대학원 박사졸업</option>
						<option value="대학원 학사졸업">대학원 학사졸업</option>
						<option value="대학졸업(2,3년)</">대학졸업(2,3년)</option>
						<option value="대학졸업(4년)">대학졸업(4년)</option>
					</select>
				</div>
				<div class="careerinputBox">
					<label for="career">경력요구사항 <span>*</span></label> <input
						type="text" id="career" name="career" value="${jobPosting.CAREER}" required>
				</div>
				<h4>근무조건</h4>
				<div class="worktypeinputBox">
					<label for="workType">근무형태 <span>*</span></label> <input
						type="text" id="workType" name="workType"  value="${jobPosting.WORK_TYPE}"required>
				</div>
				<div class="salaryinputBox">
					<label for="salary">연봉 <span>*</span></label> <input type="text"
						id="salary" name="salary"  value="${jobPosting.SALARY}"required>
				</div>
				<div class="minsalaryinputBox">
					<label for="minSalary">최소연봉 <span>*</span></label> <input
						type="text" id="minSalary" name="minSalary" value="${jobPosting.MIN_SALARY}" required>
				</div>
				<div class="maxsalaryinputBox">
					<label for="maxSalary">최대연봉 <span>*</span></label> <input
						type="text" id="maxSalary" name="maxSalary"  value="${jobPosting.MAX_SALARY}" required>
				</div>
				<div id="jobpostingdetails">
					<h4>상세정보</h4>
					<textarea name="jpostdetail" id="jpostdetail" value="${jobPosting.RE_TITLE}"></textarea>
					
				</div>
			</fieldset>
			<div class="jpostdateset">
				<label for="regDate">채용공고 등록일</label> <input type="date"
					id="registDate" name="registDate"> <label for="closeDate">채용공고
					마감일</label> <input type="date" id="closeDate" name="closeDate">
			</div>
			<div class="jpostsubmitbtn">
				<button type="submit" class="btn_submit">수정</button>
				<button type="button" class="btn_cancel" onclick="cancel()">취소</button>
			</div>
		</div>
	</form>
	<script>
		function cancel(){
			window.location.href="${pageContext.request.contextPath}/business/jobpostingupload/list"
		}
	</script>

	<!-- ckeditor 생성 -->
<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
			CKEDITOR.replace('jpostdetail',
			{filebrowserUploadUrl:'<%=request.getContextPath()%>/image/upload'
			});
			
			
			   $(".btn_submit").click(function(){
				      $("#jpostdetail").val(CKEDITOR.instances.jpostdetail.getData());
				      document.getElementById("jpostform").submit();
				   });
			
			
			
		</script>












	<script>
		function loadOptions() {
			var firstRecruitField = document
					.getElementById("firstRecruitField");
			var secondRecruitField = document
					.getElementById("secondRecruitField");
			var selectedOption = firstRecruitField.options[firstRecruitField.selectedIndex].value;
			if (selectedOption == "선택해주세요") {
				return;
			}
			$
					.ajax({
						url : "${pageContext.request.contextPath}/business/jobpostingupload/getSecondRecruitField",
						method : "POST",
						data : {
							selectedOption : selectedOption
						},
						dataType : "json",
						success : function(response) {
							console.log(response)
							secondRecruitField.innerHTML = "";

							for (var i = 0; i < response.length; i++) {
								var option = document.createElement("option");
								option.text = response[i].jobsmcat;
								option.value = response[i].jobsmcd;
								secondRecruitField.appendChild(option);
							}
						},
						error : function(xhr, status, error) {
							console.error("Error: " + error);
						}
					});

		}
		function loadSecondOptions() {
			var secondRecruitField = document
					.getElementById("secondRecruitField");
			var thirdRecruitField = document
					.getElementById("thirdRecruitField");
			var selectedOption = secondRecruitField.options[secondRecruitField.selectedIndex].value;
			if (selectedOption == "선택해주세요") {
				return;
			}
			$
					.ajax({
						url : "${pageContext.request.contextPath}/business/jobpostingupload/getThirdRecruitField",
						method : "POST",
						data : {
							selectedOption : selectedOption
						},
						dataType : "json",
						success : function(response) {
							thirdRecruitField.innerHTML = "";

							for (var i = 0; i < response.length; i++) {
								var option = document.createElement("option");
								option.text = response[i].jobsscat;
								option.value = response[i].jobsscd;
								thirdRecruitField.appendChild(option);
							}
						},
						error : function(xhr, status, error) {
							console.error("Error: " + error);
						}
					});

		}
		function loadThirdOptions() {
			var thirdRecruitField = document
					.getElementById("thirdRecruitField");
			var recruitField = document.getElementById("recruitField");
			var selectedOption = thirdRecruitField.options[thirdRecruitField.selectedIndex].value;
			if (selectedOption == "선택해주세요") {
				return;
			}
			$
					.ajax({
						url : "${pageContext.request.contextPath}/business/jobpostingupload/getFourthRecruitField",
						method : "POST",
						data : {
							selectedOption : selectedOption
						},
						dataType : "json",
						success : function(response) {
							recruitField.innerHTML = "";

							for (var i = 0; i < response.length; i++) {
								var option = document.createElement("option");
								option.text = response[i].fieldTitle;
								option.value = response[i].recruitField;
								recruitField.appendChild(option);
							}
						},
						error : function(xhr, status, error) {
							console.error("Error: " + error);
						}
					});

		}
	</script>

</body>
</html>
