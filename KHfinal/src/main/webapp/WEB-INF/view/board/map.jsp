<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4367be77ab43095200d26c3ea16f01f8&libraries=services"></script>
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
</head>
<body>
<button id="openMapButton" onclick="openMapModal()">지도</button>
<div id="mapModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeMapModal()">&times;</span>
        <div class="map_wrap">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
            <div id="menu_wrap" class="bg_white">
                <div class="option">
                    <div>
                        <form onsubmit="searchPlaces(); return false;">
                            키워드 : <input type="text" id="keyword" size="15" placeholder="기업명 입력!"> 
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