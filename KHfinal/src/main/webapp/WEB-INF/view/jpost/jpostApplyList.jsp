<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입사지원 현황</title>
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/favicon.ico">
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', Arial, sans-serif;
	background-color: #f5f5f5;
	margin-top: 145px;
	padding: 0;
}

.jjapkorea-header {
	background-color: #007bff;
	color: #fff;
	padding: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 50%;
	margin: 0 auto;
}

.jjapkorea-logo a {
	color: #fff;
	font-weight: bold;
	text-decoration: none;
	font-size: 24px;
}

.logoimg {
	height: 40px;
	width: 140px;
}

.readSumWrap {
	position: relative;
	width: 50%;
	height: 464px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

ul.apply-list {
	padding: 0;
	list-style-type: none;
}

ul.apply-list li {
	margin-bottom: 20px;
}

.apply-box {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid #ADADAD;
	padding-bottom: 20px;
}

.title {
	text-decoration: none;
	color: #000;
	cursor: pointer;
}

.pagination {
	position: absolute;
	bottom: 30px;
	left: 0;
	right: 0;
	text-align: center;
}

.pagination a {
	text-decoration: none;
	color: #000;
	margin: 0 10px;
}

.pagination span {
	margin: 0 10px;
}
</style>
</head>
<body>
	<header class="jjapkorea-header">
		<div class="jjapkorea-logo">
			<a href="<%=request.getContextPath()%>/index">
				<img src="<%=request.getContextPath()%>/resources/images/짭코리아3.png"
					alt="JJAPKOREA" class="logoimg">
			</a>
		</div>
	</header>
	<section>
		<div class="readSumWrap clear">
			<div>
				<ul class="apply-list">
					<c:set var="startIndex"
						value="${(pagination.currentPage - 1) * pagination.itemsPerPage}" />
					<c:set var="endIndex"
						value="${startIndex + pagination.itemsPerPage}" />
					<c:forEach var="item" items="${applyListAll}" varStatus="loop">
						<c:if test="${loop.index >= startIndex && loop.index < endIndex}">
							<li>
								<div class="apply-box">
									<div class="title" onclick="info('${item.RESUME_ID}')">${item.TITLE}</div>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="pagination">
				<c:if test="${pagination.totalPages > 0}">
					<c:if test="${pagination.currentPage > 1}">
						<c:if test="${pagination.currentPage > 2}">
							<a href="?page=1&itemsPerPage=${pagination.itemsPerPage}">처음</a>
						</c:if>
						<a
							href="?page=${pagination.currentPage - 1}&itemsPerPage=${pagination.itemsPerPage}">이전</a>
					</c:if>

					<c:choose>
						<c:when test="${pagination.totalPages < 6}">
							<c:forEach var="i" begin="1" end="${pagination.totalPages}">
								<c:choose>
									<c:when test="${i eq pagination.currentPage}">
										<span class="current-page">${i}</span>
									</c:when>
									<c:otherwise>
										<a href="?page=${i}&itemsPerPage=${pagination.itemsPerPage}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${pagination.currentPage < 3}">
									<c:forEach var="i" begin="1" end="5">
										<c:choose>
											<c:when test="${i eq pagination.currentPage}">
												<span class="current-page">${i}</span>
											</c:when>
											<c:otherwise>
												<a href="?page=${i}&itemsPerPage=${pagination.itemsPerPage}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:when
									test="${pagination.currentPage > pagination.totalPages - 3}">
									<c:forEach var="i" begin="${pagination.totalPages - 4}"
										end="${pagination.totalPages}">
										<c:choose>
											<c:when test="${i eq pagination.currentPage}">
												<span class="current-page">${i}</span>
											</c:when>
											<c:otherwise>
												<a href="?page=${i}&itemsPerPage=${pagination.itemsPerPage}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="${pagination.currentPage - 2}"
										end="${pagination.currentPage + 2}">
										<c:choose>
											<c:when test="${i eq pagination.currentPage}">
												<span class="current-page">${i}</span>
											</c:when>
											<c:otherwise>
												<a href="?page=${i}&itemsPerPage=${pagination.itemsPerPage}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>

					<c:if test="${pagination.currentPage < pagination.totalPages}">
						<a
							href="?page=${pagination.currentPage + 1}&itemsPerPage=${pagination.itemsPerPage}">다음</a>
						<c:if test="${pagination.currentPage < pagination.totalPages - 1}">
							<a
								href="?page=${pagination.totalPages}&itemsPerPage=${pagination.itemsPerPage}">마지막</a>
						</c:if>
					</c:if>
				</c:if>
			</div>
		</div>
	</section>
	<script>
		function info(resumeId) {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/business/apply/list',
				data : {
					resumeId : resumeId
				},
				success : function(data) {
					var resumeList = data.resumeList;
		            var getResumeWithQualification = data.getResumeWithQualification;
		            var getResumeWithEducation = data.getResumeWithEducation;
		            var getResumeWithExperience = data.getResumeWithExperience;
		            var getResumeWithAward = data.getResumeWithAward;

					// 모달 창 열기
					$('#myModal').modal('show');
					// 모달 뒤 배경 생성
				    $('<div class="modal-backdrop"></div>').appendTo('body');
				},
				error: function(xhr, status, error) {
		           var errorMessage = "클라이언트에서 오류 발생: " + error;
		           alert(errorMessage);
		       }
			});
		};
		
		function removeBackdrop() {
		    $('.modal-backdrop').remove();
		}
	</script>
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">${selectOnePerson.pname} 님의 이력서</h4>
	        <button type="button" class="close" data-dismiss="modal" onclick="removeBackdrop()">&times;</button>
	      </div>
	      <div class="modal-body">
	      	<form id="formTest">
				<c:forEach items="${resumeList}" var="resume">
					<input type="text" name="title"
						style="display: block; margin: 0 auto; border: none; background: transparent; width: 500px; height: 50px; font-size: larger; font-weight: bold;"
						value="${resume.title}" required>
					<br>
					<header class="c_header">
						<div class="img">
							<table class="img_table" id="img_table">
								<tr>
									<td colspan="4" style="text-align: center; position: relative;">
										<div id="imagePreviewContainer"
											style="position: relative; max-height: 170px; overflow: hidden;">
											<div id="uploadImage">사진</div>
											<!-- 이미지 미리보기 -->
											<img id="imagePreview" style="max-width: 100%; height: auto;"
												src="${resume.imageUrl}">
											<!-- 이미지 업로드 버튼 -->
											<button id="imageUploadButton"
												style="position: absolute; bottom: 0; left: 0; width: 100%; display: none;">이미지
												업로드</button>
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
					<br><br>
					<div style="text-align: center;">
						<button id="registerButton">수정</button>
					</div>
				</c:forEach>
			</form>
	      </div>
	      <div class="modal-footer">
	      </div>
	    </div>
	  </div>
	</div>
