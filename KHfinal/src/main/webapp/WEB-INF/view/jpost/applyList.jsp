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

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

.jjapkorea-menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.jjapkorea-menu li {
	display: inline;
	margin-right: 20px;
}

.jjapkorea-menu a {
	color: #fff;
	text-decoration: none;
	font-size: 16px;
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

h3 {
	border-bottom: 1px solid #ADADAD;
	padding-bottom: 30px;
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
}

.btn_ud {
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	box-sizing: border-box;
}

.btn_ud:hover {
	background-color: #0059B8;
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
		<div class="jjapkorea-menu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/person/resume/write"
						class="link">이력서 관리</a></li>
				<li>|</li>
				<li><a href="<%=request.getContextPath()%>/person/scrap"
						class="link">스크랩</a></li>
				<li>|</li>
				<li><a
						href="<%=request.getContextPath()%>/person/infoModifyPerson"
						class="link">개인정보 수정</a></li>
			</ul>
		</div>
	</header>
	<section>
		<div class="readSumWrap clear">
			<h3>
				<i style="color: #007bff;">${selectOnePerson.pname}</i>&nbsp;&nbsp;님의
				입사지원 현황입니다.
			</h3>
			<div>
				<ul class="apply-list">
					<c:set var="startIndex"
						value="${(pagination.currentPage - 1) * pagination.itemsPerPage}" />
					<c:set var="endIndex"
						value="${startIndex + pagination.itemsPerPage}" />
					<c:forEach var="item" items="${applyList}" varStatus="loop">
						<c:if test="${loop.index >= startIndex && loop.index < endIndex}">
							<li>
								<div class="apply-box">
									<a
										href="<c:url value='/jobpostinginfo'><c:param name='jid' value='${item.JID}'/>${item.RE_TITLE}</c:url>"
										class="title">${item.RE_TITLE}
										&nbsp;&nbsp;&nbsp;&nbsp;<i style="color: #007bff;"><b>D-${item.DDAY}</b></i>
									</a>
									<div>
										<button type="button" class="btn_ud"
											onclick="info('${item.JID}')">실시간 지원 현황</button>
										<button type="button" class="btn_ud"
											onclick="cancel('${item.JID}')">지원 취소</button>
									</div>
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
		function cancel(jid) {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/person/apply/list',
				data : {
					jid : jid
				},
				success : function() {
					alert("입사지원이 취소되었습니다.");
					window.location.href = "${pageContext.request.contextPath}/person/apply/list";
				},
				error : function() {
					alert("에러 혹은 다른 오류 발생");
				}
			});
		};
		
		var chart = null; // 차트 변수를 선언

		function createChart(data) {
		    if (chart) {
		        chart.destroy(); // 기존 차트 파괴
		    }

		    // 차트 데이터 생성
		    var ctx = document.getElementById('myChart').getContext('2d');
		    chart = new Chart(ctx, {
		        type: 'bar',
		        data: data,
		        options: {
		            scales: {
		            	x: {
		                    stacked: true // x 축에 막대를 누적
		                },
		                y: {
		                    beginAtZero: true
		                }
		            }
		        }
		    });
		}
		
		function info(jid) {
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/person/apply/info',
				data : {
					jid : jid
				},
				success : function(data) {
					var applyInfo = data.applyInfo;
					var qualificationAvg = data.qualificationAvg;
					var educationAvg = data.educationAvg;
					var experienceAvg = data.experienceAvg;
					
					// 모달 창 열기
					$('#myModal').modal('show');
					// 모달 뒤 배경 생성
				    $('<div class="modal-backdrop"></div>').appendTo('body');
					
				 	// 새로운 <span> 요소를 생성하여 applyInfo 및 qualificationAvg를 강조
		            var highlightedApplyInfo = $('<span class="highlighted-text"><i>' + applyInfo + '</i></span>');
		            var highlightedQualificationAvg = $('<span class="highlighted-text"><i>' + qualificationAvg + '</i></span');
		            var highlightedEducationAvg = $('<span class="highlighted-text"><i>' + educationAvg + '</i></span');
		            var highlightedExperienceAvg = $('<span class="highlighted-text"><i>' + experienceAvg + '</i></span');

		            var applyInfoText = '지원자 수는 ';
		            applyInfoText += highlightedApplyInfo.prop('outerHTML');
		            applyInfoText += ' 명입니다.';

		            var qualificationAvgText = '평균 자격증 개수는 ';
		            qualificationAvgText += highlightedQualificationAvg.prop('outerHTML');
		            qualificationAvgText += ' 개입니다.';
		            
		            var educationAvgText = '대졸 이상 지원자 수는 ';
		            educationAvgText += highlightedEducationAvg.prop('outerHTML');
		            educationAvgText += ' 명입니다.';
		            
		            var experienceAvgText = '경력직 지원자 수는 ';
		            experienceAvgText += highlightedExperienceAvg.prop('outerHTML');
		            experienceAvgText += ' 명입니다.';

		            // 요소에 HTML을 추가
		            $('#applyInfoElement').html(applyInfoText);
		            $('#qualificationAvgElement').html(qualificationAvgText);
		            $('#educationAvgElement').html(educationAvgText);
		            $('#experienceAvgElement').html(experienceAvgText);

		         	// 그래프 생성
		            createChart({
		                labels: ["지원 현황", "자격증", "학력", "경력"],
		                datasets: [
		                	{
		                        label: '지원 현황', // 데이터 세트 레이블
		                        data: [applyInfo, 0, 0, 0], // 지원 현황 데이터 설정
		                        backgroundColor: 'rgba(169, 169, 169, 0.2)',
		                        borderColor: 'rgba(169, 169, 169, 1)',
		                        borderWidth: 0.5
		                    },
		                    {
		                        label: '자격증', // 데이터 세트 레이블
		                        data: [0, qualificationAvg, 0, 0], // 자격증 데이터 설정
		                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
		                        borderColor: 'rgba(75, 192, 192, 1)',
		                        borderWidth: 1
		                    },
		                    {
		                        label: '학력', // 데이터 세트 레이블
		                        data: [0, 0, educationAvg, 0], // 학력 데이터 설정
		                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
		                        borderColor: 'rgba(255, 99, 132, 1)',
		                        borderWidth: 1
		                    },
		                    {
		                        label: '경력', // 데이터 세트 레이블
		                        data: [0, 0, 0, experienceAvg], // 경력 데이터 설정
		                        backgroundColor: 'rgba(255, 206, 86, 0.2)',
		                        borderColor: 'rgba(255, 206, 86, 1)',
		                        borderWidth: 1
		                    }
		                ]
		            });
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
		
		function displayTime() {
		    const now = new Date();
		    const timeElement = document.getElementById("real-time");
		    timeElement.innerHTML = now.toLocaleTimeString(); // 시간 형식 설정
		}
		
		// 페이지 로드 시 시작
		window.onload = function() {
		    // 1초마다 displayTime 함수 호출
		    setInterval(displayTime, 1000);
		};
	</script>
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">실시간 지원 현황</h4>
	        <button type="button" class="close" data-dismiss="modal" onclick="removeBackdrop()">&times;</button>
	      </div>
	      <div class="modal-body">
	      	<div>현재 시각은 <span id="real-time"></span>&nbsp;&nbsp;입니다.</div>
	      	<div><p id="applyInfoElement"></p></div>
	      	<div><p id="qualificationAvgElement"></p></div>
	      	<div><p id="educationAvgElement"></p></div>
	      	<div><p id="experienceAvgElement"></p></div>
	      	<canvas id="myChart" width="400" height="200"></canvas>
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

#real-time {
	color: #007bff;
	font-style: italic;
}

.highlighted-text {
	color: #007bff;
}

.modal-footer {
    text-align: right; /* 모달 하단 오른쪽 정렬 */
    margin-top: 20px; /* 위쪽 여백 추가 */
}
</style>
</html>