<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-xl-3 col-md-6">
		<div class="card bg-secondary text-white mb-4">
			<div class="card-body card-cursorcollapsed card-cursor" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseMember" aria-expanded="false">
					멤버 리스트
			</div>
			<div class="collapse" id="collapseMember">
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/personList';">
					일반 멤버 리스트
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/businessList';">
					기업 멤버 리스트
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6">
		<div class="card bg-secondary text-white mb-4">
			<div class="card-body card-cursorcollapsed card-cursor" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseSuspended" aria-expanded="false">
					정지 멤버 리스트
			</div>
			<div class="collapse" id="collapseSuspended">
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/suspendedPersonList';">
					일반 멤버 정지 리스트
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/suspendedBusinessList';">
					기업 멤버 정지 리스트
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6">
		<div class="card bg-secondary text-white mb-4">
			<div class="card-body card-cursorcollapsed card-cursor" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseBoard" aria-expanded="false">
					게시판 신고
			</div>
			<div class="collapse" id="collapseBoard">
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/declarationWait';">
					신고 리스트 처리 중
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/declarationComplete';">
					신고 리스트 처리 완료
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6">
		<div class="card bg-secondary text-white mb-4">
			<div class="card-body card-cursorcollapsed card-cursor" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseMypage" aria-expanded="false">
					Admin 마이페이지
			</div>
			<div class="collapse" id="collapseMypage">
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/mypage';">
					Admin 정보
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>