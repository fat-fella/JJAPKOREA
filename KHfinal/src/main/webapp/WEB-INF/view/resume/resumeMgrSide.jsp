<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

article { /* 전체 아티클 크기 설정 */
	padding-top: 25px;
	background-color: yellow;
	width: 300px;
}


table { /* 테이블 크기 설정 */
	background-color: cyan;
	padding-left: 50px;
	border: 1px solid black;
	border-spacing: 10px;
	width: 235px;
}


tr { /* 테이블 내부 선 설정 */
	border: 1px solid black;
	font-size: 15px;
}

td { /* 테이블 셀 내부 간격 설정 */
	padding: 20px;
}

li { /* 리스트 항목 내 설정 */
	padding-left: -20px;
	font-size: 14px;
}

li:hover { /* 리스트 항목에 마우스 위로 올리면 동작되는 설정 */
	color: #8C8C8C; /* 글씨 색을 회색으로 설정 */
	font-weight: bold; /* 글자 진하게 설정 */
	text-decoration: underline; /* 글자 밑줄 설정 */
	
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
						<li><br></li>
							<li>이력서 등록</li>
							<li>이력서 현황</li>
							<li>첨부파일 관리</li>
							<li>이력서 열람제한 설정</li>
							<li>강조노출 상품신청</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>입사지원·제안 관리</strong>
						<ul>
							<li>입사지원 현황</li>
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
							<li>스크랩 공고</li>
							<li>관심기업/헤드헌터</li>
							<li>MY 알림</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>콘텐츠 관리</strong>
						<ul>
							<li>MY 기업리뷰</li>
							<li>인적성 검사</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>회원정보 관리</strong>
						<ul>
							<li>회원정보 수정</li>
							<li>비밀번호 변경</li>
							<li>메일·문자 설정</li>
						</ul></td>
				</tr>
			</table>
		</article>
	</div>
</body>
</html>