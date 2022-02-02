<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/commons/layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/commons/mainTitle.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/joinPage.css">
<!--  jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>
		</header>
		<div id="content">
			<div class="main_tit">
				<h1>회원가입</h1>
				<div class="under"></div>
			</div>
			<div class="contents_wrap">
				<div id="joinSituation">
					<ol>
						<li id="choiceMember">가입&nbsp;유형&nbsp;선택&nbsp;&nbsp;>&nbsp;&nbsp;</li>
						<li id="accountCreation">계정 생성&nbsp;&nbsp;>&nbsp;&nbsp;</li>
						<li id="successJoin">가입 완료</li>
					</ol>
				</div>
				<div id="choiceJoin">
					<div id="memberJoin">
						<a href=""> <img id="memberJoinImg"
							src="/resources/images/spBizMember.png"> <span
							id="memberJoinWord">후원 사업자</span>
						</a>
					</div>
					<div id="bizMemberJoin">
						<a href=""> <img id="bizMemberJoinImg"
							src="/resources/images/dcBizMember.png"> <span
							id="bizMemberJoinWord">할인 사업자</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>
		</footer>
	</div>

	<script>
		$('#memberJoin').hover(
				function() {
					$(this).css('background-color', '#FFA77E');
					$('#memberJoinImg').attr('src',
							'/resources/images/spBizMember_hover.png')
					$('#memberJoinWord').css('color', 'white');

				},
				function() {
					$(this).css('background-color', 'white');
					$('#memberJoinImg').attr('src',
							'/resources/images/spBizMember.png')
					$('#memberJoinWord').css('color', '#FFA77E');
				});

		$('#bizMemberJoin').hover(
				function() {
					$(this).css('background-color', '#FFA77E');
					$('#bizMemberJoinImg').attr('src',
							'/resources/images/dcBizMember_hover.png')
					$('#bizMemberJoinWord').css('color', 'white');

				},
				function() {
					$(this).css('background-color', 'white');
					$('#bizMemberJoinImg').attr('src',
							'/resources/images/dcBizMember.png')
					$('#bizMemberJoinWord').css('color', '#FFA77E');
				});
	</script>
</body>
</html>