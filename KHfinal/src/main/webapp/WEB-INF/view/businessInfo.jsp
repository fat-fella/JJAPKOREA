<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Untree.co">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<link rel="icon" href="resources/favicon.ico">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tiny-slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/glightbox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flatpickr.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<title>기업 상세 정보</title>
</head>
<style>
	body {
		font-family: 'Noto Sans KR', Arial, sans-serif;
	}
	
	.item {
        background-color: white; /* 흰색 배경 설정 */
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 설정 */
        margin: 10px; /* 각 아이템 간의 간격 조절 */
        padding: 10px; /* 아이템 내용과 테두리 간의 간격 조절 */
        width: 300px; /* 가로 크기 설정 */
        height: 600px; /* 세로 크기 설정 */
        overflow: auto; /* 스크롤바 표시 설정 */
    }
</style>
<body>

	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<div class="row g-0 align-items-center">
						<div class="col-2">
							<a href="${pageContext.request.contextPath}/index" class="logo m-0 float-start">
								JJAPKOREA<span class="text-primary">.</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div class="hero overlay">
		<img src="${pageContext.request.contextPath}/resources/images/maru/blob.svg" alt="" class="img-fluid blob">
		<div class="container">
			<div class="row align-items-center justify-content-between pt-5">
				<div class="col-lg-6 text-center text-lg-start pe-lg-5">
					<h1 class="heading text-white mb-3" data-aos="fade-up">${getBusinessWithBusinessformByMid.BIZNAME}</h1>
					<p class="text-white mb-5" data-aos="fade-up" data-aos-delay="100">${getBusinessWithBusinessformByMid.BFORM_NAME}</p>
				</div>
				<div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
					<div class="img-wrap">
						<img src="${getBusinessWithBusinessformByMid.LI}" alt="Image" class="img-fluid rounded">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 order-lg-2 mb-4 mb-lg-0">
					<img src="${pageContext.request.contextPath}/resources/images/maru/img-1.jpg" alt="Image" class="img-fluid">
				</div>
				<div class="col-lg-5 pe-lg-5">
					<div class="mb-5">
						<h2 class="text-black h4">기업 소개</h2>
					</div>
					<div class="d-flex mb-3 service-alt">
						<div>
							<span class="bi-wallet-fill me-4"></span>
						</div>
						<div>
							<h3>주소</h3>
							<p>${getBusinessWithBusinessformByMid.BADDRESS}</p>
						</div>
					</div>

					<div class="d-flex mb-3 service-alt">
						<div>
							<span class="bi-pie-chart-fill me-4"></span>
						</div>
						<div>
							<h3>전화번호</h3>
							<p>${getBusinessWithBusinessformByMid.BTEL}</p>
						</div>
					</div>

					<div class="d-flex mb-3 service-alt">
						<div>
							<span class="bi-bag-check-fill me-4"></span>
						</div>
						<div>
							<h3>이메일</h3>
							<p>${getBusinessWithBusinessformByMid.BEMAIL}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="section sec-portfolio bg-light pb-5	">
		<div class="container">
			<div class="row mb-5">
				<div class="col-lg-5 mx-auto text-center ">
					<h2 class="heading text-primary mb-3" data-aos="fade-up"
						data-aos-delay="0">채용 정보</h2>
					<p class="mb-4" data-aos="fade-up" data-aos-delay="100">지금 바로 ${getBusinessWithBusinessformByMid.BIZNAME} 에 지원해보세요.</p>

					<div id="post-slider-nav" data-aos="fade-up" data-aos-delay="200">
						<button class="btn btn-primary py-2" class="prev"
							data-controls="prev">Prev</button>
						<button class="btn btn-primary py-2" class="next"
							data-controls="next">Next</button>
					</div>

				</div>
			</div>
		</div>

		<div class="post-slider-wrap" data-aos="fade-up" data-aos-delay="300">
			<div id="post-slider" class="post-slider">
				<c:forEach items="${selectListMap}" var="item">
					<div class="item">
						<a href="<c:url value='/jobpostinginfo'><c:param name='jid' value='${item.JID}'/></c:url>" class="title" class="card d-block">
							<div class="card-body">
								<h5 class="card-title">${item.RE_TITLE}</h5>
								<p>${item.JPOSTDETAIL}</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="site-footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<div class="widget">
					<h3>About</h3>
					<p>짭코리아 기업 상세 정보입니다.</p>
				</div> <!-- /.widget -->
			</div> <!-- /.col-lg-4 -->
		</div>

		<div class="row mt-5">
			<div class="col-12 text-center">
					<!-- 
              **==========
              NOTE: 
              Please don't remove this copyright link unless you buy the license here https://untree.co/license/  
              **==========
            -->

            <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co">Untree.co</a> Distributed By <a href="https://themewagon.com">ThemeWagon</a> <!-- License information: https://untree.co/license/ -->
            </p>
          </div>
        </div>
      </div> <!-- /.container -->
    </div> <!-- /.site-footer -->

	<script
		src="${pageContext.request.contextPath}/resources/js/tiny-slider.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/flatpickr.min.js"></script>


	<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/glightbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/navbar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/counter.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>