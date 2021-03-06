<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>We Link</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <script src="${pageContext.request.contextPath}/a/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/a/js/User/community/read.js"></script>
    <script src="${pageContext.request.contextPath}/a/js/Commons/navReact.js"></script>
   	<link href="${pageContext.request.contextPath}/a/css/Commons/column.css" rel="stylesheet">  
   	<link href="${pageContext.request.contextPath}/a/css/Commons/board_structure.css" rel="stylesheet">
   	<link href="${pageContext.request.contextPath}/a/css/User/community/read.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
        <!-- Summernote Setting -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="${pageContext.request.contextPath}/a/summernote/summernote-ko-KR.js"></script>
	<!-- AJAX Read Timestamp 관리 -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script>
	if("${result}" == "true"){
		alert("작업에 성공했습니다!");
	}
	</script>
</head>
<body>
<jsp:include page="../../root-view.jsp"/>
	<section>
  		<header id="atop">
    		<div class="row">
      			<div class="main lpad header location">
        			<div class="logo">
          				<span>게시글 조회</span>
          				<span id="main_header_location_t_name"></span>
        			</div>
      			</div>
      			<div class="main header submenu ar">
        			<nav class="menu">
          				<a href="#" class="current" id="dashboard"></a>
        			</nav>     
      			</div>
    		</div>
  		</header>
  		<div class="row">
    		<div class="main lpad greets ar">
      			Welcome,<a href="#" class="underline">${sessionScope.usrId}</a>
   			</div>	
  		</div>
  		<div class="mainwrapper">
  			<div id="notiwrapper">
      			<div class="forum-category rounded top">
        			<div id="noticetitle">
        			<label class="title_upper">제목</label><br>
          			<label class="title_lower">${community.title}</label>
        			</div>
        			<input type="hidden" id="subject" value="${community.subject}">
	        		<div class="mmpad ar">
	        			<button id="goback" onclick="gobacklist();">목록으로 돌아가기</button>
	        			<c:if test="${sessionScope.usrId eq community.usrId}">
	          				<button id="upd">게시글 수정</button>
	          				<button id="del">게시글 삭제</button>
	          			</c:if>
	        		</div>
      			</div>
        		<div id="noticeinfos">
            		<ul>
		                <li>게시글번호 : ${community.serial}</li>
		                <li>작성자 : ${community.usrId}</li>
		                <li>작성일 : <fmt:formatDate value="${community.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
		                <li>조회수 : ${community.readCount}</li>
		            </ul>
        		</div>
        		<div id="noticecontent">
        			<input type="hidden" id="c_serial" value="${community.serial}">
        			<label>게시글 내용</label>
          			<div id="content">${community.contents}</div>
        		</div>

    			<div id="uploadfiles_wrapper">
    			<label>첨부된 파일</label>
     			<div id="uploadfiles">
     				<ul>
     				<c:if test="${empty community.uFileList}">
     					<label>첨부된 파일이 없습니다!</label>
     				</c:if>
     				<c:if test="${not empty community.uFileList}">
     					<c:forEach items="${community.uFileList}" var="i">
     						<li><a href="/Link/community/download?fileCode=${i.uFileCode}">${i.uFileOriginName}</a></li>
     					</c:forEach>
     				</c:if>
     				</ul>
      			</div>
      			</div>
  			</div>
  		</div>
