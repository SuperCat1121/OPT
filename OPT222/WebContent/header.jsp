<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="head_area">
		<div class="content_area">
			<div class="cut_layout">
				<div class="hd_top">
				<ul class="inline">
					<li>
					<% if(session.getAttribute("memdto") == null) { %>
						<a href="login.jsp?Flag=0">로그인</a>
					<% } else {%>
						<a href="login.do?command=logout">로그아웃</a>
					<% } %>	
					</li>
					<li>
						<a href="opt.do?command=mypage">마이페이지</a>
					</li>
				</ul>
				</div>
				<div class="hd_bottom">
					<div class="hd_logo">
						<a href="index.jsp">
							<img alt="opt_logo" src="image/logo2.png">
						</a>
					</div>
					<div class="hd_menu">
						<ul class="inline_menu">
							<li>
								<a href="opt_brand.jsp">BRAND</a>
							</li>
							<li>
								<a href="#">MEDIA</a>
							</li>
							<li>
								<a href="item.do?command=itemlist&page=1">PRODUCT</a>
							</li>
							<li>
								<a href="#">COUSTOMER SERVICE</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>