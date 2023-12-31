<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div id="layoutSidenav_nav">
<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">메인</div>
						<a class="nav-link" href="${pageContext.request.contextPath }/admin/index"">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 홈
						</a>
						<div class="sb-sidenav-menu-heading">회원관리</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 회원정보 
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${pageContext.request.contextPath }/admin/personList">
								일반멤버 리스트</a> 
								<a class="nav-link" href="${pageContext.request.contextPath }/admin/businessList">
								일반멤버 리스트</a> 
								<a class="nav-link" href="${pageContext.request.contextPath }/admin/suspendedPersonList">
								일반 멤버 정지 리스트</a>
								<a class="nav-link" href="${pageContext.request.contextPath }/admin/suspendedBusinessList">
								기업 멤버 정지 리스트</a>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">신고</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 신고 리스트
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${pageContext.request.contextPath }/admin/declarationWait">
								신고 리스트 처리 중</a> 
								<a class="nav-link" href="${pageContext.request.contextPath }/admin/declarationComplete">
								신고 리스트 처리 완료</a> 
							</nav>
						</div>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
				</div>