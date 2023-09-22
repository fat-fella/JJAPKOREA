<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/resumeMgr_side.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resumeMgrSide</title>
</head>
<body>
	<div>
		<article id="resumeMgrMain">
			<table id="resumeMgrTable">
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><div class="resumeMgrMenu">
							<strong><a>개인회원 홈</a></strong>
						</div></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><strong>이력서 관리</strong>
						<ul class="resumeMgrUl">
							<li class="resumeMgrLi"><br><a href="<%=request.getContextPath() %>/resume/write">이력서 등록</a></li>
							<li class="resumeMgrLi"><a>이력서 현황</a></li>
							<li class="resumeMgrLi"><a>첨부파일 관리</a></li>
							<li class="resumeMgrLi"><a>이력서 열람제한 설정</a></li>
							<li class="resumeMgrLi"><a>강조노출 상품신청</a></li>
						</ul></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><strong>입사지원·제안 관리</strong>
						<ul class="resumeMgrUl">
							<li class="resumeMgrLi"><br>
							<a>입사지원 현황</a></li>
							<li class="resumeMgrLi"><a>취업활동 증명서</a></li>
							<li class="resumeMgrLi"><a>받은 포지션 제안</a></li>
							<li class="resumeMgrLi"><a>헤드헌팅 채용상담</a></li>
						</ul></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><div class="resumeMgrMenu">
							<strong><a>역량테스트(MICT)</a></strong>
						</div></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><strong>스크랩/관심기업</strong>
						<ul class="resumeMgrUl">
							<li class="resumeMgrLi"><br>
							<a>스크랩 공고</a></li>
							<li class="resumeMgrLi"><a>관심기업/헤드헌터</a></li>
							<li class="resumeMgrLi"><a>MY 알림</a></li>
						</ul></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><strong>콘텐츠 관리</strong>
						<ul class="resumeMgrUl">
							<li class="resumeMgrLi"><br>
							<a>MY 기업리뷰</a></li>
							<li class="resumeMgrLi"><a>인적성 검사</a></li>
						</ul></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><strong>회원정보 관리</strong>
						<ul class="resumeMgrUl">
							<li class="resumeMgrLi"><br>
							<a>회원정보 수정</a></li>
							<li class="resumeMgrLi"><a>비밀번호 변경</a></li>
							<li class="resumeMgrLi"><a>메일·문자 설정</a></li>
						</ul></td>
				</tr>
			</table>
		</article>
	</div>
</body>
</html>