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
<!-- 카카오 API : 주소 검색 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.h1, .c_header {
	display: flex;
	justify-content: center;
	align-items: center;
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
	<h1 class="h1">이 력 서</h1>
	<c:choose>
		<c:when test="${empty resumeList}">
			<form action="<%=request.getContextPath()%>/person/resume/write"
				method="post">
				<input type="text" name="title"
					style="display: block; margin: 0 auto; border: none; background: transparent; width: 500px; height: 50px; font-size: larger; font-weight: bold;"
					placeholder="제목을 입력하세요." required>
				<br>
				<header class="c_header">
					<div class="img">
						<table class="img_table">
							<tr>
								<th colspan="4" id="uploadImage">사진</th>
							</tr>
						</table>
						<!-- 실제 파일 업로드를 위한 숨김 input -->
						<input type="file" id="imageInput" style="display: none;"
							accept="image/*">
						<script>
							// 사진을 클릭했을 때 input 엘리먼트를 클릭하는 함수
							document.getElementById('uploadImage')
									.addEventListener('click', function() {
										document.getElementById('imageInput')
												.click();
									});

							// input 엘리먼트의 값이 변경될 때 파일 업로드 이벤트 처리
							document
									.getElementById('imageInput')
									.addEventListener('change', function() {
										// 선택한 파일을 처리하거나 서버로 업로드할 수 있습니다.
										// 이 코드는 파일 선택 시 작동할 JavaScript 코드를 추가하는 부분입니다.
										var selectedFile = this.files[0];
										if (selectedFile) {
											// 파일을 선택했을 때의 동작을 정의할 수 있습니다.
											// 여기에 선택한 이미지 파일을 표시하거나 업로드하는 코드를 추가할 수 있습니다.
											// 예를 들어, 이미지 미리보기를 추가하려면 다음과 같이 처리할 수 있습니다.
											var imagePreview = document
													.getElementById('uploadImage');
											imagePreview.innerHTML = ''; // 이전 내용 지우기
											var image = document
													.createElement('img');
											image.src = URL
													.createObjectURL(selectedFile); // 이미지 미리보기 URL 설정
											image.style.maxWidth = '100%'; // 이미지 크기 조절
											image.style.height = 'auto';
											imagePreview.appendChild(image);
										}
									});
						</script>
					</div>
					<div class="name">
						<table class="name_table">
							<tr>
								<th class="name_th">이름</th>
								<td class="name_td"><input type="text" name="name"
										style="border: none; background: transparent; width: 80%; height: 80%;"
										value="${selectOnePerson.pname}"></td>
							</tr>

							<tr>
								<th class="name_th">휴대폰 번호</th>
								<td class="name_td"><input type="text" name="phone"
										style="border: none; background: transparent; width: 80%; height: 80%;"
										value="${selectOnePerson.pphone}"></td>
							</tr>

							<tr>
								<th class="name_th">주소</th>
								<td class="name_td"><input type="text"
										id="sido_sigungu_bname" name="address"
										style="border: none; background: transparent; width: 80%; height: 80%;"
										onclick="searchAddress_daumPostcode()"></td>
							</tr>

							<tr>
								<th class="name_th">이메일</th>
								<td class="name_td"><input type="text" name="email"
										style="border: none; background: transparent; width: 80%; height: 80%;"
										value="${selectOnePerson.pemail}"></td>
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
								<tr>
									<td class="c_td"><input type="text"
											name="qualificationName"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 1)"></td>
									<td class="c_td"><input type="text"
											name="qualificationDate"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 1)"></td>
									<td class="c_td"><input type="text"
											name="qualificationAuthority"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 1)"></td>
								</tr>
								<tr>
									<td class="c_td"><input type="text"
											name="qualificationName"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 1)"></td>
									<td class="c_td"><input type="text"
											name="qualificationDate"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 1)"></td>
									<td class="c_td"><input type="text"
											name="qualificationAuthority"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 1)"></td>
								</tr>
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
								<tr>
									<td class="c_td"><input type="text" name="educationPeriod"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 2)"></td>
									<td class="c_td"><input type="text" name="schoolName"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 2)"></td>
									<td class="c_td"><input type="text" name="major"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 2)"></td>
								</tr>
								<tr>
									<td class="c_td"><input type="text" name="educationPeriod"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 2)"></td>
									<td class="c_td"><input type="text" name="schoolName"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 2)"></td>
									<td class="c_td"><input type="text" name="major"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 2)"></td>
								</tr>
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
								<tr>
									<td class="c_td"><input type="text" name="workPeriod"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 3)"></td>
									<td class="c_td"><input type="text" name="workPlace"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 3)"></td>
									<td class="c_td"><input type="text" name="workDetails"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 3)"></td>
								</tr>
								<tr>
									<td class="c_td"><input type="text" name="workPeriod"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 3)"></td>
									<td class="c_td"><input type="text" name="workPlace"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 3)"></td>
									<td class="c_td"><input type="text" name="workDetails"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 3)"></td>
								</tr>
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
								<tr>
									<td class="c_td"><input type="text" name="awardName"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 4)"></td>
									<td class="c_td"><input type="text"
											name="awardingAuthority"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 4)"></td>
									<td class="c_td"><input type="text" name="awardDate"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 4)"></td>
								</tr>
								<tr>
									<td class="c_td"><input type="text" name="awardName"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 4)"></td>
									<td class="c_td"><input type="text"
											name="awardingAuthority"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 4)"></td>
									<td class="c_td"><input type="text" name="awardDate"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											oninput="checkAndAddRow(this, 4)"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					<div
						style="display: flex; flex-direction: column; align-items: center;">
						<label
							style="font-size: large; font-weight: bold; align-self: flex-start;">자기소개서</label>
						<textarea name="selfintroduction"
							style="border: 2px solid black; background: transparent; width: 530px; height: 530px; resize: none;"></textarea>
					</div>
				</section>
				<br>

				<div style="text-align: center;">
					<button id="registerButton">등록</button>
				</div>
			</form>
		</c:when>
		<c:otherwise>
			<form>
				<c:forEach items="${resumeList}" var="resume">
					<input type="text" name="title"
						style="display: block; margin: 0 auto; border: none; background: transparent; width: 500px; height: 50px; font-size: larger; font-weight: bold;"
						value="${resume.title}" required>
					<br>
					<header class="c_header">
						<div class="img">
							<table class="img_table">
								<tr>
									<th colspan="4" id="uploadImage">사진</th>
								</tr>
							</table>
							<!-- 실제 파일 업로드를 위한 숨김 input -->
							<input type="file" id="imageInput" style="display: none;"
								accept="image/*">
							<script>
								// 사진을 클릭했을 때 input 엘리먼트를 클릭하는 함수
								document
										.getElementById('uploadImage')
										.addEventListener('click', function() {
											document
													.getElementById('imageInput')
													.click();
										});

								// input 엘리먼트의 값이 변경될 때 파일 업로드 이벤트 처리
								document
										.getElementById('imageInput')
										.addEventListener('change', function() {
											// 선택한 파일을 처리하거나 서버로 업로드할 수 있습니다.
											// 이 코드는 파일 선택 시 작동할 JavaScript 코드를 추가하는 부분입니다.
											var selectedFile = this.files[0];
											if (selectedFile) {
												// 파일을 선택했을 때의 동작을 정의할 수 있습니다.
												// 여기에 선택한 이미지 파일을 표시하거나 업로드하는 코드를 추가할 수 있습니다.
												// 예를 들어, 이미지 미리보기를 추가하려면 다음과 같이 처리할 수 있습니다.
												var imagePreview = document
														.getElementById('uploadImage');
												imagePreview.innerHTML = ''; // 이전 내용 지우기
												var image = document
														.createElement('img');
												image.src = URL
														.createObjectURL(selectedFile); // 이미지 미리보기 URL 설정
												image.style.maxWidth = '100%'; // 이미지 크기 조절
												image.style.height = 'auto';
												imagePreview.appendChild(image);
											}
										});
							</script>
						</div>
						<div class="name">
							<table class="name_table">
								<tr>
									<th class="name_th">이름</th>
									<td class="name_td"><input type="text" name="name"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											value="${selectOnePerson.pname}"></td>
								</tr>

								<tr>
									<th class="name_th">휴대폰 번호</th>
									<td class="name_td"><input type="text" name="phone"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											value="${selectOnePerson.pphone}"></td>
								</tr>

								<tr>
									<th class="name_th">주소</th>
									<td class="name_td"><input type="text"
											id="sido_sigungu_bname" name="address"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											onclick="searchAddress_daumPostcode()"
											value="${resume.address}"></td>
								</tr>

								<tr>
									<th class="name_th">이메일</th>
									<td class="name_td"><input type="text" name="email"
											style="border: none; background: transparent; width: 80%; height: 80%;"
											value="${selectOnePerson.pemail}"></td>
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
										<th class="c_th">학교명<input type="hidden"
												name="schoolName"></th>
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
													oninput="checkAndAddRow(this, 3)"
													value="${item.WORK_PLACE}"></td>
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
							<label style="font-size: large; font-weight: bold;">수상내역
								/ 공모전</label>
							<table class="content_table" id="qualificationsTable4">
								<thead>
									<tr>
										<th class="c_th">수상명<input type="hidden" name="awardName"></th>
										<th class="c_th">수여기관<input type="hidden"
												name="awardingAuthority"></th>
										<th class="c_th">수상일자<input type="hidden"
												name="awardDate"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${getResumeWithAward}">
										<tr>
											<td class="c_td"><input type="text" name="awardName"
													style="border: none; background: transparent; width: 80%; height: 80%;"
													oninput="checkAndAddRow(this, 4)"
													value="${item.AWARD_NAME}"></td>
											<td class="c_td"><input type="text"
													name="awardingAuthority"
													style="border: none; background: transparent; width: 80%; height: 80%;"
													oninput="checkAndAddRow(this, 4)"
													value="${item.AWARDING_AUTHORITY}"></td>
											<td class="c_td"><input type="text" name="awardDate"
													style="border: none; background: transparent; width: 80%; height: 80%;"
													oninput="checkAndAddRow(this, 4)"
													value="${item.AWARD_DATE}"></td>
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
								style="border: 2px solid black; background: transparent; width: 530px; height: 530px; resize: none;">${resume.selfintroduction}</textarea>
						</div>
					</section>
					<br>
					<div style="text-align: center;">
						<button id="modifyButton">수정</button>
					</div>
				</c:forEach>
			</form>
		</c:otherwise>
	</c:choose>
	<script>
		function checkAndAddRow(inputField, tableNumber) {
			var tableId = 'qualificationsTable' + tableNumber;
			var allInputs = document
					.querySelectorAll('#' + tableId + ' input[type="text"]');
			var allFilled = true;
			allInputs.forEach(function(input) {
				if (input.value === '') {
					allFilled = false;
				}
			});

			if (allFilled) {
				// 입력 필드가 모두 값으로 채워지면 새로운 행을 추가
				addRow(inputField, tableNumber);
			}
		}

		function addRow(inputField, tableNumber) {
			var tableId = 'qualificationsTable' + tableNumber;
			var table = document.getElementById(tableId);

			if (inputField.value !== '') {
				var newRow = document.createElement('tr');
				var inputNameElements = table
						.querySelectorAll('thead input[name]');

				for (var i = 0; i < 3; i++) {
					var cell = document.createElement('td');
					cell.className = "c_td";
					var newInput = document.createElement("input");
					newInput.type = "text";
					newInput.style = "border: none; background: transparent; width: 80%; height: 80%;";
					newInput.name = inputNameElements[i].name;

					newInput.oninput = function() {
						checkAndAddRow(this, tableNumber);
					};
					cell.appendChild(newInput);
					newRow.appendChild(cell);
				}

				table.querySelector('tbody').appendChild(newRow);

				// 입력 필드가 포커스를 가지도록 함
				newRow.querySelector('input').focus();

				// 새로운 행에 대한 삭제 이벤트 핸들러 추가
				newRow.querySelectorAll('input[type="text"]')
						.forEach(function(input) {
							input.addEventListener('keydown', handleDelete);
						});
			}
		}

		// 삭제 이벤트 핸들러 함수
		function handleDelete(event) {
			if (event.key === "Backspace" && event.target.value === "") {
				// 백스페이스 키를 누르고 해당 입력 필드가 비어 있으면 행 삭제
				deleteRow(event.target.parentElement.parentElement);
			}
		}

		// 행을 삭제하는 함수
		function deleteRow(row) {
			var table = row.parentElement;
			var inputsInRow = row.querySelectorAll('input[type="text"]');

			// 해당 행의 모든 input 요소에 연결된 keydown 이벤트 리스너 제거
			inputsInRow.forEach(function(input) {
				input.removeEventListener('keydown', handleDelete);
			});

			table.removeChild(row);
		}

		// 각 행의 입력 필드에 keydown 이벤트 리스너 추가
		var rows = document.querySelectorAll('tr');
		rows.forEach(function(row) {
			var inputsInRow = row.querySelectorAll('input[type="text"]');
			inputsInRow.forEach(function(input) {
				input.addEventListener('keydown', handleDelete);
			});
		});

		for (var tableNumber = 1; tableNumber <= 4; tableNumber++) {
			(function(tableNumber) {
				var tableId = 'qualificationsTable' + tableNumber;
				var table = document.getElementById(tableId);
				var thead = table.querySelector('thead');
				var inputElements = thead.querySelectorAll('input[name]');

				thead
						.addEventListener('click', function() {
							// 기존 행이 있는지 확인
							var existingRows = table
									.querySelectorAll('tbody tr');

							if (existingRows.length === 0) {
								// 행이 없는 경우, 새로운 행을 생성하고 테이블에 추가
								var newRow = document.createElement('tr');

								for (var i = 0; i < inputElements.length; i++) {
									var cell = document.createElement('td');
									cell.className = 'c_td';
									var newInput = document
											.createElement('input');
									newInput.type = 'text';
									newInput.style = 'border: none; background: transparent; width: 80%; height: 80%;';
									newInput.name = inputElements[i].name;

									newInput.oninput = function() {
										checkAndAddRow(this, tableNumber);
									};
									cell.appendChild(newInput);
									newRow.appendChild(cell);

									// 삭제 이벤트 리스너 추가
									newInput
											.addEventListener('keydown', handleDelete);
								}

								// 새 행을 테이블의 tbody에 추가
								var tbody = table.querySelector('tbody');
								tbody.appendChild(newRow);
							}
						});
			})(tableNumber);
		}

		// 폼 제출 버튼 클릭 시 호출되는 함수
		var registerButton = document.getElementById("registerButton");

		if (registerButton) {
			registerButton.addEventListener("click", function(event) {
				// 모든 필수 필드가 비어 있지 않는 경우에만 폼 제출
				var isFormValid = true;

				for (var tableNumber = 1; tableNumber <= 4; tableNumber++) {
					var tableId = 'qualificationsTable' + tableNumber;
					var table = document.getElementById(tableId);
					var rows = table.querySelectorAll('tr');

					rows.forEach(function(row) {
						var inputsInRow = row
								.querySelectorAll('input[type="text"]');

						inputsInRow
								.forEach(function(input) {
									if (input.name && input.name
											.includes("Name") && input.value
											.trim() === "") {
										isFormValid = false;
									}
								});
					});
				}

				if (!isFormValid) {
					event.preventDefault(); // 폼 제출 중지
					alert("항목을 작성해주세요.");
				}
			});
		}
	</script>
</body>
</html>