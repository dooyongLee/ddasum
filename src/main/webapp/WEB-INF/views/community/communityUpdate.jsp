<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥시러</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
    <!--Toast editor cdn-->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <!--Toast editor css-->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <!-- SweetAlert2 CDN -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/communityWrite.css">
	<link rel="stylesheet" type="text/css" href="/resources/commons/layout.css">
	<link rel="stylesheet" type="text/css" href="/resources/commons/mainTitle.css">
	    
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>	

 <div id="content">
         <div class="main_tit">
            <a href="/community/communityList.do" style="all:unset;"><h1>혼밥시러</h1></a>
            <div class="under"></div>
         </div>
         <div class="contents_wrap">
      
        	<form action="/community/communityUpdate.do" method="post" id="updateForm">
	            <select id="area" name="area" class="area_select" onchange="categoryChange(this)" data-name="시도">
	                <option value="" disabled selected hidden>시도 선택</option>
	                <option value="SEOUL">서울</option>
	                <option value="GYEONGGI">경기</option>
	                <option value="INCHEON">인천</option>
	            </select>
	            <select name="sigu" id="sigu" class="area_select" data-name="시구">
	                <option value="" disabled selected hidden>지역구 선택</option>
	            </select>
	            <input type="text" class="c_title" id="board_title" name="cTitle" placeholder="제목을 입력해주세요." data-name="제목" value="${requestScope.community.cTitle }">
	            <div id="editor"></div>
	            <input type="text" id="board_content" name="cContent" data-name="내용" hidden>
	            <input type="text" name="cNo" value="${requestScope.community.cNo }" hidden />
	            <input type="text" name="currentPage" value="${requestScope.currentPage }" hidden />
	            <br><br><br>
	            <div style="text-align:center">
            </form>
            <button class="basic_button" type="button" id="regBtn">등록</button>
	        <a href="/community/communityList.do" style="all:unset;"><button class="basic_button" type="reset">취소</button></a>    
       </div>
  </div>
  <br /><br />
    <script>
	    $(function(){
/* 	    	$("#area").html("${requestScope.community.area}").prop("selected", true);
	    	$("#sigu").html("${requestScope.community.sigu}").prop("selected", true); */
	    })
    </script>
    
    
    <script> // editor
        const editor = new toastui.Editor({
            el: document.querySelector('#editor'),
            previewStyle: 'tab', // or vertical 마크다운 미리보기
            height: '500px', // 편집기 높이
            initialEditType: 'wysiwyg', // or markdown 초기에디트타입
            initialValue: '${requestScope.community.cContent}', // 초기 값
            hideModeSwitch: 'false', // 에디트 변경 탭 숨김
        });
        // 사용하지 않을 도구 제거     
        editor.removeToolbarItem('link'); //링크도구 제거 
        editor.removeToolbarItem('table'); //테이블도구 제거
        editor.removeToolbarItem('code'); //인라인코드도구 제거
        editor.removeToolbarItem('codeblock'); //코드블록도구 제거
        editor.removeToolbarItem('task'); //todo체크박스 제거

        $("board_content").html(editor.getHTML()); //입력값 가져오기
        $("#editor").keyup(function() {

            $("#board_content").html(editor.getHTML());

        })
    </script>

    <script> // select
        function categoryChange(e) {

            const seoulKor = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];

            const seoulEng = ["GANGNAM", "GANGDONG", "GANGBUK", "GANGSEO", "GWANAK", "GWANGJIN", "GURO", "GEUMCHEON", "NOWON", "DOBONG", "DONGDAEMUN", "DONGJAK", "MAPO", "SEODAEMUN", "SEOCHO", "SEONGDONG", "SEONGBUK", "SONGPA", "YANGCHEON", "YEONGDEUNGPO", "YONGSAN", "EUNPYEONG", "JONGRO", "JUNG", "JUNGNANG"];
            
            const gyeonggiKor = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];
            
            const gyeonggiEng = ["GOYANG", "GWACHEON", "GWANGMYEONG", "GWANGJU", "GURI", "GUNPO", "GIMPO", "NAMYANGJU", "DONGDUCHEON", "BUCHEON", "SEONGNAM", "SUWON", "SIHEUNG", "ANSAN", "ANSEONG", "ANYANG", "YANGJU", "OSAN", "YONGIN", "UIWANG", "UIJEONGBU", "ICHEON", "PAJU", "PYEONGTAEK", "POCHEON", "HANAM", "HWASEONG", "GAPYEONG", "YANGPYEONG", "YEOJU", "YEONCHEON"];

            const incheonKor = ["계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];

            const incheonEng = ["GYEYANG", "MICHUHOL", "NAMDONG", "DONG", "BUPYEONG", "SEO", "YEONSU", "JUNGGU", "GANGHWA", "ONGJIN"];            

            let listKor;
            let listEng;
            if (e.value == "SEOUL") {
                listKor = seoulKor;
                listEng = seoulEng;
            } else if (e.value == "GYEONGGI") {
                listKor = gyeonggiKor;
                listEng = gyeonggiEng;
            } else if (e.value == "INCHEON") {
                listKor = incheonKor;
                listEng = incheonEng;
            }
            sigu.options.length = 0;
            // 군/구 갯수;

            for (x in listKor) {
                let opt = document.createElement("option");
                opt.value = listEng[x];
                opt.innerHTML = listKor[x];
                sigu.appendChild(opt);
            }
        }
    </script>
	
	<script> // data submit
		$("#regBtn").click(function(){
			const boardTitle = $("#board_title").val();
			const boardContent = editor.getMarkdown();
			const area = $("#area").val();
			const sigu = $("#sigu").val();
			let text;
			if(!boardTitle){
				text = "제목을 입력해주세요!";
				alertModal(text);
				return ;
			}
			if(!boardContent){
				text = "내용을 입력해주세요!";
				alertModal(text);
				return ;
			}
			if(!area){
				text = "지역을 선택해주세요";
				alertModal(text);
				return ;
			}
			if(!sigu){
				text = "시구를 선택해주세요";
				alertModal(text);
				return ;
			}
			$("#board_content").val(editor.getHTML()); //입력값 가져오기
			
			$("#updateForm").submit();
		})
		
		function alertModal(text){
		
			Swal.fire({
				  icon: "warning",
				  title: "실패!",
				  text: text,
				  confirmButtonText: "확인"
				});
	}
	</script>
	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>  	
</body>
</html>