<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 작성</title>
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/favicon.ico">
<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

.jobkorea-header {
	background-color: #007bff;
	color: #fff;
	padding: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 50%;
	margin: 0 auto;
}

.jobkorea-logo a {
	color: #fff;
	font-weight: bold;
	text-decoration: none;
	font-size: 24px;
}

.logoimg {
	height: 40px;
	width: 120px;
}

.readSumWrap {
	width: 50%;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.h1, .c_header {
	display: flex;
	justify-content: center;
	align-items: center;
}

#dynamicHeader span:not(:last-child)::after {
	content: "\00a0"; /* Non-breaking space character */
}

/* 띄어쓰기 문자의 색상 변경 */
#dynamicHeader span {
	color: #007bff;
}

.img_table {
	width: 150px;
	height: 170px;
	float: left;
	margin-right: 20px;
	border: 2px solid black;
	text-align: center;
}

.name_table {
	text-align: center;
	width: 350px;
	height: 100px;
	float: left;
	border-top: 3px solid black;
	border-bottom: 2px solid lightgray;
	border-left: 2px solid lightgray;
	border-right: 2px solid lightgray;
	border-collapse: collapse;
}

.name_table th.name_th {
	width: 100px;
	height: 40px;
	border-right: 2px solid lightgray;
	border-bottom: 1px solid lightgray;
	background-color: #c8c8c8;
}

.name_table td.name_td {
	border-bottom: 1px solid lightgray;
}

.c_section {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.content_table {
	text-align: center;
	width: 530px;
	height: 100px;
	border-top: 3px solid black;
	border-bottom: 2px solid lightgray;
	border-left: 2px solid lightgray;
	border-right: 2px solid lightgray;
	border-collapse: collapse;
}

.content_table th.c_th {
	width: 150px;
	height: 40px;
	border-right: 2px solid lightgray;
	border-bottom: 1px solid lightgray;
	background-color: #c8c8c8;
}

.content_table td.c_td {
	width: 150px;
	height: 40px;
	border-right: 2px solid lightgray;
	border-bottom: 1px solid lightgray;
}

#passButton, #failButton {
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin: 0 auto;
	margin-top: 10px;
	padding: 10px 0;
	width: 5%;
	box-sizing: border-box;
}

#passButton:hover, #failButton:hover {
	background-color: #005b8a;
}
</style>
<script>
	function searchAddress_daumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				// var sido = data.sido; // 시도 항목 변수
				// var sigungu = data.sigungu; // 시군구 항목 변수
				// var bname = data.bname; // 법정동 항목 변수
				var sido_sigungu_bname = ''; // 시도_시군구_법정동 항목 변수

				// 시도/시군구/법정동 데이터를 해당 필드에 넣는다.
				//document.getElementById("sido").value = data.sido;
				//document.getElementById("sigungu").value = data.sigungu;
				//document.getElementById("bname").value = data.bname;
				document.getElementById("sido_sigungu_bname").value = data.sido + " " + data.sigungu + " " + data.bname;

			}
		}).open();
	}
