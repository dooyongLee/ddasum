<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
      integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
      crossorigin="anonymous"></script>
</head>
<style>

	body { 
    	margin : 0px;
    }
    * div {
        box-sizing: border-box;
    }

    * a {
        color: white;
        text-decoration: none;
    }

    * hr {
        margin-top: 0px;
        width: 85%;
        background-color: #707070;
        border: 0px;
        height: 1px;
        margin-left: 50px;
    }

    
     
      /*컨텐츠*/
    #content{
        min-width: 1500px;
        width: 100%;
    }
    .content-side-back{/*사이드 빈공간*/
        border: 1px solid white;
        width: 15%;
        float: left;
    }
    #content-center{/*중앙 컨텐츠 공간*/
        width: 70%;
        float: left;
    }
    #content-center-empty-top-area1{
        width: 100%;
        height: 100px;
    }
    #resolvation-title-area {
        /*예약내역확인 타이틀*/
        padding-top: 10px;
        width: 100%;
        height: 156px;
        text-align: center;
        font-family: 'Noto Sans KR';
        font-size: 22px;
        font-weight: bolder;
    }
    #under {
        width: 80px;
        height: 5px;
        margin-bottom: 30px;
        background: #FFA77E;
        position: relative;
        display: inline-block;
    }
    #content-center-empty-top-area2{
        width: 100%;
        height: 95px;
    }
     #resolvation-list-area{/*내역리스트 시작*/
         width: 100%;
         height: 550px;
     }
     #list-table{
         width: 100%;
         text-align: center;
         font-family: 'Noto Sans KR';
     }
     table td{
         border-bottom: 1px solid black;
         height: 100px;
     }
     table th{
         background-color: rgba(255,167,126,0.3);
     }
     #shop-img{
         
         width: 90px;
         height: 90px;
         border-radius: 45px;
         float: left;
     }
     #shop-name-menu-area{
         float: left;
         width: 60%;
         height: 90px;
         padding-left: 10px;
         padding-top: 20px;
     }
     #content-center-empty-center-area{
         width: 100%;
         height: 50px;
     }
     #shop-list-page-navi{
         width: 100%;
         height: 50px;
         text-align: center;
     }
     #content-center-empty-bottom-area{
         width: 100%;
         height: 50px;
     }
    
    /* 페이지네비 */
	#page_wrap {
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
	    border-radius: 50%;
	/*     transition: ease 0.3s; */
	}
	#page_wrap .page_ul li a.page_active {
	    background-color: #FFA77E;
	    border-radius: 50%;
	    color: #fff;
	}
    </style>
<body>
<div id=header>
         <%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
    </div>
   
    <div id=content>
        <div class="content-side-back"></div>
        <div id="content-center">
            <div id="content-center-empty-top-area1"></div>
            <div id="resolvation-title-area">
                
                    <h1>예약 내역 확인</h1>
                    <div id="under"></div>
            </div>
            <div id="content-center-empty-top-area2"></div>
            <div id="all-resolvation-count"><span>전체 100건</span></div><br>
            <div id="resolvation-list-area">
            <c:choose>
				<c:when test="${!requestScope.map.list.isEmpty() }">
	                <table id="list-table">
	                   <tr>
	                        <th style="width: 240px;">예약 상품</th>
	                        <th>예약 유형</th>
	                        <th>예약 일자</th>
	                        <th>예약 번호</th>
	                        <th>예약 번호 전송</th>
	                        <th>예약 상태</th>
	                        <th style="width: 100px;">예약 취소</th>
	                    </tr>
	                    <c:forEach items="${requestScope.map.list }" var="d">
	                    <tr>
	                        <td style="padding-left: 10px;"><div id="shop-img"><img src="${d.bizImage }" style="width:90px; height: 90px; border-radius: 45px;"></div><div id="shop-name-menu-area"><b><span>${d.bizName }</span></b><br><span>${d.menuName }</span></div></td>
	                        <c:choose>
		                        <c:when test="${d.authorityId eq 'SP'}">
		                        	<td>후원</td>
		                        </c:when>
		                        <c:when test="${d.authorityId eq 'DC'}">
		                        	<td>할인</td>
		                        </c:when>
	                        </c:choose>
	                        <td>${d.reservationDate }</td>
	                        <td>${d.reNo }</td>
	                        <td><button>여기 공간이에여!</button></td>                
	                       	<c:choose>
								<c:when test="${d.reCancle eq 'N'.charAt(0)}">
			                        <td>예약완료</td>
			                        <td><a href="/member/reservationCancle.do?reNo=${d.reNo }"> <button class="cancelBtn" >예약취소</button></a></td>	 
		                        </c:when>
		                        <c:otherwise>
			                        <td style="color:red;">예약취소  </td>
			                        <td></td>
		                        </c:otherwise>
	                        </c:choose>
	                        
                        	                      
	                    </tr>
	                    </c:forEach>
					<tr align="center">
					<td colspan="7">
					<div id="page_wrap">
					    <ul class="page_ul">
					    	<li>
					        ${requestScope.map.pageNavi }
					        </li>
					    </ul>
					</div>
					</td>
					</tr>
				</table>
				</c:when>
				<c:otherwise>
				
					<h1 style="margin:0 auto;">현재 저장된 회원 목록이 없습니다.</h1>
				</c:otherwise>
		</c:choose>
			
            </div>
            <div id="content-center-empty-center-area"></div>
            	
            <div id="content-center-empty-bottom-area"></div>
        </div>
        <div class="content-side-back"></div>
    </div>
   
   
   
    <div id=footer>
       <%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
   </div>
   
   <script>
        $('#notice-button').hover(function() {
            $('#hover-menu1').css("display", "block");
        }, function() {
            $('#hover-menu1').css("display", "none");
        });


        $('#header-myPage-hover-text').hover(function() {
            $('#hover-menu2').css("display", "block");
        }, function() {
            $('#hover-menu2').css("display", "none");
        });
        
        
        $('.cancelBtn').click(function(){
			
        	var data = $(this).html();
			
			if(data =='예약취소'){
				return window.confirm("예약을 취소하시겠습니까?");
			}
		});
        
    </script>
 
</body>
</html>