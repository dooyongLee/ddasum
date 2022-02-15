<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/resources/commons/bizNavigation.css">

<title>Insert title here</title>
	<style>
		* div{
			box-sizing: border-box;
		}
		* {
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }
		* a{
        text-decoration: none;
        color: inherit;
    	}
    	body{
    	margin: 0;
    	}
		#wrapper{
			width: 1920px;
			height: 1080px;
			margin: 0 auto;
		}
		#leftArea{
			width: 400px;
			height: 100%;
			float: left;
		}
		#rightArea{
			width: 1520px;
			height: 100%;		
			float: left;
		}
		#R-upArea{
			width: 100%;
			height:108px;
			background-color: rgba(255, 211, 190, 0.2);
		}
		#R-downArea{
			width: 100%;
			height:972px;
			background-color: rgba(255, 211, 190, 0.2);
			float: left;
		}
		#calculateManage{
			width: 95%;
			height: 85%;
			background-color: white;
			padding: 5px;
			border-radius: 20px;
			margin: 0 auto;
		}
		#R-searchArea{
			width: 95%;
			height: 25%;
			background-color: white;
			margin: 0 auto;
		}
		#R-content{
			width: 95%;
			height: 70%;
			background-color: white;
			margin: 0 auto;
			border-radius: 20px;
		}
		#content-title{
			width: 100%;
			height: 5%;
			font-size: 20pt;			
		}
		#content{
			width: 100%;
			height: 90%;
		}
		ul{
			list-style: none;
			font-size: 18pt;
			padding: 0;
		}
		li{
			list-style: none;
			font-size: 18pt;
			padding: 10px;
			text-align: center;
		}
		.calculateTable{
			width: 100%;
			text-align: center;
		    border-collapse: collapse;
		}
		th, td {
		  border: 1px solid #A5A5A5;
		}
		th{
			height: 30px;
		}
		td{
			height: 70px;
		}
		#tableContetns{
			background-color: #FFA77E;
			color: white;
			font-size: 16pt;
		}
		#searchSection{
			width: 100%;
			height: 100%;
		}
		p { 
			display: block; 
			padding: 0 69px;
		}
		.confirmBTN{
			width: 100px;
			height: 35px;
			font-size: 14pt;
			color: white;
			border: none;
			background-color: #FFA77E;
			border-radius: 5px;
		}
		h1{
		float: left;
		font-size: 23pt;
		}
		.bizSmallImage{
				float: right;
		}
		.smaillimg{
					padding-top: 25px;
					padding-right: 10px;
					width:40px;
		}
		.bizId{
			float: right;
			font-size: 16pt;
			text-align: center;		
			padding-right: 20px;
			padding-top: 25px;
		}
		.logout{
			float: right;
			font-size: 16pt;
			padding-top: 25px;
		}
		#excelConverBtn{
			border: none;
		}
		#pagingArea{
			text-align: center;
		}
/*page navi*/

	#page_wrap {
			margin-top: 10px;
			margin-bottom: 10px;
		    width: 100%;
		}

		
		#page_wrap .page_ul {
		    display: table;
		    margin : 0 auto;
		}
		#page_wrap .page_ul li {
		    display: block;
		    width: 35px;
		    height: 35px;
		    float: left;
		    text-align: center;
		    margin: 0 5px;
		    line-height: 15.5px;
		    font-size: 16px;
		    color: #2A2A2A;
		}	
		#page_wrap .page_ul li a {
		    display: block;
		    font-family: 'Noto Sans KR', sans-serif;
			font-size: 16px;
			color: #2A2A2A;
		    padding: 10px;
		    border-radius: 100%;
			width: 35px;
		}
		#page_wrap .page_ul li a.page_active {
		    background-color: #FFA77E;
		    border-radius: 50%;
		    color: #fff;
		}  

input[type="checkbox"] {
        -webkit-appearance: none;
        position: relative;
        width: 16px;
        height: 16px;
        cursor: pointer;
        outline: none !important;
        border: 1px solid #eeeeee;
        border-radius: 2px;
        background: #fbfbfb;
    }
 
    input[type="checkbox"]::before {
        content: "\2713";
        position: absolute;
        top: 50%;
        left: 50%;
        overflow: hidden;
        transform: scale(0) translate(-50%, -50%);
        line-height: 1;
    }
 
    input[type="checkbox"]:hover {
        border-color: rgba(170, 170, 170, 0.5);
    }
 
    input[type="checkbox"]:checked {
        background-color: #FFA77E;
        border-color: rgba(255, 255, 255, 0.3);
        color: white;
    }
 
    input[type="checkbox"]:checked::before {
        border-radius: 2px;
        transform: scale(1) translate(-50%, -50%)
    }


		
	</style>
