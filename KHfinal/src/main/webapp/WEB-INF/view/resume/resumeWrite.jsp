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
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function searchAddress_daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						console.log("asdfsdfsdfsdfsddsf");
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						var sido = data.sido; // 시도 항목 변수
						var sigungu = data.sigungu; // 시군구 항목 변수
						var bname = data.bname; // 법정동 항목 변수
						var sido_sigungu_bname = ''; // 시도_시군구_법정동 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 시도/시군구/법정동 데이터를 해당 필드에 넣는다.
						//document.getElementById("sido").value = data.sido;
						//document.getElementById("sigungu").value = data.sigungu;
						//document.getElementById("bname").value = data.bname;
						document.getElementById("sido_sigungu_bname").value = data.sido
								+ " " + data.sigungu + " " + data.bname;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
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