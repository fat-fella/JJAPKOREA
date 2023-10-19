<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4367be77ab43095200d26c3ea16f01f8&libraries=services"></script>
<script>
	console.log("${jobPosting}");
	
	// 이메일 보내기 
	function sendEmail(jid) {
		var mid = "${mid}";
		var bizname = "${jobPosting.BIZNAME}";
		var retitle = "${jobPosting.RE_TITLE}";
		
		var resumeId = "${resumeId}";
		var applyId = "${applyId}";
		
		if (mid.trim() === "" || mid.trim() === "anonymousUser") {
	        alert("로그인 후 이용해주세요.");
	        window.location.href = '${pageContext.request.contextPath}/login/';
		} else if(resumeId === null || resumeId === "") {
			alert("이력서 등록 후 이용해주세요.");
			window.location.href = '${pageContext.request.contextPath}/person/resume/write';
		} else if(applyId !== null && applyId !== ""){
			alert("이미 지원한 채용 공고입니다.");
	    } else {
	    	var dataToSend = {
    		    jid: jid,
    		    mid: mid,
    		    bizname: bizname,
    		    retitle: retitle,
    		    resumeId: resumeId
    		};
	    	$.ajax({
				url : "${pageContext.request.contextPath}/person/noticeMail",
				type : "post",
				contentType : "application/json; charset=utf-8", // JSON 형식으로 데이터 전송
				data : JSON.stringify(dataToSend),
				// 문자열로 변환하여 보냄
				success : function(data) {
					alert("[지원 완료] 이메일이 전송되었습니다.");
					// data 변수에 서버에서 반환된 텍스트 데이터(applyId)가 저장됨
					applyId = data;
				},
			    error: function (xhr, status, error) {
			        if (xhr.status === 500) {
			            // 서버에서 에러 응답을 받았을 때 처리
			            var errorMessage = xhr.responseText;
			            alert("에러 발생: " + errorMessage);
			        } else {
			            // 다른 오류 처리
			            alert("다른 오류 발생: " + error);
			        }
			    }
			}); // ajax
	    }
	}
