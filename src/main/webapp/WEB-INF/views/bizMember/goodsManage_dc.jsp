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
            margin : 0px;
			padding : 0px;
        }
		* a{
        text-decoration: none;
        color: inherit;
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
		#goodsManage{
			width: 95%;
			height: 85%;
			background-color: white;
			padding: 5px;
			border-radius: 20px;
			margin: 0 auto;
		}
		#R-content{
			width: 95%;
			height: 95%;
			background-color: white;
			margin: 0 auto;
			border-radius: 20px;
		}
		#content-title{
			width: 100%;
			height: 10%;
			border-top-left-radius: 20px;
			border-top-right-radius: 20px;
			font-size: 20pt;			
		}
		#content{
			width: 100%;
			height: 90%;
		}
		#content-L{
			width: 30%;
			height: 100%;
			float: left;
			border-bottom-left-radius: 20px;
		}
		#content-R{
			width: 15%;
			height: 100%;
			float: left;
		}
		#content-result{
			width: 55%;
			height: 100%;
			float: left;
			border-bottom-right-radius: 20px;
		}
		.modifyBTN{
			float: right;
			width: 120px;
			height: 40px;
			font-size: 18pt;
		}
		#bizImg{
			width: 250px;
			height: 250px;
			border-radius: 250px;
			background-color: white;
			margin: 0 auto;
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
		#typeOption{
			width: 120px;
			height: 30px;	
			font-size: 18pt;
		}
		
		.goodsTable{
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
		button{
			padding: 10px;
		    border: none;
    		border-radius: 8px;
			background-color: #E6510B;
    		color: white;
		}
		.prdtEdt{
			border: none;
			background-color: #FFA77E;
			border-radius: 23px;
			color: white;
		}
		h1{
		float: left;
		font-size: 23pt;
		padding-top: 20px;
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
		#searchBTN{
			border: none;
    		border-radius: 8px;
			background-color: #E6510B;
    		color: white;
    		width: 50px;
    		height: 37px;
		}
		#searchForm{
			float: right;
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
					<span class="menulist">정산 관리</span><br><br>
				</a>
			</div>
		</div>
	</div>
	<div id="rightArea">
		<div id="R-upArea">
			<div id="goodsManage">
				<h1>할인 상품 관리</h1>
					<span class="logout">
						<a href="/BizMember/logout.do">로그아웃</a>
					</span>
					<span class="bizId"> ${sessionScope.bizMember.bizName } </span>
					<span class="bizSmallImage"> <img class="smaillimg" src="${sessionScope.bizMember.bizImage }">
					</span>
				
			</div>
		</div>
		<div id="R-downArea">
			<div id="R-content">
				<div id="content">
					<div id="content-title">
						<span style="text-align:left; float:left;">전체 ${requestScope.recordBizTotalCount }건</span>
						<div class="search" style="text-align:right;">

							<select>
								<option>상품명</option>
								<option>상품번호</option>
							</select>
							<input type="text" placeholder="검색어를 입력해주세요">
							<input id="searchBTN" type="submit" value="검색">
						<a href="/BizMember/goodDetail_dc.do"><button type="button" class="prdtReg" name="prdtReg">상품등록</button></a>
							
						</div>
					</div>
					<div id="contents">
					
					<c:choose>
						<c:when test="${!requestScop.list.isEmpty() }">
						<table class="goodsTable">
							<tr>
			 					<th><input type="checkbox" name="chk" value="all"></th>
			 					<th>상품 번호</th>
			 					<th>상품 이미지</th>
			 					<th>상품명</th>
			 					<th>상품 설명</th>
			 					<th>할인 가격</th>
			 					<th>관리</th>
			 				</tr>
						<c:forEach items="${requestScope.list }" var="m" varStatus="i">
							<tr>
								<td><input type="checkbox" name="chk" value="1"></td>
								<td>${i.count }</td>
								<td><img style="height:100%;" src="${m.MENUIMAGE }"> </td>
								<td>${m.MENUNAME } </td>
								<td>${m.MENUINFO } </td>
								<td>${m.DCPRICE } </td>
								<td>
									<button type="button" class="prdtEdt" name="prdtEdt">
										<a href="/bizMember/goodModify_dc.do?menuNo=${m.MENUNO }">수정</a>
									</button>  
								</td>
							</tr>
						</c:forEach>
						</table>
						</c:when>
						<c:otherwise>
							<H1>현재 저장된 상품이 없습니다.</H1>
						</c:otherwise>
			
					</c:choose>
						<button type="button" class="prdtDel" name="prdtDel" style="margin: 20px 0;">삭제</button>
					</div>

				</div>
					<!-- paging -->
                    <div id="page_wrap">
                        <ul class="page_ul">
                        <c:if test="${ preNavi > 0}">
                           <li><a href='/BizMember/goodsManage.do?currentPage=${ preNavi }'><i class='fas fa-chevron-left'></i></a></li>
                        </c:if>
                        <c:forEach items="${ navi }" var="i">
                           <c:choose>
                              <c:when test="${i==currentPage}">
                                 <li><a class="page_active" href='/BizMember/goodsManage.do?currentPage=${i}'>${i}</a></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a class="page_inactive" href='/BizMember/goodsManage.do?currentPage=${i}'>${i}</a></li>
                              </c:otherwise>
                              </c:choose>
                        </c:forEach>
                        <c:if test="${ nextNavi } != 0">
                           <li><a href='/BizMember/goodsManage.do?currentPage=${ nextNavi }'><i class='fas fa-chevron-right'></i></a></li>
                        </c:if>
                        </ul>
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
	
	
	
	
	
	
	
</script>
</body>
</html>