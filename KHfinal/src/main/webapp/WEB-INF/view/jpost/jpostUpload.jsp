<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짭코리아 취업공고</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_jpostupload.css">
</head>
<body>
	<header>
		<div class="container">
			<a href="index" class="logo linkLogo"> <img
				src="<%=request.getContextPath()%>/resources/images/짭코리아.png"
				alt="JJAPKOREA" class="logoimg"></a>
			<div class="links">
				<a href="#" class="link linkHome">기업회원 홈</a> <a href="#"
					class="link linkManage">채용공고 관리</a>
			</div>
		</div>
	</header>
	<form action="../jobpostingupload/register" method="POST"
		class="jpostform">
		<div class="jposthead">
			<h2>채용공고 등록</h2>
			<h6>양식에 맞게 채용공고를 등록해주세요.</h6>
		</div>
		<div class="jpostcontent">
			<fieldset class="jpostfieldset">
				<div class="retitleinputBox">
					<label for="reTitle">채용제목 <span>*</span></label> <input type="text"
						id="reTitle" name="reTitle" required>
				</div>
				<div class="recruitfieldinputBox">
					<label for="firstRecruitField">채용분야 분류<span>*</span></label> <select
						name="firstRecruitField" id="firstRecruitField"
						onchange="loadOptions()" required>
						<option>선택해주세요</option>
						<option value="0">경영·사무·금융·보험직</option>
						<option value="1">연구직 및 공학 기술직</option>
						<option value="2">교육·법률·사회복지·경찰·소방직 및 군인</option>
						<option value="3">보건·의료직</option>
						<option value="4">예술·디자인·방송·스포츠직</option>
						<option value="5">미용·여행·숙박·음식·경비·청소직</option>
						<option value="6">영업·판매·운전·운송직</option>
						<option value="7">건설·채굴직</option>
						<option value="8">설치·정비·생산직</option>
						<option value="9">농림어업직</option>
					</select> <label style="font-size: 12px; color: red;">1차 세부채용분야<span>*</span></label>
					<select name="secondRecruitField" id="secondRecruitField"
						onchange="loadSecondOptions()">
						<option>선택해주세요</option>
					</select> <label style="font-size: 12px; color: red;">2차 세부채용분야<span>*</span></label>
					<select name="thirdRecruitField" id="thirdRecruitField"
						onchange="loadThirdOptions()">
						<option>선택해주세요</option>
					</select> <label style="font-size: 12px; color: red;">3차 세부채용분야<span>*</span></label>
					<select name="recruitField" id="recruitField">
						<option>선택해주세요</option>
					</select>
				</div>
				<h4>모집조건</h4>
				<div class="usereducationinputBox">
					<label for="userEducation">필요학력 <span>*</span></label> <select
						name="userEducation" id="userEducation">
						<option value="학력무관">학력무관</option>
						<option value="고등학교졸업">고등학교졸업</option>
						<option value="대학원 박사졸업">대학원 박사졸업</option>
						<option value="대학원 학사졸업">대학원 학사졸업</option>
						<option value="대학졸업(2,3년)</">대학졸업(2,3년)</option>
						<option value="대학졸업(4년)">대학졸업(4년)</option>
					</select>
				</div>
				<div class="careerinputBox">
					<label for="career">경력요구사항 <span>*</span></label> <input
						type="text" id="career" name="career" required>
				</div>
				<h4>근무조건</h4>
				<div class="worktypeinputBox">
					<label for="workType">근무형태 <span>*</span></label> <input
						type="text" id="workType" name="workType" required>
				</div>
				<div class="salaryinputBox">
					<label for="salary">연봉 <span>*</span></label> <input type="text"
						id="salary" name="salary" required>
				</div>
				<div class="minsalaryinputBox">
					<label for="minSalary">최소연봉 <span>*</span></label> <input
						type="text" id="minSalary" name="minSalary" required>
				</div>
				<div class="maxsalaryinputBox">
					<label for="maxSalary">최대연봉 <span>*</span></label> <input
						type="text" id="maxSalary" name="maxSalary" required>
				</div>
				<div id="jobpostingdetails">
					<h4>상세정보</h4>
					<textarea name="detailcontent" id="detailcontent"></textarea>
					
				</div>
			</fieldset>
			<div class="jpostdateset">
				<label for="regDate">채용공고 등록일</label> <input type="date"
					id="registDate" name="registDate"> <label for="closeDate">채용공고
					마감일</label> <input type="date" id="closeDate" name="closeDate">
			</div>
			<div class="jpostsubmitbtn">
				<button type="submit">등록</button>
			</div>
		</div>
	</form>
	 <script
		src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/translations/ko.js"></script>
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>

	<!-- ckeditor 생성 -->
 	<script>
		ClassicEditor.create(document.querySelector('#detailcontent'), {
			language:'ko',
			ckfinder: {
				uploadUrl : '/image/upload'
			}
		}).then(editor => {
		    window.editor = editor;
		}).catch( error => {
		    console.error( error );
		});
	</script> 

	<!-- 이미지 업로드  -->
	<!--     <script>
    class UploadAdapter {
        constructor(loader) {
            this.loader =loader;
        }

        upload() {
            return this.loader.file.then( file => new Promise(((resolve, reject) => {
                this._initRequest();
                this._initListeners( resolve, reject, file );
                this._sendRequest( file );
            })))
        }

        _initRequest() {
            const xhr = this.xhr = new XMLHttpRequest();
            xhr.open('POST', 'business/common/fms/ckeditor5Upload.do', true);
            xhr.responseType = 'json';
        }

        _initListeners(resolve, reject, file) {
            const xhr = this.xhr;
            const loader = this.loader;
            const genericErrorText = '파일을 업로드 할 수 없습니다.'

            xhr.addEventListener('error', () => {reject(genericErrorText)})
            xhr.addEventListener('abort', () => reject())
            xhr.addEventListener('load', () => {
                const response = xhr.response
                if(!response || response.error) {
                    return reject( response && response.error ? response.error.message : genericErrorText );
                }

                resolve({
                    default: response.url
                })
            })
        }

        _sendRequest(file) {
            const data = new FormData()
            data.append('upload',file)
            this.xhr.send(data)
        }
    }
    </script>
 -->










	<script>
		function loadOptions() {
			var firstRecruitField = document
					.getElementById("firstRecruitField");
			var secondRecruitField = document
					.getElementById("secondRecruitField");
			var selectedOption = firstRecruitField.options[firstRecruitField.selectedIndex].value;
			if (selectedOption == "선택해주세요") {
				return;
			}
			$
					.ajax({
						url : "/jjapkorea/business/jobpostingupload/getSecondRecruitField",
						method : "POST",
						data : {
							selectedOption : selectedOption
						},
						dataType : "json",
						success : function(response) {
							console.log(response)
							secondRecruitField.innerHTML = "";

							for (var i = 0; i < response.length; i++) {
								var option = document.createElement("option");
								option.text = response[i].jobsmcat;
								option.value = response[i].jobsmcd;
								secondRecruitField.appendChild(option);
							}
						},
						error : function(xhr, status, error) {
							console.error("Error: " + error);
						}
					});

		}
		function loadSecondOptions() {
			var secondRecruitField = document
					.getElementById("secondRecruitField");
			var thirdRecruitField = document
					.getElementById("thirdRecruitField");
			var selectedOption = secondRecruitField.options[secondRecruitField.selectedIndex].value;
			if (selectedOption == "선택해주세요") {
				return;
			}
			$
					.ajax({
						url : "/jjapkorea/business/jobpostingupload/getThirdRecruitField",
						method : "POST",
						data : {
							selectedOption : selectedOption
						},
						dataType : "json",
						success : function(response) {
							thirdRecruitField.innerHTML = "";

							for (var i = 0; i < response.length; i++) {
								var option = document.createElement("option");
								option.text = response[i].jobsscat;
								option.value = response[i].jobsscd;
								thirdRecruitField.appendChild(option);
							}
						},
						error : function(xhr, status, error) {
							console.error("Error: " + error);
						}
					});

		}
		function loadThirdOptions() {
			var thirdRecruitField = document
					.getElementById("thirdRecruitField");
			var recruitField = document.getElementById("recruitField");
			var selectedOption = thirdRecruitField.options[thirdRecruitField.selectedIndex].value;
			if (selectedOption == "선택해주세요") {
				return;
			}
			$
					.ajax({
						url : "/jjapkorea/business/jobpostingupload/getFourthRecruitField",
						method : "POST",
						data : {
							selectedOption : selectedOption
						},
						dataType : "json",
						success : function(response) {
							recruitField.innerHTML = "";

							for (var i = 0; i < response.length; i++) {
								var option = document.createElement("option");
								option.text = response[i].fieldTitle;
								option.value = response[i].recruitField;
								recruitField.appendChild(option);
							}
						},
						error : function(xhr, status, error) {
							console.error("Error: " + error);
						}
					});

		}
	</script>

</body>
</html>
