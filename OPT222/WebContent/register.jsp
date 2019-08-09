<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- jquery api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 다음 주소 api -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- 달력 api -->
<meta charset="UTF-8">
<title>register</title>
</head>
<script type="text/javascript">
	function validate() {
		var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
		var re2 = /^[a-zA-Z0-9]{4,15}$/; // 이메일이 적합한지 검사할 정규식

		var pw = $("#opt_pw").val();
		var email = $("#opt_email").val();

		if (join.opt_id.value == "") {
			alert("아이디 중복체크 해주세요");
			join.opt_id.focus();
			return false;
		}
		if (join.opt_pw.value == "") {
			alert("비밀번호를 입력해 해주세요");
			join.opt_id.focus();
			return false;
		}
		
		if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
			return false;
		}

		if (join.opt_pw.value != join.checkpw.value) {
			alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
			join.checkpw.value = "";
			join.checkpw.focus();
			return false;
		}
		if (join.opt_name.value == "") {
			alert("이름을 입력해 주세요");
			join.opt_name.focus();
			return false;
		}

		if (join.opt_birth.value == "") {
			alert("생년월일 입력해 주세요");
			join.opt_birth.focus();
			return false;
		}
		if (join.opt_phone.value == "") {
			alert("전화번호를 입력해 주세요");
			join.opt_phone.focus();
			return false;
		}
		if (join.opt_addr.value == "") {
			alert("주소 입력해 주세요");
			join.opt_addr.focus();
			return false;
		}

		if (email.value == "") {
			alert("이메일을 입력해 주세요");
			email.focus();
			return false;
		}
		if (emailConfirm.value == "") {
			alert("이메일 인증을 해주세요");
			emailConSpan.focus();
			return false;
		}

		if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
			return false;
		}

		if (join.opt_gender.value == "") {
			alert("성별을 체크해 주세요");
			return false;
		}

		alert("회원가입이 완료되었습니다.");
	}

	function check(re, what, message) {
		if (re.test(what.value)) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
	}

	function idCheck() {
		window.open("idCheck.jsp", "", "width=300px; height=300px;");
	};

	var ran = null;
	
	function emailChk() {
		var email = $("#opt_email").val() + $("#str_email").val();
		var emailSpan = $("#emailSpan");

		$.ajax({
			type : "POST",
			url : "login.do?command=ChkEmail&email=" + email,
			dataType : "text",
			success : function(data) {
				var trm = $.trim(data);
				if (email.length != 0) {
					if (trm == email) {
						emailSpan.html("이미 존재하는 이메일 입니다.");
					} else {
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
		if (ran == eran) {
			eSpan.html("인증완료!");
		} else {
			eSpan.html("다시 확인해주세요!");
		}
	}

	function DaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fullRoadAddr = data.roadAddress;
				var extraRoadAddr = '';
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				document.getElementById('postcode').value = data.zonecode;
				document.getElementById('roadAddress').value = fullRoadAddr;
			}
		}).open();
	}

	$(function() {
		$("#opt_birth").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$('#selectEmail').change(function() {
			$("#selectEmail option:selected").each(function() {
				if ($(this).val() == '1') {
					$("#str_email").val('');
					$("#str_email").attr("disabled", false);
				} else {
					$("#str_email").val($(this).text());
					$("#str_email").attr("disabled", false);
				}
			});
		});
	})
</script>
<body>
	<h1>SIGN UP</h1>
	<form action="login.do" method="get" name="join" onsubmit="return validate()" >
	<input  type="hidden" name="command" value="register"/>
		<table>
			<tr>
				<td><b>아이디</b></td>
				<td>
					<input type="text" id="opt_id" name="opt_id" onclick="idCheck()" readonly="readonly" placeholder="4-12자의 영문 대소문자 숫자" size="25"/>
					<input type="button" value="중복체크" onclick="idCheck()" /></td>
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
				<td><input type="password" id="opt_pw" name="opt_pw" size="25"></td>
			</tr>
			<tr>
				<td><b>비빌번호 확인</b></td>
				<td><input type="password" id="checkpw" name="checkpw" size="25"></td>
			</tr>
			<tr>
				<td><b>이 름</b></td>
				<td><input type="text" id="opt_name" name="opt_name" size="25"></td>
			</tr>
			<tr>
				<td><b>생년월일</b></td>
				<td><input type="text" id="opt_birth" name="opt_birth" readonly="readonly" size="25"></td>
			</tr>
			<tr>
				<td><b>전화번호</b></td>
				<td><input type="text" id="opt_phone" name="opt_phone" size="25"></td>
			</tr>
			<tr>
				<td><b>주 소</b></td>
				<td>
					<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly" size="25">
				  	<input type="button" value="우편번호 찾기" onclick="DaumPostcode()"><br>
					<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly="readonly" size="25">
					<input type="text" name="opt_addr" checked="checked" placeholder="상세주소" size="25"/></td>
			</tr>
			<tr>
				<td><b>이메일</b></td>
				<td>
					<input type="text" id="opt_email" name="opt_email">
					<input type="text" name="opt_email_addr" id="str_email"	value="@naver.com">
						<select id="selectEmail">
							<option value="1">직접입력</option>
							<option value="naver.com" selected>@naver.com</option>
							<option value="nate.com">@nate.com</option>
							<option value="hanmail.net">@hanmail.net</option>
							<option value="gmail.com">@gmail.com</option>
						</select>
					<input type="button" value="이메일 인증" onclick="emailChk()"> <span id="emailSpan"></span></td>
			</tr>
			<tr>
				<td><b>인증번호</b></td>
				<td>
					<input type="text" id="emailConfirm" size="25">
					<input type="button" value="확인" onclick="emailCon()"> <span id="emailConSpan"></span></td>
			</tr>
			<tr>
				<td><b>성 별</b></td>
				<td>
					<input type="radio" name="opt_gender" value="male" />남성
				    <input type="radio" id="opt_gender"	name="opt_gender" value="female" /> 여성
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="회원가입" > <input type="reset" value="다시입력"></td>
			</tr>
		</table>
	</form>
</body>
</html>