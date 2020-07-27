<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Welcome-LinkeT</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
<!--     <link rel="stylesheet" href="Login.css"> -->
    <!--<script src ="Login.js"></script>-->
    <link href="<c:url value="/assets/css/login.css"/>" rel="stylesheet">
    <script type="text/javascript" src="<c:url value="/assets/jquery/jquery-3.5.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/assets/js/login.js"/>"></script>
    <!-- <script src="login.js"></script> -->
	<script>
 		var result="${result}";
	 
	</script>
</head>
<body>
    <div class="body"></div>
		<div class="grad"></div>
		<div class="innerwrapper"></div>
		<div class="header">
			<div>Linke<span>T</span></div>
		</div>
		<br>
		<div class="login">
            <form action="/LinkeT/usrLogin" method="post">
				<input type="text" name="u_id" placeholder="userid"><br>
				<input type="password" name="u_pw" placeholder="password" ><br>
                <button type="submit">Login</button>
            <button type="button" id="signup"><a href="http://localhost:80/LinkeT/r/signup.html">SignUp</a></button>
            </form>
             
		</div>

</body>

</html>
