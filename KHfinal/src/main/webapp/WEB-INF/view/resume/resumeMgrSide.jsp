<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
article { /* 아티클 크기 설정 */
	position: relative; 
	padding-top : 25px; /* 테이블을 해당 길이만큼 아래 위치에서 생성되도록 설정 */
	width: 235px; /* 아티클 너비 설정 */
	font-family: 'Pretendard Variable', 'Pretendard', '-apple-system',
		'BlinkMacSystemFont', 'system-ui', 'Roboto', 'Helvetica Neue',
		'Segoe UI', 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic',
		'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'sans-serif'; /* 글자체 설정 */
}

table { /* 테이블 크기 설정 */
	background-color: white; /* 테이블 배경 색 설정 */
	padding-left: 50px; /* 테이블 안쪽 왼쪽 너비 */
	border: 1px solid #5D5D5D; /* 테두리 설정: 크기, 테두리 모양, 테두리 색 */
	width: 200px; /* 테이블 너비 */
}

tr { /* 테이블 내부 선 설정 */
	border: 1px solid #5D5D5D; /* 테두리 설정: 크기, 테두리 모양, 테두리 색 */
	font-size: 17px; /* 글자 크기 설정*/
}

td { /* 테이블 셀 내부 간격 설정 */
	padding: 20px;
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
		<article>
			<table>
				<tr>
					<td><strong>개인회원 홈</strong></td>
				</tr>
				<tr>
					<td><strong>이력서 관리</strong>
						<ul>
							<li><br>이력서 등록</li>
							<li>이력서 현황</li>
							<li>첨부파일 관리</li>
							<li>이력서 열람제한 설정</li>
							<li>강조노출 상품신청</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>입사지원·제안 관리</strong>
						<ul>
							<li><br>입사지원 현황</li>
							<li>취업활동 증명서</li>
							<li>받은 포지션 제안</li>
							<li>헤드헌팅 채용상담</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>역량테스트(MICT)</strong></td>
				</tr>
				<tr>
					<td><strong>스크랩/관심기업</strong>
						<ul>
							<li><br>스크랩 공고</li>
							<li>관심기업/헤드헌터</li>
							<li>MY 알림</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>콘텐츠 관리</strong>
						<ul>
							<li><br>MY 기업리뷰</li>
							<li>인적성 검사</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>회원정보 관리</strong>
						<ul>
							<li><br>회원정보 수정</li>
							<li>비밀번호 변경</li>
							<li>메일·문자 설정</li>
						</ul></td>
				</tr>
			</table>
		</article>
	</div>
</body>
</html>