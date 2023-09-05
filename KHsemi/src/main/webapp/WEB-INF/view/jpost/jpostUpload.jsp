<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짭코리아 취업공고</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<header>
	<div class="container">
		<a href="https://www.jobkorea.co.kr/" class="logo linkLogo"><img
			src="https://i.jobkorea.kr/content/images/text_user/resume/logo-jobkorea.png?20230704"
			alt="JOBKOREA"></a>
		<div class="links">
			<a href="https://www.jobkorea.co.kr/User/Mypage"
				class="link linkHome">개인회원 홈</a> <a
				href="https://www.jobkorea.co.kr/User/ResumeMng"
				class="link linkManage">이력서 관리</a>
		</div>
	</div>
</header>
<body>
	<form action="/경로" method="POST">
	<div class="jposthead">
		<h2>채용공고 등록</h2>
		<h6>양식에 맞게 채용공고를 등록해주세요.</h6>
	</div>
		<div class="jpostcontent" style="width: 1000px;">
			<fieldset class="jpostfieldset" style="border: black, 1px;">
				<div class="retitleinputBox">
					<label>채용제목</label><span>*</span> <input type="text" required>
				</div>
				<div class="recruitfieldinputBox">
					<label>채용분야</label><span>*</span>
					<select name="recruitfield">
						<option>1</option>
					</select>
				</div>
				<h4>모집조건</h4>
				<div class="usereducationinputBox">
					<label>필요학력</label><span>*</span> <input type="text" name="usereducation">
				</div>
				<div class="careerinputBox">
					<label>경력요구사항</label><span>*</span> <input type="text" name="career">
				</div>
				<h4>근무조건</h4>
				<div class="worktypeinputBox">
					<label>근무형태</label><span>*</span> <input type="text" name="worktype">
				</div>
				<div class="emptypecodeinputBox">
					<label>고용형태코드</label><span>*</span>
					<select name="emptypecode">
						<option>.</option>
						<option>.</option>
						<option>.</option>
					</select>
				</div>
				<div class="salaryinputBox">
					<label>연봉</label><span>*</span> <input type="text" name="salary">
				</div>
				<div class="minsalaryinputBox">
					<label>최소연봉</label><span>*</span> <input type="text" name="minsalary">
				</div>
				<div class="maxsalaryinputBox">
					<label>최대연봉</label><span>*</span> <input type="text" name="maxsalary">
				</div>
				<div class="jpostdetails">
					<h4>상세정보</h4>
					<textarea name="content" id="content"></textarea>
					<script type="text/javascript">
						function test(thisele){
							console.log($("#content").val());
							console.log($("#a").val());
							console.log(window.editor.getData());
						}
					</script>
					<input type="button" value="등록" onclick="test(this);">
					<script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>
					<script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/translations/ko.js"></script>
						<input type="hidden" name="a" id="a">
					<script>
						ClassicEditor.create(
								document.querySelector('#content'), {
									language : "ko"
								}).then(editor => {
									window.editor = editor;
									$("#a").val(editor);
								});
						
					</script>
				</div>
			</fieldset>
			<div class="jpostdateset">
				<label>채용공고 등록일</label> <input type="date" name="registdate">
				<label>채용공고 마감일</label> <input type="date" name="closedate">

			</div>
			<div class="jpostsubmitbtn">
				<button type="submit">등록</button>
			</div>
		</div>
	</form>
</body>
</html>