<!--   		<div id="uploadtext">
  			
  		</div> -->
		<div class="uploadcomment_wrapper">
	  		<label>댓글 작성하기</label>
	  		<div id="uploadcomment">
	   			<form action="/Link/comment/post" method="post">
	   				<input name="c_serial" type="hidden" value="${community.serial}">
	   				<textarea name="cc_contents" id="cc_contents"></textarea>
	   				<input type="checkbox" name="is_secret" value="true"> 비밀로하기
	   				<button type="submit" id="comment_submit">댓글 전송</button>
	   			</form>
	   		</div>
   		</div>
	<c:set var="commentlength" value="${total_comment}"></c:set>
	<div id="comment_start">
		댓글목록
		<input type="hidden" id="current_userid" value="${sessionScope.usrId}">
		<input type="hidden" id="community_userid" value="${community.usrId}">
	</div>
    	<div class="comment part">
    		
    		<div class="registered comment">
    	    	<c:if test="${empty community.comments}">
    	    		<div class="ctx_comment_wrapper">
     					<label>아직 등록된 댓글이 없습니다</label>
     				</div>
     			</c:if>
    			<c:if test="${not empty community.comments}">
     				<c:forEach items="${community.comments}" var="i">
     					<c:if test="${(i.checkSecret ne true) || ((sessionScope.usrId eq i.usrId) || (sessionScope.usrId eq community.usrId))}">	<!--  이거안되면 스트링처리다 -->
	     					<!-- 구분선 -->
	     					<div class="ctx_comment_wrapper">
	     						<div class="commenter">
          							<div class="image-wrapper"></div>
		     						<label class="comm usrlbl">유저아이디 : ${i.usrId}</label>
		     						<label class="comm usrlbl">게시날짜 : <fmt:formatDate value="${i.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></label>
	     							<c:if test="${sessionScope.usrId eq i.usrId}">
	     							<div class="toglecomm">
			     						<form action="/Link/comment/delete" method="post" class="delform">
			     							<input type="hidden" value="${community.serial}" name="c_serial">
			     							<input type="hidden" value="${i.serial}" name="del_serial"> 
			     							<button type="button" class="comment_del">댓글 삭제</button>
			     							<button type="button" class="togleOn">댓글 수정</button>
			     						</form>
		     						</div>
		     						</c:if>
		     						<c:if test="${i.checkSecret eq true}">
	     							<label class="col red usrlbl">비밀게시글입니다.</label>
	     							</c:if>
	     						</div>
	     						
									<c:if test="${sessionScope.usrId eq i.usrId}">
		     						<div class="toglemodi">
		     							<form action="/Link/comment/update" method="post" class="comm_modi_form">
		     								<input type="hidden" value="${community.serial}" name="c_serial">
			     							<input type="hidden" value="${i.serial}" name="cc_serial">
			     							<textarea name="modi_contents" class="modi_contents"></textarea>
			     							<input type="checkbox" name="is_secret" value="true"> 비밀로하기
			     							<button type="button" class="comm_submit">적용</button>
			     							<button type="button" class="togleOff">취소하기</button>
		     							</form>
		     						</div>
									</c:if>
	     						<div class="comment_contents">
		     							${i.contents}
		     					</div>
	     					</div>
     					</c:if>
     					<c:if test="${i.checkSecret eq true}">

     						<%-- <c:if test="${sessionScope.usrId eq i.usrId or sessionScope.usrId eq community.usrId}">
     						</c:if> --%>
     						<c:if test="${sessionScope.usrId ne i.usrId and sessionScope.usrId ne community.usrId}">
     						<div class="ctx_comment_wrapper">
     							<div class="toglecomm ac">
     								<label class="show_red">이 댓글은 댓글 작성자와 글 작성자만 볼 수 있습니다.</label>
     							</div>
     						</div>
     						</c:if>
     					</c:if>
     					<!--구분선-->
		     		</c:forEach>
    			</c:if>
    		</div>
    	</div>
    	<div class="comment_page_block">
    		<ul class="comment_blocks">
    			<fmt:parseNumber var="comment_block" value="${(commentlength/10) + (commentlength%10 == 0 ? 0 :1)}" integerOnly="true"></fmt:parseNumber>
    		<%-- <fmt:parseNumber var="comment_blocka" value = "${(commentlength/10)+1}" integerOnly="true"/> --%>
    			<c:if test="${comment_block gt 0}">
	        		<c:forEach begin="1" end="${comment_block}" var="i" step="1">
	          			<li><a onclick="commentblockmove('${i}')">${i}</a></li>
          			</c:forEach>
          		</c:if>
    		</ul>
    	</div>	
    </section>
</body>
<script>

</script>
</html>     
 