</head>
<body>
<div id="wrapper">
	<div id="leftArea">
		<div id="L-upArea">
			<div id="logoArea">
				<a href="/">
					<img class="Title" src="/resources/images/ddasum_header_logo.png" alt="로고">
				</a>			
			</div>
		</div>
		<div id="L-downArea">
			<div class="submenu"> 
				<a href="/bizMember/bizManage.do"><br>	
					<img class="Icons" src="/resources/images/bizSubMenu1.png" alt="로고">
					<span class="menulist">업체 관리</span><br><br>
				</a>
			</div>
			<div class="submenu"> 
				<a href="/BizMember/goodsManage.do"><br>
					<img class="Icons" src="/resources/images/bizSubMenu2.png" alt="로고">
					<span class="menulist">상품 관리</span><br><br>
				</a>
			</div>
			<div class="submenu"> 
				<a href="/BizMember/bizReserv.do"><br>
					<img class="Icons" src="/resources/images/bizSubMenu3.png" alt="로고">
					<span class="menulist">예약 관리</span><br><br>
				</a>
			</div>
			<div class="submenu"> 
				<a href="/BizMember/calculateManage.do"><br>
					<img class="Icons" src="/resources/images/bizSubMenu4.png" alt="로고">
					<span class="menulist">할인 정산 관리</span><br><br>
				</a>
			</div>
		</div>
	</div>
	<div id="rightArea">
		<div id="R-upArea">
			<div id="calculateManage">
				<h1>할인 정산 관리</h1>
					<span class="logout">
						<a href="/BizMember/logout.do">로그아웃</a>
					</span>
					<span class="bizId"> ${sessionScope.bizMember.bizName } </span>
					<span class="bizSmallImage"> <img class="smaillimg" src="${sessionScope.bizMember.bizImage }">
					</span>	
			</div>
		</div>
		<div id="R-downArea">
			<div id="R-searchArea">
				<h2>후원 정산 현황</h2>
				<br>
				<div id="searchSection">
					<span>검색기간</span>
					<input type="checkbox" name="daily">
					<span>일별</span>
					<input type="date"> ~ <input type="date">
					<button>어제</button>
					<button>1주일</button>
					<button>1개월</button>
					<p>
						<input type="checkbox" name="daily" >
						<span>월별</span>
						<input type="month">
						<select>
							<option value="">1월</option>
							<option value="">2월</option>
							<option value="">3월</option>
							<option value="">4월</option>
							<option value="">5월</option>
							<option value="">6월</option>
							<option value="">7월</option>
							<option value="">8월</option>
							<option value="">9월</option>
							<option value="">10월</option>
							<option value="">11월</option>
							<option value="">12월</option>
						</select>
					</p>
					 			
					<span>검색어</span>
					<select>
						<option value="">상품명</option>
						<option value="">예약번호</option>
					</select>
					<input type="text"/><br>
					<div style="text-align: center;">
						<input class="confirmBTN" type="submit" value="검색">
						<input class="confirmBTN" type="button" value="초기화">
					</div>
				</div>
					<hr>
			</div>

			<div id="R-content">
				<div id="content">
					<div id="content-title">
						<span style="text-align:left; float:left;">전체 ${requestScope.detailTotalCount }건</span>
						<div class="search" style="text-align:right;">
							 <button id='excelConverBtn' name="excelConverBtn" style="cursor:hand;" ><img width=30px; src="/resources/images/bizExcel.png"/></button>
						</div>
					</div>
					<div id="content">
					
					<c:choose>
						<c:when test="${!requestScope.list.isEmpty() }">					
						<table class="calculateTable">
							<tr id="tableContetns">
			 					<th>번호</th>
			 					<th>후원일자</th>
			 					<th>후원유형</th>
			 					<th>예약번호</th>
			 					<th>업체명</th>
			 					<th>상품명</th>
			 					<th>후원금액</th>
			 				</tr>
						<c:forEach items="${requestScope.list }" var="m" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td>${m.reservationDate }</td>
								<td>${m.authorityId }</td>
								<td>${m.reNo }</td>
								<td>${m.bizName } </td>
								<td>${m.menuName } </td>
								<td>${m.originalPrice -m.dcPrice }</td>
							</tr>
						</c:forEach>
						</table>
						</c:when>
						<c:otherwise>
							<H1>현재 저장된 회원이 없습니다.</H1>
						</c:otherwise>

					</c:choose>

					</div>
					<div>
									<!-- paging -->
                    <div id="page_wrap">
                        <ul class="page_ul">
                        <c:if test="${ preNavi > 0}">
                           <li><a href='/BizMember/calculateManage.do?currentPage=${ preNavi }'><i class='fas fa-chevron-left'></i></a></li>
                        </c:if>
                        <c:forEach items="${ navi }" var="i">
                           <c:choose>
                              <c:when test="${i==currentPage}">
                                 <li><a class="page_active" href='/BizMember/calculateManage.do?currentPage=${i}'>${i}</a></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a class="page_inactive" href='/BizMember/calculateManage.do?currentPage=${i}'>${i}</a></li>
                              </c:otherwise>
                              </c:choose>
                        </c:forEach>
                        <c:if test="${ nextNavi } != 0">
                           <li><a href='/BizMember/calculateManage.do?currentPage=${ nextNavi }'><i class='fas fa-chevron-right'></i></a></li>
                        </c:if>
                        </ul>
                    </div>
                    </div>
				</div>

			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
        $('.submenu').hover(function() {
            $(this).addClass('submenu_hover');
        }, function() {
            $(this).removeClass('submenu_hover');
        });
    });
	
	
	
	 $(document).ready(function(){
		 $("#excelConverBtn").on('click',function(){
				alert("엑셀다운");
			 location.href="/excelConvert";
		 });
	 });	
	
</script>
</body>
</html>