<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4367be77ab43095200d26c3ea16f01f8"></script>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
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
/* ----------------------------------------------------------------- */
body {
    background-color: #f9f9f9;
    margin: 0;
    padding: 20px;
}

.title {
    text-align: center;
    margin-top: 40px;
    padding-bottom: 10px;
    border-bottom: 2px solid #007bff;
}
.title h2 {
    font-size: 32px;
    color: #333;
}

.styled-board {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
    margin-top: 20px;
}
.styled-board th,
.styled-board td {
    padding: 15px;
    font-size: 16px;
}
.styled-board th {
    background-color: #007bff;
    color: #fff;
}
.styled-board td a {
    color: #333;
    text-decoration: none;
}
.styled-board td a:hover {
    text-decoration: underline;
}

.footer {
    text-align: center;
    margin-top: 40px;
    padding-top: 10px;
    border-top: 2px solid #007bff;
    background-color: #f9f9f9;
}
.footer p {
    font-size: 16px;
    color: #555;
}

/* 공통 스타일 */
.btn-container {
  margin: 10px;
}

a.button-link {
  text-decoration: none;
}

/* 키워드가 있는 경우 버튼 스타일 */
.btn-container-keyword {
  margin: 10px;
  float: right; /* 오른쪽으로 이동 */
}

/* 키워드가 없는 경우 버튼 스타일 */
.btn-container-no-keyword {
  margin: 10px;
  float: right; /* 오른쪽으로 이동 */
}

button {
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}

button.keyword {
  background-color: #4CAF50;
}

button.keyword:hover {
  background-color: #45a049;
}

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
}

/* 모달 내용 스타일 */
.modal-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
}

/* 지도 컨테이너 스타일 */
#map {
    width: 400px;
    height: 300px;
}

/* 모달 닫기 버튼 스타일 */
.close-button {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 15px;
  font-weight: bold;
  cursor: pointer;
  z-index: 3; /* 모달 닫기 버튼의 z-index를 설정하여 다른 요소 위에 표시합니다. */
}

/* 페이지 버튼 컨테이너 스타일 */
.pageInfo-wrap {
    text-align: center;
    margin-top: 20px;
}

/* 페이지 버튼 스타일 */
.pageInfo_btn {
    display: inline-block;
    margin: 5px;
    padding: 10px 15px;
    background-color: #white;
    color: #fff;
    border-radius: 5px;
    font-weight: bold;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
}

.pageInfo_btn:hover {
    background-color: #0056b3;
}

/* 이전 페이지 버튼 스타일 */
.pageInfo_btn.previous {
    background-color: #ccc;
}

.pageInfo_btn.previous:hover {
    background-color: #bbb;
}

/* 다음 페이지 버튼 스타일 */
.pageInfo_btn.next {
    background-color: #ccc;
}

.pageInfo_btn.next:hover {
    background-color: #bbb;
}

/* 현재 페이지 표시 스타일*/
.active{ 
    background-color: #cdd5ec;
}

/* 검색 */
.search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
 }
 .search_area input{
    height: 30px;
    width: 250px;
 }
 .search_area button{
    width: 100px;
    height: 36px;
 }
 .search_area select{
	height: 35px;
 }
</style>
</head>
<body>
<div class="title">
	<h2> 취업톡톡! 취뽀취뽀! </h2>
</div>
<!-- 검색 -->
<div class="search_wrap">
    <div class="search_area">
        <select name="type">
        	<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>선택</option>
            <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
            <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
            <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
        </select>   
        <input type="text" name="keyword" placeholder="키워드를 입력해주세요!" value="${pageMaker.cri.keyword }">
        <button>Search</button>
    </div>
</div>   
<c:if test="${not empty boardList }">
    <p>총 ${total } 개의 게시물이 있습니다</p>
    <table class="styled-board">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>좋아요수</th>
        </tr>
        <c:forEach items="${boardList }" var="dto">
            <tr>
                <td>${dto.bno }</td>
                <td>
                   <a class="move" href='<c:out value="${dto.bno}"/>'>
                        ${dto.btitle }
                   </a>
                </td>
                <td>${dto.mid }</td>
                <td>${dto.bwriteDate }</td>
                <td>${readCount }</td>
                <td>${dto.likehit }</td>
            </tr>
        </c:forEach>
    </table>
