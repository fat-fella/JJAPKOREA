<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
/*메인페이지 채용공고 4개씩*/
.grid-container {
	display: grid;
	grid-template-columns: auto auto auto auto;
	gap: 10px;
	background-color: rgba(33, 150, 243, 0);
	padding: 10px;
	height: 100%;
}
</style>
<body>
	<section class="First VVIP 채용관">
		<div class="bannerwrap">
			<h5>
				<b>검색 결과</b>
			</h5>
		</div>
		<ul class="grid-container">
			<c:forEach items="${getJobPostingByKeywords}" var="item">
				<li class="bannereach">
					<form id="scrapForm">
						<div>
							<img src="${item.LI}" alt="이미지">
						</div>
						<div class="compName" onclick="getinfo('${item.JID}')">${item.BIZNAME}</div>
						<div class="recruitInfo" data-jid="${item.JID}"
							onclick="getinfo('${item.JID}')">
							${item.RE_TITLE}<br> <br>
						</div>
						<div id="applyscrap">
							<c:choose>
								<c:when test="${item.TODAY == 0}">
									<div class="applydateWithApply">오늘시작</div>
								</c:when>
								<c:when test="${item.DDAY == 0}">
									<div class="applydateWithApply">오늘마감</div>
								</c:when>
								<c:when test="${item.DDAY <= 7}">
									<button onclick="" class="applynow">즉시지원</button>
									<div class="applydateWithApply">D-${item.DDAY}</div>
								</c:when>
								<c:otherwise>
									<div class="applydateWithApply">D-${item.DDAY}</div>
								</c:otherwise>
							</c:choose>
							<!-- 클릭한 채용 정보 데이터를 폼에 담아 서버로 전송 -->
							<input type="hidden" name="jid" value="${item.JID}">
							<input type="hidden" name="recruitField"
								value="${item.RECRUIT_FIELD}">
							<input type="hidden" name="bizname" value="${item.BIZNAME}">
							<input type="hidden" name="brno" value="${item.BRNO}">
							<input type="hidden" name="userEducation"
								value="${item.USER_EDUCATION}">
							<input type="hidden" name="salary" value="${item.SALARY}">
							<input type="hidden" name="minSalary" value="${item.MIN_SALARY}">
							<input type="hidden" name="maxSalary" value="${item.MAX_SALARY}">
							<input type="hidden" name="registDate"
								value="${item.REGIST_DATE}">
							<input type="hidden" name="closeDate" value="${item.CLOSE_DATE}">
							<input type="hidden" name="reTitle" value="${item.RE_TITLE}">
							<input type="hidden" name="career" value="${item.CAREER}">
							<input type="hidden" name="workType" value="${item.WORK_TYPE}">
							<input type="hidden" name="empTypeCode"
								value="${item.EMP_TYPE_CODE}">
							<button type="button" onclick="setScrap('${item.JID}')"
								data-jid="${item.JID}" class="scrap">채용정보 스크랩</button>
						</div>
					</form>
				</li>
			</c:forEach>
		</ul>
	</section>
</body>
</html>