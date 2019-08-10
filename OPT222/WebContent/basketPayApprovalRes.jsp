<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		window.location.replace("basketPayComplete.jsp");
	});
</script>
</head>
<body>

	<h1>결제가 완료되었습니다.</h1>

</body>
</html>