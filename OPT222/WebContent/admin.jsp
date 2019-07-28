<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:if test="${memdto.opt_role ne 'admin'}">
		<script type="text/javascript">
		alert("잘못된 접근입니다.");
		document.location.href = "index.jsp";
		</script>
		</c:if>
		
		
		<h1>${memdto.opt_role} 얍얍</h1>
		
</body>

</html>