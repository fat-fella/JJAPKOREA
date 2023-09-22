<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#resumeMgrMain { /* 아티클 크기 설정 */
	position: relative;
	padding-top: 25px; /* 테이블을 해당 길이만큼 아래 위치에서 생성되도록 설정 */
	width: 235px; /* 아티클 너비 설정 */
	font-family: 'Pretendard Variable', 'Pretendard', '-apple-system',
		'BlinkMacSystemFont', 'system-ui', 'Roboto', 'Helvetica Neue',
		'Segoe UI', 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic',
		'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'sans-serif';
	/* 글자체 설정 */
}

#resumeMgrTable { /* 테이블 크기 설정 */
	background-color: white; /* 테이블 배경 색 설정 */
	padding-left: 50px; /* 테이블 안쪽 왼쪽 너비 */
	border: 1px solid #EAEAEA; /* 테두리 설정: 크기, 테두리 모양, 테두리 색 */
	width: 200px; /* 테이블 너비 */
}

.resumeMgrTr { /* 테이블 내부 선 설정 */
	border: 1px solid #EAEAEA; /* 테두리 설정: 크기, 테두리 모양, 테두리 색 */
	font-size: 17px; /* 글자 크기 설정*/
}

.resumeMgrTd { /* 테이블 셀 내부 간격 설정 */
	padding: 20px;
}

.resumeMgrMenu:hover { /* 항목에 마우스 위로 올리면 동작되는 설정 */
	text-decoration: underline; /* 글자 밑줄 설정 */
}

ul {
	margin-left: 0px; /* 초기 li 들여쓰기 없애는 설정 */
	padding-left: 15px; /* li 들여쓰기 너비 설정 */
}

li { /* 리스트 항목 내 설정 */
	color: #5D5D5D; /* 글자 색 설정 */
	font-size: 14px; /* 글자 크기 설정 */
}

li:hover { /* 리스트 항목에 마우스 위로 올리면 동작되는 설정 */
	font-weight: bold; /* 글자 진하게 설정 */
	text-decoration: underline; /* 글자 밑줄 설정 */
}

li:active {
	font-weight: bold; /* 글자 진하게 설정 */
	color: #172bff; /* 글자 색 설정 */
}
</style>
</head>
<body>
	<div>
		<article id="resumeMgrMain">
			<table id="resumeMgrTable">
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><div class="resumeMgrMenu"><strong><a>개인회원 홈</a></strong></div></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><strong><a>이력서 관리</a></strong>
						<ul>
							<li><br> <a>이력서 등록</a></li>
							<li><a>이력서 현황</a></li>
							<li><a>첨부파일 관리</a></li>
							<li><a>이력서 열람제한 설정</a></li>
							<li><a>강조노출 상품신청</a></li>
						</ul></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><strong>입사지원·제안 관리</strong>
						<ul>
							<li><br> <a>입사지원 현황</a></li>
							<li><a>취업활동 증명서</a></li>
							<li><a>받은 포지션 제안</a></li>
							<li><a>헤드헌팅 채용상담</a></li>
						</ul></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><div class="resumeMgrMenu"><strong><a>역량테스트(MICT)</a></strong></div></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><strong>스크랩/관심기업</strong>
						<ul>
							<li><br> <a>스크랩 공고</a></li>
							<li><a>관심기업/헤드헌터</a></li>
							<li><a>MY 알림</a></li>
						</ul></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><strong>콘텐츠 관리</strong>
						<ul>
							<li><br> <a>MY 기업리뷰</a></li>
							<li><a>인적성 검사</a></li>
						</ul></td>
				</tr>
				<tr class="resumeMgrTr">
					<td class="resumeMgrTd"><strong>회원정보 관리</strong>
						<ul>
							<li><br> <a>회원정보 수정</a></li>
							<li><a>비밀번호 변경</a></li>
							<li><a>메일·문자 설정</a></li>
						</ul></td>
				</tr>
			</table>
		</article>
	</div>
</body>
</html>