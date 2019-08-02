<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%
	String res = request.getParameter("res");
	if(res == null) {res = "";}
	
	String cValue="";
	Cookie[] cookies = request.getCookies();
    
	if(cookies != null){
	    for(int i=0; i < cookies.length; i++) {
			Cookie co = cookies[i] ;
			// 저장된 쿠키 이름을 가져온다
			String cName = co.getName();
			if(cName.equals("idSave")){
				// 쿠키값을 가져온다
				cValue = co.getValue();
			}
		}	
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LOGIN</title>
	<link href="css/login.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		//아이디 검사 ---------------------------------------------------------------------------
		//1. ID : 4~12자 이내의 영어와 숫자로 입력
		//2. 첫문자는 숫자로 시작할 수 없음.
		//3. Password : 4~12자 이내며, 입력 필수.
		function check() {
			if(fr.id.value == "") { // 아이디 안적음
				$("#idCheck").text("아이디를 입력해주세요");
				$("#idCheck").css("display", "");
				fr.id.focus(); // 아이디 입력 상자에 포커스
				return false;
			} else if(fr.id.value.length < 4 || fr.id.value.length > 12){ // 아이디 4~12자리로 제한
				$("#idCheck").text("아이디는 4~12자 이내로 입력 가능합니다!");
				$("#idCheck").css("display", "");  
				fr.id.focus(); // 아이디 입력 상자에 포커스
				return false;
			} else if(!isNaN(fr.id.value.substr(0,1))) { // 아이디 시작을 숫자로 할 경우
				$("#idCheck").text("아이디는 숫자로 시작할 수 없습니다!");
				$("#idCheck").css("display", "");  
				fr.id.focus(); // 아이디 입력 상자에 포커스
				return false;
			} else if(fr.pw.value == "") { // 비밀번호 미입력
				$("#pwCheck").text("비밀번호를 입력해주세요");
				$("#pwCheck").css("display", "");
				fr.pw.focus();
				return false;
			}else if(fr.pw.value.length < 4 || fr.pw.value.length > 12){ // 비밀번호 4~12자리로 제한
				$("#pwCheck").text("비밀번호는 4~12자리이상 작성해주세요");
				$("#pwCheck").css("display", "");
				fr.pw.focus();
				return false;
			}

			if($("input:checkbox[name='id_save']").is(":checked") == true) {
				$("input[name='hidden_chk']").val("Y");
			} else {
				$("input[name='hidden_chk']").val("N");
			}
		}  

		// check() 함수에서 실행된 빨간 글자를 아이디/비밀번호 입력 시작시 다시 지움
		function checkData(flag){
			// 아이디 입력시
			if(flag == "id") {
				var id = $("input[name=id]");
				if(id.val().trim() != "") {
					$("#idCheck").css("display", "none");
				}
			} else {
			// 비밀번호 입력시
				var pw = $("input[name=pw]");
				if(pw.val().trim() != ""){
					$("#pwCheck").css("display","none");
				}
			}
			// 아이디와 비밀번호를 확인해주세요 글자 삭제
			$("#resultText").css("display","none");
		}
</script>
</head>
<% String Flag = request.getParameter("Flag"); %>
<body>
	<div class="login_content">
	<fieldset class="login_form" style="border: 0px;">
		<legend class="blind">로그인</legend>
		<form action="opt.do" method="post" onsubmit="return check()" name="fr">
			<input type="hidden" name="command" value="login" />
			<input type="hidden" name="Flag" value="<%=Flag%>">
			<input type="hidden" name="hidden_chk" value=""/>
			<div class=id_area>	
				<span class="input_box">
					<input type="text" placeholder="아이디" name="id" id="userId" onkeyup="checkData('id');" class="id_pw" value=<%=cValue %> >
					<span id="idCheck" style="display:none" class="idchk_span"></span>
				</span>
			</div>
			<div class="pw_area">
				<input type="text" placeholder="비밀번호" name="pw" onkeyup="checkData('pw');" class="id_pw" >
				<span id="pwCheck" style="display:none" class="idchk_span"></span>
			</div>
				
		<% if(res.equals("fail")){ %>
			<span id="resultText" class="idchk_span">아이디와 비밀번호를 확인해주세요</span>
		<% } %>

			<div class="checks etrans">
			<% if(cValue == "" || cValue == null) { %>
	  			<input type="checkbox" id="ex_chk3" name="id_save" /> 
	 			<label for="ex_chk3">아이디저장</label>
			<% } else { %>
				<input type="checkbox" id="ex_chk3" name="id_save" checked="checked"/> 
	 			<label for="ex_chk3">아이디저장</label>
			<% } %>
			</div>
			<input type="submit" value="로그인" class="login_btn"/> 
			<input type="button" value="회원가입" onclick="" class="regist_btn"/>
		</form>
	</fieldset>
	</div>
</body>
</html>