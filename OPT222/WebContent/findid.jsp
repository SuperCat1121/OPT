<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var ran = null;
	function emailChk() {
		var email = $("#opt_email").val();
		var emailSpan = $("#emailSpan");

		$.ajax({
			type : "POST",
			url : "login.do?command=ChkEmail&email=" + email,
			dataType : "text",
			success : function(data) {
				var trm = $.trim(data);
				if (email.length != 0) {
					if (trm == email) {
						$.ajax({
							type : "POST",
							url : "login.do?command=sendEmail&email=" + email,
							dataType : "text",
							success : function(data) {
								ran = $.trim(data);
								emailSpan.html("인증번호가 발송되었습니다.");
							},
							error : function() {
								alert("통신실패")
							}
						});
					} else {
						emailSpan.html("존재하지 않는 이메일 입니다.");
					}

				} else {
					emailSpan.html("이메일을 입력해 주세요.");
				}
			},
			error : function() {
				alert("통신실패")
			}
		});
	}

	function emailCon() {
		var eran = $("#emailConfirm").val();
		var eSpan = $("#emailConSpan");
		var email = $("#opt_email").val();
		var id = $("#idchk");
		if (ran == eran) {
			eSpan.html("인증완료!");
			$.ajax({
				type : "POST",
				url : "login.do?command=findId&email=" + email,
				dataType : "text",
				success : function(data) {
					findId = $.trim(data);
					console.log(findId);
					id.html(findId);
				},
				error : function() {
					alert("통신실패")
				}
			});
		} else {
			eSpan.html("다시 확인해주세요!");
		}
	}
</script>
</head>
<body>
	<h1>아이디 찾기</h1>
	<ul>
		<li><input type="text" id="opt_email" name="opt_email"> <input
			type="button" value="이메일 인증" onclick="emailChk()"> <span
			id="emailSpan"></span></li>
		<li><input type="text" id="emailConfirm" size="25"> <input
			type="button" value="확인" onclick="emailCon()"> <span
			id="emailConSpan"></span></li>
		<li><span id="idchk"></span></li>
	</ul>
</body>
</html>