</body>
<style>
	.modal {
		display: none;
	    position: fixed; /* 모달 위치 고정 */
	    top: 50%; /* 화면 상단에서 50% 떨어진 위치로 설정 */
	    left: 50%; /* 화면 왼쪽에서 50% 떨어진 위치로 설정 */
	    transform: translate(-50%, -50%); /* 모달을 가운데 정렬 */
	    width: 30%;
	    margin: 0 auto;
	    padding: 20px;
	    background-color: #f5f5f5;
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	    z-index: 1000; /* 다른 요소 위에 모달 표시 */
	    text-align: center;
	}
	
	/* 모달 뒷 배경 */
	.modal-backdrop {
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background: rgba(0, 0, 0, 0.5); /* 배경 어두움 정도 설정 */
	    z-index: 1;
	}
	
	.modal-header {
	    position: relative;
	}
	
	.modal-title {
	    text-align: left;
	}
	
	.close {
	    position: absolute;
	    top: 0;
	    right: 0;
	    cursor: pointer;
	}
	
	.modal-body {
	    text-align: left;
	    margin-top: 20px; /* 위쪽 여백 추가 */
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
	
	.modal-footer {
	    text-align: right; /* 모달 하단 오른쪽 정렬 */
	    margin-top: 20px; /* 위쪽 여백 추가 */
	}
</style>
</html>