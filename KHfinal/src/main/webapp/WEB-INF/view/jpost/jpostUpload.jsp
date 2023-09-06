<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짭코리아 취업공고</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }

    header {
        background-color: #0077b6;
        color: white;
        padding: 10px 0;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 20px;
    }

    .logo {
        text-decoration: none;
    }

    .links {
        margin-left: auto;
    }

    .link {
        color: white;
        margin-left: 20px;
        text-decoration: none;
    }

    .jpostform {
        max-width: 1000px;
        margin: 20px auto;
        background-color: white;
        padding: 20px;
        border: 1px solid #ddd;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .jposthead {
        text-align: center;
    }

    .jpostfieldset {
        border: 1px solid #ddd;
        padding: 20px;
        margin-bottom: 20px;
    }

    label {
        font-weight: bold;
    }

    input[type="text"],
    select {
        width: 100%;
        padding: 5px;
        margin: 5px 0;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    textarea {
        width: 100%;
        height: 150px;
        padding: 5px;
        margin: 5px 0;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .jpostsubmitbtn {
        text-align: center;
        
    }

	.jpostdetails {
	    text-align: center;
	}
	
	.jpostsubmitbtn button:hover{
	    background-color: #005b8a;
	}
	.jpostsubmitbtn button{
		background-color: #0077b6;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    display: block;
	    margin: 0 auto; 
	    margin-top: 10px;
        padding: 10px 0; 
   		width: 100%;
 		box-sizing: border-box;
	}
	
	.submitBtn {
	    background-color: #0077b6;
	    color: white;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    display: block; 
	    margin: 0 auto; 
	    margin-top: 10px;
	}
	
	.submitBtn:hover {
	    background-color: #005b8a;
	}
	

    .jpostdateset {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }

    footer {
        text-align: center;
        background-color: #333;
        color: white;
        padding: 10px 0;
    }
    .logoimg{
    	height: 48px;
    	width: 90px;
    }
    span{
    	color:red;	
    }
    .ck-editor__editable {
    min-height: 400px;
    }
    
</style>

</head>
<body>
    <header>
        <div class="container">
            <a href="https://www.jobkorea.co.kr/" class="logo linkLogo">
            <img src="<%=request.getContextPath()%>/resources/images/짭코리아.png"
                alt="JJAPKOREA" class="logoimg"></a>
            <div class="links">
                <a href="#" class="link linkHome">기업회원 홈</a>
                <a href="#" class="link linkManage">채용공고 관리</a>
            </div>
        </div>
    </header>
    <form action="/경로" method="POST" class="jpostform">
        <div class="jposthead">
            <h2>채용공고 등록</h2>
            <h6>양식에 맞게 채용공고를 등록해주세요.</h6>
        </div>
        <div class="jpostcontent">
            <fieldset class="jpostfieldset">
                <div class="retitleinputBox">
                    <label for="jobTitle">채용제목 <span>*</span></label>
                    <input type="text" id="jobTitle" name="jobTitle" required>
                </div>
                <div class="recruitfieldinputBox">
                    <label for="recruitField">채용분야 1차 분류<span>*</span></label>
                    <select name="recruitField" id="recruitField" required>
                        <option value="건설·채굴">건설·채굴</option>
                        <option value="경영·사무·금융·보험">경영·사무·금융·보험</option>
                        <option value="교육·법률·사회복지·경찰·소방 및 군인">교육·법률·사회복지·경찰·소방 및 군인</option>
                        <option value="디자인">농림어업직</option>
                        <option value="미용·여행·숙박·음식·경비·돌봄·청소">미용·여행·숙박·음식·경비·돌봄·청소</option>
                        <option value="고객상담·TM">보건·의료</option>
                        <option value="설치·정비·생산-기계·금속·재료</">설치·정비·생산-기계·금속·재료</option>
                        <option value="설치·정비·생산-인쇄·목재·공예 및 제조 단순">설치·정비·생산-인쇄·목재·공예 및 제조 단순</option>
                        <option value="설치·정비·생산-전기·전자·정보통신">설치·정비·생산-전기·전자·정보통신</option>
                        <option value="설치·정비·생산-화학·환경·섬유·의복·식품가공">설치·정비·생산-화학·환경·섬유·의복·식품가공</option>
                        <option value="연구 및 공학기술</">연구 및 공학기술</option>
                        <option value="영업·판매·운전·운송">영업·판매·운전·운송</option>
                        <option value="예술·디자인·방송·스포츠</">예술·디자인·방송·스포츠</option>
                    </select>
                    <label style=font-size:12px;color:red;>1차 세부채용분야<span>*</span></label>
                    <select>
                    	<option>TODO</option>
                    </select>
                     <label style=font-size:12px;color:red;>2차 세부채용분야<span>*</span></label>
                    <select>
                    	<option>TODO</option>
                    </select>
                </div>
                <h4>모집조건</h4>
                <div class="usereducationinputBox">
                    <label for="userEducation">필요학력 <span>*</span></label>
                    <select name="usereducation">
                    	<option value="학력무관">학력무관</option>
                    	<option value="고등학교졸업">고등학교졸업</option>
                    	<option value="대학원 박사졸업">대학원 박사졸업</option>
                    	<option value="대학원 학사졸업">대학원 학사졸업</option>
                    	<option value="대학졸업(2,3년)</">대학졸업(2,3년)</option>
                    	<option value="대학졸업(4년)">대학졸업(4년)</option>
                    </select>
                </div>
                <div class="careerinputBox">
                    <label for="career">경력요구사항 <span>*</span></label>
                    <input type="text" id="career" name="career" required>
                </div>
                <h4>근무조건</h4>
                <div class="worktypeinputBox">
                    <label for="workType">근무형태 <span>*</span></label>
                    <input type="text" id="workType" name="workType" required>
                </div>
                <div class="emptypecodeinputBox">
                    <label for="empTypeCode">고용형태코드 <span>*</span></label>
                    <select name="empTypeCode" id="empTypeCode" required>
                        <option value=".">옵션 1</option>
                        <!-- Add more options here -->
                    </select>
                </div>
                <div class="salaryinputBox">
                    <label for="salary">연봉 <span>*</span></label>
                    <input type="text" id="salary" name="salary" required>
                </div>
                <div class="minsalaryinputBox">
                    <label for="minSalary">최소연봉 <span>*</span></label>
                    <input type="text" id="minSalary" name="minSalary" required>
                </div>
                <div class="maxsalaryinputBox">
                    <label for="maxSalary">최대연봉 <span>*</span></label>
                    <input type="text" id="maxSalary" name="maxSalary" required>
                </div>
                <div class="jpostdetails">
                    <h4>상세정보</h4>
                    <textarea name="content" id="content" required></textarea>
                    <button type="button" class="submitBtn">등록</button>
                </div>
            </fieldset>
            <div class="jpostdateset">
                <label for="regDate">채용공고 등록일</label>
                <input type="date" id="regDate" name="regDate">
                <label for="closeDate">채용공고 마감일</label>
                <input type="date" id="closeDate" name="closeDate">
            </div>
            <div class="jpostsubmitbtn">
                <button type="submit">등록</button>
            </div>
        </div>
    </form>
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/translations/ko.js"></script>
    <script>
        ClassicEditor.create(document.querySelector('#content'), {
            language: "ko"
        }).then(editor => {
            window.editor = editor;
        });
    </script>

</body>
</html>