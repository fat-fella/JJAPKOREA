<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/resumeWrite.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resumeWrite</title>
<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- 이력서 최상단 메뉴 부분 -->
	<header>
		<div>
			<h1 id="jkLogo">
				<a href="../index"></a>
			</h1>
		</div>
		<div class="headerRight">
			<span id="personalHome"><a href="myPage">개인회원 홈</a></span> <span
				id="resumeMgr"><a href="resume">이력서 관리</a></span>
		</div>
	</header>

	<!-- 이력서 제목 작성 부분 -->
	<div>
		<input id="titleWrite"
			placeholder="기업에게 나에 대해 알려줍시다. 강점, 목표, 관심분야도 좋아요.">
	</div>

	<!-- 인적사항 부분 -->
	<div id="personalData">
		<h2>인적사항</h2>

		<table border="1">
			<tr>
				<td>
					<div>
						<input type="text" name="name" class="question" id="nme" required
							autocomplete="off" /> <label for="nme"><span>이름 *</span></label>
					</div>
				</td>
				<td>
					<div>
						<input type="text" name="name" class="question qholder" id="birth"
							required autocomplete="off" placeholder="1995.03.20" /> <label
							for="birth"><span>생년월일 *</span></label>
					</div>
				</td>
				<td>
					<div>
						<span>성별 *</span> <select name="" id="sexChoice">
							<option value="woman">여자</option>
							<option value="man">남자</option>
						</select>
					</div>
				</td>
				<td>
					<div>
						<input type="text" name="name" class="question" id="email"
							required autocomplete="off" /> <label for="email"><span>이메일
								*</span></label>
					</div>
				</td>
				<!-- <td rowspan="2">
					<div>사진</div>
				</td> -->
			</tr>
			<tr>
				<td>
					<div>
						<input type="text" name="name" class="question" id="tel" required
							autocomplete="off" placeholder="02-1234-1234" /> <label
							for="tel"><span>전화번호</span></label>
					</div>

				</td>
				<td><div>
						<input type="text" name="name" class="question" id="phone"
							required autocomplete="off" placeholder="010-1234-1234" /> <label
							for="phone"><span>휴대폰번호 *</span></label>
					</div></td>
				<td colspan="2">
					<div>
						<input type="text" name="name" class="question" id="address"
							required autocomplete="off" /> <label for="address"><span>주소</span></label>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<!-- 희망직무 부분 -->
	<div id="desiredJob">
		<h2>희망직무</h2>

		<div>
			<table border="1">
				<tbody>
					<tr>
						<td colspan="4">
							<div>
								<div>
									<span><a href="">추가하기</a></span>
								</div>
								<div>
									<span>희망직무 키워드 *</span>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 스킬 부분 -->
	<div id="skill">
		<h2>스킬</h2>


		<table>
			<tr>
				<td></td>
			</tr>
		</table>









	</div>


























</body>
</html>