</script>
<!-- ------- 지도 STYLE ------- -->
<style>  
.map_wrap, .map_wrap * {margin: 0; padding: 0; font-family: 'Malgun Gothic', dotum, '돋움', sans-serif; font-size: 12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active {color: #000; text-decoration: none;}
.map_wrap {position: relative; width: 700px; height: 400px; }
#menu_wrap {position: absolute; top: 0; left: 0; bottom: 0; width: 200px; margin: 0 0 30px 10px; padding: 5px; overflow-y: auto; background: rgba(255, 255, 255, 0.7); z-index: 1; font-size: 12px; border-radius: 10px; }
.bg_white {background: #fff;}
#menu_wrap hr { display: block; height: 1px; border: 0; border-top: 2px solid #5F5F5F; margin: 3px 0;}
#menu_wrap .option {text-align: center;}
#menu_wrap .option p {margin: 10px 0;}
#menu_wrap .option button {margin-left: 5px;}
#placesList li {list-style: none;}
#placesList .item {position: relative; border-bottom: 1px solid #888; overflow: hidden; cursor: pointer; min-height: 65px;}
#placesList .item span {display: block; margin-top: 4px;}
#placesList .item h5,
#placesList .item .info {text-overflow: ellipsis; overflow: hidden; white-space: nowrap;}
#placesList .item .info {padding: 10px 0 10px 55px;}
#placesList .info .gray {color: #8a8a8a;}
#placesList .info .jibun {padding-left: 26px; background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color: #009900;}
#placesList .item .markerbg {float: left; position: absolute; width: 36px; height: 37px; margin: 10px 0 0 10px; background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
#mapModal {height: 100%;}
.modal {display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.7);}
.modal-content {position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: white; padding: 20px;}
.close {position: absolute; top: 0; right: 0; padding: 10px; cursor: pointer;}
</style>

<link rel="icon" href="resources/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jpostinfo.css">
</head>
<body>
	<header class="jobkorea-header">
		<div class="jobkorea-logo">
			<a href="<%=request.getContextPath()%>/index">JJAPKorea</a>
		</div>
		<div class="jobkorea-menu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/index">홈</a></li>
				<li><a
					href="<%=request.getContextPath()%>/business/jobpostingupload/list">채용정보</a></li>
			</ul>
		</div>
	</header>
	<section class="secReadSummary   ">
		<div class="readSumWrap clear">
			<article class="artReadJobSum">
				<div class="sumTit">
					<h3 class="hd_3">
						<div class="header">
							<span class="coName"> ${jobPosting.BIZNAME} </span>

							<div class="item favorite">
								<!-- <button type="button"
									class="girBtn girBtn_2 girBtnFav  devFavor5_15983790"
									onclick=" JKLoginLayer.open('/Recruit/Booth_GI_Read/42887747?Oem_Code=C1&amp;productType=FirstVVIP&amp;logpath=0'); ">
									<span>관심기업</span>
								</button>
 -->
							</div>
						</div>
						<p>${jobPosting.RE_TITLE}</p>
					</h3>
				</div>
				<div class="tbRow clear">
					<div class="tbcolrow">
						<div class="tbCol ">

							<h4 class="hd_4">지원자격</h4>
							<dl class="tbList">
								<dt>경력</dt>
								<dd>
									<strong class="col_1">${jobPosting.CAREER}</strong>
								</dd>
								<dt>학력</dt>
								<dd>
									<strong class="col_1">${jobPosting.USER_EDUCATION}</strong>
									(졸업예정자 가능)
								</dd>
							</dl>
						</div>
						<div class="tbCol ">

							<h4 class="hd_4">근무조건</h4>
							<dl class="tbList">
								<dt>고용형태</dt>
								<dd>
									<ul class="addList">

										<li><strong class="col_1">${jobPosting.WORK_TYPE}</strong>
											<span class="tahoma"></span></li>

									</ul>
								</dd>

								<dt>급여</dt>
								<dd>
									<em class="dotum"></em> ${jobPosting.SALARY}
								</dd>
								<dt>지역</dt>
								<dd>
									<a
										href="https://www.jobkorea.co.kr/List_GI/GI_Area_List.asp?AreaNo=I130&amp;AllStat=1"
										target="_blank" title="새창"
										onclick="javascript:go_Area_List('I130',1); return false;">서울시
									</a>
									<button id="openMapButton" onclick="openMapModal()">지도검색</button>
								</dd>
							</dl>
						</div>
					</div>
					<div class="tbCoInfo">
						<h4 class="hd_4">기업정보</h4>

						<div class="tbLogo">
							<div class="logo">
								<p>
									<a href="/Company/1824494/?C_IDX=807" target="_blank"
										title="새창"
										onclick="GA_Event('공고_PC', '기업정보상단', '기업로고_중앙일보㈜');"></a>
								</p>
							</div>
						</div>

						<dl class="tbList">
							<dt>산업(업종)</dt>
							<dd>
								<text>${jobPosting.FIELD_TITLE}</text>
							</dd>
							<dt>사원수</dt>
							<dd>
								<span class="tahoma">${jobPosting.BEMP}</span>명
							</dd>
							<dt>설립년도</dt>
							<dd>
								<text> <span class="tahoma">${jobPosting.BESTD}</span>년 (<span
									class="tahoma"></span>년차) </text>
							</dd>
							<dt>기업형태</dt>
							<dd>${BFORM}</dd>
							<dt>홈페이지</dt>
							<dd>

								<span class="tahoma"><a class="devCoHomepageLink"
									href="http://www.joongang.co.kr"
									onclick="javascript:go_HomePageTrace('http://www.joongang.co.kr','45389898');return false;">joongang.co.kr</a></span>
							</dd>
						</dl>
						<p class="coBtn">
							<a href="/Company/1824494/?C_IDX=807" target="_blank"
								title="기업정보(새창)" class="girBtn girBtn_3"
								onclick="GA_Event('공고_PC', '기업정보상단', '기업정보_중앙일보㈜');"><span>기업정보</span></a>
							<a href="/Recruit/Co_Read/15983790/CoRecruitLink" target="_blank"
								title="새창" class="girBtn girBtn_3"
								onclick="GA_Event('공고_PC', '기업정보상단', '진행중인채용보기_중앙일보㈜');"><span>진행중인
									채용보기</span></a>
						</p>
					</div>
					<div class="tbCoInfo">
						<p>${jobPosting.JPOSTDETAIL}</p>
					</div>

				</div>
			</article>
		</div>




		<form>
		<p class="sumBtn">
			<button type="button" onclick="sendEmail('${jobPosting.JID}')"
				class="tplBtn tplBtn_1 tplBtnBlue devHomePageApplyBtn"
				title="홈페이지 지원(새창)" id="devApplyBtn">
				<span>이력서 지원</span>
			</button>
		</p>
		</form>


		<p class="deadlineInfo" id="devTimeGuide"></p>
	</section>
<!-- ------- 지도 모달 ------- -->	
<div id="mapModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeMapModal()">&times;</span>
        <div class="map_wrap">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
            <div id="menu_wrap" class="bg_white">
                <div class="option">
                    <div>
                        <form onsubmit="searchPlaces(); return false;">
                            키워드 : <input type="text" value="${jobPosting.BIZNAME}" id="keyword" size="15" placeholder="기업명 입력!"> 
                            <button type="submit">검색하기</button>
                        </form>
                    </div>
                </div>
                <hr>
                <ul id="placesList"></ul>
                <div id="pagination"></div>
            </div>
        </div>
    </div>
</div>
<!-- ------- 지도 SCRIPT ------- -->
<script>
var modal = document.getElementById('mapModal');
window.onclick = function(event) {
    if (event.target == modal) {
        closeMapModal();
    }
}
function openMapModal() {
	modal.style.display = 'block';
	initializeMap();
}
function closeMapModal() {
	modal.style.display = 'none';
}

var mapInitialized = false;
var map;
function initializeMap() {
	if (!mapInitialized) {
		var mapContainer = document.getElementById('map');
		var mapOption = {
			center : new kakao.maps.LatLng(37.49892211341358,
					127.03288316151637),
			level : 5
		};
		map = new kakao.maps.Map(mapContainer, mapOption);
		mapInitialized = true;
	}
}

var markers = [];
var ps = new kakao.maps.services.Places();
var infowindow = new kakao.maps.InfoWindow({
	zIndex : 1
});

searchPlaces();
function searchPlaces() {
	var keyword = document.getElementById('keyword').value;
	ps.keywordSearch(keyword, placesSearchCB);
}

function placesSearchCB(data, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {
		displayPlaces(data);
		displayPagination(pagination);
	} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		alert('검색 결과가 존재하지 않습니다.');
		return;
	} else if (status === kakao.maps.services.Status.ERROR) {
		alert('검색 결과 중 오류가 발생했습니다.');
		return;
	}
}

function displayPlaces(places) {
	var listEl = document.getElementById('placesList'), menuEl = document
			.getElementById('menu_wrap'), fragment = document
			.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';
	removeAllChildNods(listEl);
	removeMarker();
	for (var i = 0; i < places.length; i++) {
		var placePosition = new kakao.maps.LatLng(places[i].y,
				places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
				i, places[i]);
		bounds.extend(placePosition);
		(function(marker, title) {
			kakao.maps.event.addListener(marker, 'mouseover',
					function() {
						displayInfowindow(marker, title);
					});
			kakao.maps.event.addListener(marker, 'mouseout',
					function() {
						infowindow.close();
					});
			itemEl.onmouseover = function() {
				displayInfowindow(marker, title);
			};
			itemEl.onmouseout = function() {
				infowindow.close();
			};
		})(marker, places[i].place_name);
		fragment.appendChild(itemEl);
	}
	listEl.appendChild(fragment);
	menuEl.scrollTop = 0;

	map.setBounds(bounds);
}
function getListItem(index, places) {
	var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
			+ (index + 1)
			+ '"></span>'
			+ '<div class="info">'
			+ '   <h5>' + places.place_name + '</h5>';
	if (places.road_address_name) {
		itemStr += '    <span>' + places.road_address_name + '</span>'
				+ '   <span class="jibun gray">' + places.address_name
				+ '</span>';
	} else {
		itemStr += '    <span>' + places.address_name + '</span>';
	}
	itemStr += '  <span class="tel">' + places.phone + '</span>'
			+ '</div>';
	el.innerHTML = itemStr;
	el.className = 'item';
	return el;
}
function addMarker(position, idx, title) {
	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', imageSize = new kakao.maps.Size(
			36, 37), imgOptions = {
		spriteSize : new kakao.maps.Size(36, 691),
		spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10),
		offset : new kakao.maps.Point(13, 37)
	}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imgOptions), marker = new kakao.maps.Marker({
		position : position,
		image : markerImage
	});
	marker.setMap(map);
	markers.push(marker);
	return marker;
}
function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}
function displayPagination(pagination) {
	var paginationEl = document.getElementById('pagination'), fragment = document
			.createDocumentFragment(), i;
	while (paginationEl.hasChildNodes()) {
		paginationEl.removeChild(paginationEl.lastChild);
	}
	for (i = 1; i <= pagination.last; i++) {
		var el = document.createElement('a');
		el.href = "#";
		el.innerHTML = i;

		if (i === pagination.current) {
			el.className = 'on';
		} else {
			el.onclick = (function(i) {
				return function() {
					pagination.gotoPage(i);
				}
			})(i);
		}
		fragment.appendChild(el);
	}
	paginationEl.appendChild(fragment);
}
function displayInfowindow(marker, title) {
	var content = '<div style="padding:5px;z-index:1;">' + title
			+ '</div>';
	infowindow.setContent(content);
	infowindow.open(map, marker);
}
function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}
</script>	
</body>
</html>