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
<!-- 카카오 API : 주소 검색 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function searchAddress_daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var sido = data.sido; // 시도 항목 변수
						var sigungu = data.sigungu; // 시군구 항목 변수
						var bname = data.bname; // 법정동 항목 변수
						var sido_sigungu_bname = ''; // 시도_시군구_법정동 항목 변수

						// 시도/시군구/법정동 데이터를 해당 필드에 넣는다.
						//document.getElementById("sido").value = data.sido;
						//document.getElementById("sigungu").value = data.sigungu;
						//document.getElementById("bname").value = data.bname;
						document.getElementById("sido_sigungu_bname").value = data.sido
								+ " " + data.sigungu + " " + data.bname;
					
					}
				}).open();
	}
</script>
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
						<input type="text" name="birth" class="question qholder"
							id="birth" required autocomplete="off" placeholder="1995.03.20" />
						<label for="birth"><span>생년월일 *</span></label>
					</div>
				</td>
				<td>
					<div>
						<span>성별 *</span> <select name="sexChoice" id="sexChoice">
							<option value="woman">여자</option>
							<option value="man">남자</option>
						</select>
					</div>
				</td>
				<td>
					<div>
						<input type="text" name="email" class="question" id="email"
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
						<input type="text" name="tel" class="question" id="tel" required
							autocomplete="off" placeholder="02-1234-1234" /> <label
							for="tel"><span>전화번호</span></label>
					</div>

				</td>
				<td><div>
						<input type="text" name="phone" class="question" id="phone"
							required autocomplete="off" placeholder="010-1234-1234" /> <label
							for="phone"><span>휴대폰번호 *</span></label>
					</div></td>
				<td colspan="2">
					<div onclick="searchAddress_daumPostcode()">
						<input type="text" name="address" class="question"
							id="sido_sigungu_bname" required autocomplete="off" readonly />
						<label for="sido_sigungu_bname"><span>주소</span></label>
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