</script>
</head>
<body>
	<header class="jobkorea-header">
		<div class="jobkorea-logo">
			<a href="<%=request.getContextPath()%>/index">
				<img src="<%=request.getContextPath()%>/resources/images/짭코리아3.png"
					alt="JJAPKOREA" class="logoimg">
			</a>
		</div>
	</header>
	<div class="readSumWrap clear">
		<br> <br>
		<form id="formTest">
			<c:forEach items="${findPersonByResumeId}" var="resume">
				<h1 class="h1" id="dynamicHeader">&nbsp;&nbsp;&nbsp;님&nbsp;의&nbsp;&nbsp;&nbsp;이&nbsp;력&nbsp;서</h1>
				<script>
					const name = "${resume.PNAME}";

					// 헤더 요소 선택
					const header = document.getElementById("dynamicHeader");

					// 이름을 한 글자씩 분리하고 각 글자를 <span> 요소로 감싸서 추가
					for (let i = 0; i < name.length; i++) {
						const span = document.createElement("span");
						span.textContent = name[i];
						header.insertBefore(span, header.lastChild);
					}
				</script>
				<input type="text" name="title"
					style="display: block; margin: 0 auto; border: none; background: transparent; width: 500px; height: 50px; font-size: larger; font-weight: bold;"
					value="${resume.TITLE}" required>
				<br>
				<header class="c_header">
					<div class="img">
						<table class="img_table" id="img_table">
							<tr>
								<td colspan="4" style="text-align: center; position: relative;">
									<div id="imagePreviewContainer"
										style="position: relative; max-height: 170px; overflow: hidden;">
										<!-- 이미지 미리보기 -->
										<img id="imagePreview" style="max-width: 100%; height: auto;"
											src="${findImageUrl}">
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="name">
						<table class="name_table">
							<tr>
								<th class="name_th">이름</th>
								<td class="name_td"><input type="text" name="name"
										style="border: none; background: transparent; width: 80%; height: 80%;"
										value="${resume.PNAME}"></td>
							</tr>

							<tr>
								<th class="name_th">휴대폰 번호</th>
								<td class="name_td"><input type="text" name="phone"
										style="border: none; background: transparent; width: 80%; height: 80%;"
										value="${resume.PPHONE}"></td>
							</tr>

							<tr>
								<th class="name_th">주소</th>
								<td class="name_td"><input type="text"
										id="sido_sigungu_bname" name="address"
										style="border: none; background: transparent; width: 80%; height: 80%;"
										onclick="searchAddress_daumPostcode()"
										value="${resume.ADDRESS}"></td>
							</tr>

							<tr>
								<th class="name_th">이메일</th>
								<td class="name_td"><input type="text" name="email"
										style="border: none; background: transparent; width: 80%; height: 80%;"
										value="${resume.PEMAIL}"></td>
							</tr>
						</table>
					</div>
				</header>
				<br>

				<section class="c_section">
					<div>
						<label style="font-size: large; font-weight: bold;">자격증</label>
						<table class="content_table" id="qualificationsTable1">
							<thead>
								<tr>
									<th class="c_th">자격면허<input type="hidden"
											name="qualificationName"></th>
									<th class="c_th">취득일<input type="hidden"
											name="qualificationDate"></th>
									<th class="c_th">발급기관<input type="hidden"
											name="qualificationAuthority"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${getResumeWithQualification}">
									<tr>
										<td class="c_td"><input type="text"
												name="qualificationName"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 1)"
												value="${item.QUALIFICATION_NAME}"></td>
										<td class="c_td"><input type="text"
												name="qualificationDate"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 1)"
												value="${item.QUALIFICATION_DATE}"></td>
										<td class="c_td"><input type="text"
												name="qualificationAuthority"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 1)"
												value="${item.QUALIFICATION_AUTHORITY}"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br>
					<div>
						<label style="font-size: large; font-weight: bold;">학력</label>
						<table class="content_table" id="qualificationsTable2">
							<thead>
								<tr>
									<th class="c_th">재학기간<input type="hidden"
											name="educationPeriod"></th>
									<th class="c_th">학교명<input type="hidden" name="schoolName"></th>
									<th class="c_th">전공<input type="hidden" name="major"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${getResumeWithEducation}">
									<tr>
										<td class="c_td"><input type="text"
												name="educationPeriod"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 2)"
												value="${item.EDUCATION_PERIOD}"></td>
										<td class="c_td"><input type="text" name="schoolName"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 2)"
												value="${item.SCHOOL_NAME}"></td>
										<td class="c_td"><input type="text" name="major"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 2)" value="${item.MAJOR}"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br>

					<div>
						<label style="font-size: large; font-weight: bold;">경력</label>
						<table class="content_table" id="qualificationsTable3">
							<thead>
								<tr>
									<th class="c_th">기간<input type="hidden" name="workPeriod"></th>
									<th class="c_th">기관 및 장소<input type="hidden"
											name="workPlace"></th>
									<th class="c_th">상세 내용<input type="hidden"
											name="workDetails"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${getResumeWithExperience}">
									<tr>
										<td class="c_td"><input type="text" name="workPeriod"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 3)"
												value="${item.WORK_PERIOD}"></td>
										<td class="c_td"><input type="text" name="workPlace"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 3)" value="${item.WORK_PLACE}"></td>
										<td class="c_td"><input type="text" name="workDetails"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 3)"
												value="${item.WORK_DETAILS}"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br>

					<div>
						<label style="font-size: large; font-weight: bold;">수상내역 /
							공모전</label>
						<table class="content_table" id="qualificationsTable4">
							<thead>
								<tr>
									<th class="c_th">수상명<input type="hidden" name="awardName"></th>
									<th class="c_th">수여기관<input type="hidden"
											name="awardingAuthority"></th>
									<th class="c_th">수상일자<input type="hidden" name="awardDate"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${getResumeWithAward}">
									<tr>
										<td class="c_td"><input type="text" name="awardName"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 4)" value="${item.AWARD_NAME}"></td>
										<td class="c_td"><input type="text"
												name="awardingAuthority"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 4)"
												value="${item.AWARDING_AUTHORITY}"></td>
										<td class="c_td"><input type="text" name="awardDate"
												style="border: none; background: transparent; width: 80%; height: 80%;"
												oninput="checkAndAddRow(this, 4)" value="${item.AWARD_DATE}"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br>
					<div
						style="display: flex; flex-direction: column; align-items: center;">
						<label
							style="font-size: large; font-weight: bold; align-self: flex-start;">자기소개서</label>
						<textarea name="selfintroduction"
							style="border: 2px solid black; background: transparent; width: 530px; height: 530px; resize: none;">${resume.SELFINTRODUCTION}</textarea>
					</div>
				</section>
				<br>
				<br>
			</c:forEach>
		</form>
	</div>
	<br>
	<br>
	<div style="text-align: center;">
		<c:forEach items="${findPersonByResumeId}" var="resume">
			<button id="passButton"
				style="display: inline-block; margin-right: 10px;"
				onclick="pass('${resume.RESUME_ID}', '${jid}')">서류 합격</button>
			<button id="failButton" style="display: inline-block;"
				onclick="fail('${resume.RESUME_ID}', '${jid}')">서류 불합격</button>
		</c:forEach>
	</div>
	<br>
	<br>
	<script>
		function pass(resumeId, jid) {
			$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/business/apply/info',
			data : {
			resumeId : resumeId,
			jid : jid,
			passOrFail : '합격'
			},
			success : function(data) {
				alert("지원자에게 합격 통지가 완료되었습니다.");
			},
			error : function(xhr, status, error) {
				var errorMessage = "클라이언트에서 오류 발생: " + error;
				alert(errorMessage);
			}
			});
		};

		function fail(resumeId, jid) {
			$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/business/apply/info',
			data : {
			resumeId : resumeId,
			jid : jid,
			passOrFail : '불합격'
			},
			success : function(data) {
				alert("지원자에게 불합격 통지가 완료되었습니다.");
			},
			error : function(xhr, status, error) {
				var errorMessage = "클라이언트에서 오류 발생: " + error;
				alert(errorMessage);
			}
			});
		};
	</script>
</body>
</html>