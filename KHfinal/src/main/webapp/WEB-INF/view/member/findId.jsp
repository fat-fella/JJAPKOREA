<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- nav active 별 스크립트 구성 -->

  
	<jsp:include page="/WEB-INF/view/msg/message.jsp"></jsp:include>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="icon" href="resources/favicon.ico">
    
    
    
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jobkh_findid.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_banner.promotion-sv.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_gnb-sv.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_mtu_common-sv.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_mtu_tpl-sv.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_mtu_popup-sv-202308211127.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_notification-sv.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_footer-sv.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_tooltip.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_flow.css">
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_common-sv.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_mtu_style-sv.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_swiper.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_mtu_popup-sv-202309061743.css">
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_faba.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_font-awesome-css.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage/mypage_pretendard-dynamic-subset.css">
	
	<!-- 헤더 시작 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- [1] 해상도 - 최적해상도 1260 결정 -->
<!-- [2] content 영역 1260px -->
<!-- [3] reset.css 폴더경로 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!-- [4] project명 또는 core.css 폴더경로 - bootstrap 등으로 대체 -->
<!-- [4] 기본색상 10~15개 정도 class 미리 만들어두기 -->
<!-- [4] 폰트크기 3~7개 정도 class 미리 만들어두기 -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" /> 
<!-- [4] button 3개 class 미리 만들어두기 -->
<!-- [4] a 모양 미리 만들어두기 -->
<!-- [5] layout 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_layout.css">
<!-- [6] header 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_header.css">
<!-- [7] nav 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_nav.css">
<!-- [8] main 영역 -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/css/jobkh_main.css">
<!-- [9] footer 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_footer.css">
<!-- 스크랩부 -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/member/css/jobkh_mypage.css">
<!-- swiper css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/member/css/swiper-bundle.min.css" />
<!-- 부트스트랩 css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="icon" href="resources/favicon.ico">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MY페이지 | KH</title>
<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- nav active 별 스크립트 구성 -->
    <div class="wrap header">
<div style="background-color:#ffffff">
    <jsp:include page="/WEB-INF/view/member/header.jsp"></jsp:include>
</div>
</head>
    </div>
	    
    
    
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
 /*         display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; */
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 400px;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        #idf {
            margin-top: 20px;
            text-align: left;
        }

        label {
            display: inline-block;
            width: 30%;
            margin-top: 10px;
            color: #333;
            text-align: left;
        }

		#pname, #pphone {
		    display: inline-block;
		    width: 60%;
		    padding: 10px;
		    margin-top: 10px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    font-size: 16px;
		}

        #find-password-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
        }

        #find-password-button:hover {
            background-color: #0056b3;
        }

        .center-align {
            text-align: center;
        }
    </style>
</head>
<body style="font-family: Pretendard Variable, Pretendard, -apple-system,
			BlinkMacSystemFont, system-ui, Roboto, Helvetica Neue, Segoe UI,
			Apple SD Gothic Neo, Noto Sans KR, Malgun Gothic, Apple Color Emoji,
			Segoe UI Emoji, Segoe UI Symbol, sans-serif">
	
      <div class="container" style="margin-top:30px">
    	<a href="index" class="logo linkLogo">
			<img src="<%=request.getContextPath()%>/resources/images/짭코리아_반전.png"
				alt="JJAPKOREA" class="logoimg" width="300" height="100">
		</a>
        <h1>아이디 찾기</h1>
        <form action="<%=request.getContextPath()%>/findId" method="post" name="idf">
            <label for="pname" style="text-align: left;">이름</label>
            <input type="text" id="pname" name="pname" placeholder="이름을 입력하세요">
            <label for="pphone" style="text-align: left;">휴대폰 번호</label>
            <input type="text" id="pphone" name="pphone" placeholder="휴대폰 번호를 입력하세요">
            <div class="center-align">
                <button id="find-password-button" type="submit">아이디 찾기</button>
            </div>
        </form>
    </div>
    <div class="wrap footer">
   	 <jsp:include page="/WEB-INF/view/member/footer.jsp"></jsp:include>
    </div>
    <!-- swiper 스크립트 -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- swiper 기능 스크립트 -->
</body>


</html>