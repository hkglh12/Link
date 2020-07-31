<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>We Linke-t</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="<c:url value="/a/css/noticeUpdateForm.css"/>" rel="stylesheet">
    <script src="<c:url value="/a/js/jquery-3.5.1.js"/>"></script>
    <script src="<c:url value="/a/js/jquery.MultiFile.js"/>"></script>
    <script src="<c:url value="/a/js/noticeUpdateForm.js"/>"></script>
<!--    <link rel="stylesheet" href="main.css">-->
    <!-- 동일폴더가 아니라 서버 상위 디렉토리로 올라갔다올꺼면 c:url 쓰라고 함 (JSTL)-->
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
 <!-- Summernote Setting -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src="<c:url value="/a/summernote/summernote-ko-KR.js"/>"></script>
<!--    <link rel="stylesheet" href="updateform.css">
    <script src="jquery-3.5.1.js"></script>
    <script src="updateform.js"></script>-->
    <script>
        
    </script>
</head>
<body>
<div class="area">
    
</div>
<!-- <nav class="main-menu">
    <ul>
        <li>
            <a href="http://localhost:80/Link/">
                <i class="fa fa-home fa-2x"></i>
                <span class="nav-text">
                    Main
                </span>
            </a>

        </li>
        <li>
            <a href="http://localhost:80/Link/">
                <i class="fa fa-home fa-2x"></i>
                <span class="nav-text">
                    My Information
                </span>
            </a>

        </li>
        <li class="has-subnav">
            <a href="http://localhost:80/Link/notice/list">
                <i class="fa fa-laptop fa-2x"></i>
                <span class="nav-text">
                    Noticement
                    아래에 팀 세개 추가해야함.
                </span>
            </a>
        </li>
        <li class="has-subnav">
            <a href="http://localhost:80/Link/community/list">
               <i class="fa fa-list fa-2x"></i>
                <span class="nav-text">
                    Community
                </span>
            </a>

        </li>
       
        <li>
            <a href="#">
               <i class="fa fa-info fa-2x"></i>
                <span class="nav-text">
                    Documentation
                </span>
            </a>
        </li>
    </ul>

    <ul class="logout">
        <li>
           <a href="http://localhost:80/Link/usr/logout">
                 <i class="fa fa-power-off fa-2x"></i>
                <span class="nav-text">
                    Logout
                </span>
            </a>
        </li>  
    </ul>
</nav> -->
<%@ include file="root-view.jsp"%>
 <section>
 <!--내용부 헤더-->
  <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
  <!--상단부 로고-->
  <header id="atop">
    <div class="row">
     <!--최상단 헤더, 위치안내용으로 쓰임 large-4 column lpad-->
      <div class="main lpad header location">
        <div class="logo">
          <span>CurrentLocation : </span>
          <span id="main_header_location_t_name">/notice/update</span>
        </div>
      </div>
      <div class="main header submenu ar">
       <!--소형메뉴 기존 클래스 large-8 column ar lpad-->
        <nav class="menu">
          <a href="#" class="current" id="dashboard">Dashboard</a>
          <a href="#" id="teaminfo">Team information</a>
          <a href="#" id="noticement">Noticement</a>
          <a href="#" id="community">Community</a>
          <!--<a href="#">Calendar</a>-->
          <a href="#" id="shareboard">Share board</a>
          <!--<a href="#">FAQ</a>
          <a href="#">Contact</a>-->
        </nav>     
      </div>
    </div>
  </header>
  <!--내용부 헤더 종료-->
  <!--사용자 계정 맞이-->
  <a href="atop" id="top-button">
    <i class="icon-angle-up"></i>
  </a>
  <div class="row">

    <div class="main lpad greets ar">
      Welcome,
      <a href="#" class="underline">${request.getParameter("usrId")}</a>
    </div>
  </div> 

  
  <div class="mainwrapper">
  <div id="notiwrapper">
     <form action="/Link/notice/update" method="post" enctype="multipart/form-data" id="updform">
     <input type="text" value=${n_serial} hidden=true>
      <div class="forum-category rounded top">
        <div id="noticetitle">
        <input type="hidden" value="${noticement.serial}" name="n_serial">
          <input type="text" value="${noticement.title}" name="n_title">
        </div>
        <div class="mpad ar">
          <button id="submit" type="submit"> 갱신하기 </button>
        </div>
      </div>
        
        <div id="noticecontent">
          <textarea name="n_contents" id="content">${noticement.contents}</textarea>
        </div>
        
    <div id="uploadfiles">
     <div id="previous uploaded">
     <c:if test="${empty noticement.uFileList}">
     <label>등록된 파일이 없습니다!</label>
     </c:if>
     <c:if test="${not empty noticement.uFileList}">
     <c:forEach items="${noticement.uFileList}" var="i">
     <li><button type="button" class="test" onclick="delthiscode(this);"></button><input type="text" name="previous" value="${i.uFileOriginName}" readonly>
     <input type="hidden" class ="tgf_code" value="${i.uFileCode}"></li>
     </c:forEach>
     <%-- <c:forEach items="${posting.uFileList}" var="i">
     	<li><button class="test +${i.uFileCode}"></button><a href="http://localhost:80/Link/notice/download?fileCode=${i.uFileCode}">${i.uFileOriginName}
     	<label class="uFileCode">${i.uFileCode}</label></a></li>
     </c:forEach> --%>
          </c:if></div>
     <div id="newlyuploaded">
		<input type="file" class="multi" name="u_files"/>
	</div>
      </div>
    </form>
<!--      </div>-->
  </div>
  </div>
  

    
    </section>
    </body>
    <script>
    $('#content').summernote();
    $(document).ready(function(){
	    console.log("${noticement.uFileList[0].uFileCode}");
    });
    function delthiscode(qa){
    	console.log(qa);
    	console.log($(qa).parent().find('input').val());
    	var inputl = document.createElement("input");
		inputl.setAttribute("type", "hidden");
		inputl.setAttribute("name", "del_targets");
		inputl.setAttribute("value", $(qa).parent().find('.tgf_code').val());
    	$("#updform").append(inputl);
    	$(qa).parent().css("display", "none");
    }
    /* $(".test").on("click", function(){
    	console.log("test");
    	var inputl = document.createElement("input");
    	inputl.setAttribute("type", "hidden");
    	inputl.setAttribute("name", "f_code");
    	inputl.setAttribute("value", )
    }); */
    </script>
</html>     
 