<!-- 페이징 및 버튼 -->    
    <div class="pageInfo-wrap">
    	<div class="pageInfo_area">
    		<ul>
		        <!-- Previous -->
                <c:if test="${pageMaker.prev}">
                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                </c:if>

                <!-- Page (현재 페이지 표시)-->
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                </c:forEach>
	           
	            <!-- Next -->
                <c:if test="${pageMaker.next}">
                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                </c:if>   
            </ul>
    	</div>
    </div>
    
    <form id="moveForm" method="get">
	    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	    <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	    <input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
</c:if>

<div class="btn-container btn-container-keyword">
    <c:choose>
        <c:when test="${not empty pageMaker.cri.type and not empty pageMaker.cri.keyword}">
            <a href="<c:url value='/board/list'/>" class="button-link">
                <button class="keyword">메인으로</button>
            </a>
        </c:when>
        <c:otherwise>
            <a href="<c:url value='/index'/>" class="button-link">
                <button class="keyword">홈으로</button>
            </a>
        </c:otherwise>
    </c:choose>
</div>

<div class="btn-container btn-container-keyword">
    <c:choose>
        <c:when test="${not empty memberid}">
            <a href="<c:url value='/board/insert'/>" class="button-link">
                <button class="keyword">글 등록</button>
            </a>
        </c:when>
        <c:otherwise>
            <a href="#" class="button-link" onclick="showAlertAndRedirect()">
                <button class="keyword">글 등록</button>
            </a>
        </c:otherwise>
    </c:choose>
</div>
<div class="map_wrap">
    <div id="map" style="width:1000px;height:1000px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script>
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
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

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

function showAlertAndRedirect() {
    alert("로그인이 필요합니다!");
    window.location.href = 'http://127.0.0.1:8090/jjapkorea/login/';
}

/* ------- 페이지 및 검색 ------- */
$(document).ready(function() {
	let moveForm = $("#moveForm");
    $(".pageInfo_btn a").on("click", function(e) {
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	    var pageNum = $(this).attr("href");
        moveForm.find("input[name='pageNum']").val(pageNum);
        moveForm.find("input[name='amount']").val(10); // 보여질 글의 갯수
        moveForm.attr("action", "${pageContext.request.contextPath}/board/list"); // context root를 포함한 URL
        moveForm.submit();
    });
	
	$(".move").on("click", function(e){
		e.preventDefault();
		var bno = moveForm.find("input[name='bno']").val();
		if(bno != ''){
			moveForm.find("input[name='bno']").remove();
		}
		moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
		moveForm.attr("action", "${pageContext.request.contextPath}/board/get");
		moveForm.submit();
	});
		
/* --- 엔터키 --- */
	$(".search_area button").on("click", function(e) {
	    performSearch();
	});

	$(".search_area input[name='keyword']").on("keyup", function(e) {
	    if (e.keyCode === 13) {
	        performSearch();
	    }
	});
	function performSearch() {
	    var type = $(".search_area select").val();
	    var keyword = $(".search_area input[name='keyword']").val();
	    var sKey = '<c:out value="${pageMaker.cri.keyword}"/>';

	    if (!type) {
	        alert("검색 종류를 선택하세요.");
	        return false;
	    }
	    if (!keyword) {
	        alert("키워드를 입력하세요.");
	        return false;
	    }
	    if (sKey != keyword) {
	        moveForm.find("input[name='pageNum']").val(1);
	    }
	    moveForm.attr("action", "${pageContext.request.contextPath}/board/list");
	    moveForm.find("input[name='type']").val(type);
	    moveForm.find("input[name='keyword']").val(keyword);
	    moveForm.submit();
	}
});
</script>
</body>
</html>