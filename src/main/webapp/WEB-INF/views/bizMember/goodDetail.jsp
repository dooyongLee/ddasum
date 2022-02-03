<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		* div{
			box-sizing: border-box;
		}
		* {
			font-family: 'Noto Sans KR', sans-serif;
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
		#L-upArea{
			width: 100%;
			height:108px;
			background-color: rgba(255, 167, 126, 0.5);
		}
		#L-downArea{
			width: 100%;
			height:972px;
			background-color: rgba(255, 167, 126, 0.5);
			padding-left: 100px;
			padding-top: 100px;
			
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
		}
		#logoArea{
			width: 100px;
			height: 80px;
			margin: 0 auto;
			text-align: center;	
			
		}
		#goodManage{
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
		.Title{
			width: 120px;
			text-align: center;	
		}
		.menulist{
			font-size: 19pt;
		}
		.Icons{
			width: 30px;
		}
		.submenu_hover{
			background-color:#FFF6F2;
			transition: 1s;
			border-top-left-radius: 50px;
			border-bottom-left-radius: 50px;
		}
		#content{
			width: 100%;
			height: 90%;
			border-bottom-left-radius: 20px;
			border-bottom-right-radius: 20px;
		}
		#itemImgArea{
			width: 100%;
			height: 30%;
		}
		#itemInfoImg{
			width: 25%;
			height: 100%;
			float: left;
			padding-left: 150px;
		}
		#itemImg{
			width: 75%;
			height: 100%;		
			float: left;
		}
		.itemInfo{
			width: 100%;
			height: 20%;
		}
		.iteminfodiv{
			width: 25%;
			height: 100%;
			float: left;
			padding-left: 150px;
		}
		.infoWriter{
			width: 75%;
			height: 100%;
			float: left;
		}
		.confirmArea{
			width: 100%;
			height: 10%;
			text-align: center;
		}
		span{
			font-size: 20pt;
		}
		.entertext{
			width: 300px;
			height: 50px;
			font-size: 20pt;
			border-color: gray;
		}
		.imgsize{
			width:100px;
			padding-top: 40px;
		}
		#itemImgInput{
			width: 290px;
			height: 220px;
			border: 1px solid gray;
			text-align: center;
		}
		.confirmstyle{
			width: 120px;
			height: 50px;
			background-color: #FFA77E;
			color: white;
			border-radius: 10px;
			font-size: 18pt;
			border: none;
		}
	</style>

</head>
<body>

<div id="wrapper">
	<div id="leftArea">
		<div id="L-upArea">
			<div id="logoArea">
				<a href="/">
					<img class="Title" src="/resources/images/ddasum_header_logo.png" alt="로고" width="400px;">
				</a>
			</div>
		</div>
		<div id="L-downArea">
			<div class="submenu"> 
				<a href="/BizMember/bizManage.do"><br>	
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
					<span class="menulist">후원 정산 관리</span><br><br>
				</a>
			</div>
		</div>
	</div>
	<div id="rightArea">
		<div id="R-upArea">
			<div id="goodManage">
				<h1>후원 상품 관리>상품등록</h1>
			</div>
		</div>
		<div id="R-downArea">
			<div id="R-content">
				<div id="content-title">
					후원 상품 등록
				</div>
				<div id="content">
					<div id="itemImgArea">
						<div id="itemInfoImg">
							<span>상품 이미지</span>
						</div>
						<div id="itemImg">
							<div id="itemImgInput">
								<img class="imgsize" src="/resources/images/bizImgAdd.png">
							<div><br>
							상품 사진을 추가해 주세요
							</div>
							</div>
						</div>
					</div>
					<div class="iteminfo">
						<div class="iteminfodiv">
							<span>상품명</span>
						</div>
						<div class="infoWriter">
							<input class="entertext" type="text">
						</div>					
					</div>
					<div class="iteminfo">
						<div class="iteminfodiv">
							<span>상품 설명</span>
						</div>
						<div class="infoWriter">
							<input class="entertext" type="text">
						</div>					
					</div>
					<div class="iteminfo">
						<div class="iteminfodiv">
							<span>상품가격</span>
						</div>
						<div class="infoWriter">
							<input class="entertext" type="text">
						</div>					
					</div>
					<div class="confirmArea">
						<input class="confirmstyle" type="submit" value="상품 등록">
						<input class="confirmstyle" type="button" value="취소">
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
</script>
</body>
</html>