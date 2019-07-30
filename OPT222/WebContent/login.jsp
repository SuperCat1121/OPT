<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%
	String res = request.getParameter("res");
	if(res == null) {res = "";}
	
	String cValue="";
	Cookie[] cookies = request.getCookies();
    
	if(cookies != null){
	    
	    for(int i=0; i < cookies.length; i++){
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
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">

//아이디 검사 ---------------------------------------------------------------------------
//1. ID : 4~12자 이내의 영어와 숫자로 입력
//2. 첫문자는 숫자로 시작할 수 없음.
//3. Password : 4~12자 이내며, 입력 필수.
function check() {
  if(fr.id.value == "") {
	$("#idCheck").text("아이디를 입력해주세요");
	$("#idCheck").css("display", "");

    fr.id.focus();

    return false;

  }else if (fr.id.value.length < 4 || fr.id.value.length > 12){
	$("#idCheck").text("아이디는 4~12자 이내로 입력 가능합니다!");
	$("#idCheck").css("display", "");  

   fr.id.focus();//입력한 문자를 선택 상태로 만듬.
   
   return false;
  }else if (!isNaN(fr.id.value.substr(0,1))) {
	$("#idCheck").text("아이디는 숫자로 시작할 수 없습니다!");
	$("#idCheck").css("display", "");  
           
    fr.id.focus();
  
    return false;
  }else if(fr.pw.value == "") {
	$("#pwCheck").text("비밀번호를 입력해주세요");
	$("#pwCheck").css("display", "");  

    fr.pw.focus();

    return false;
  }else if(fr.pw.value.length < 4 || fr.pw.value.length > 12){
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
  

function checkData(flag){
	if(flag == "id") {
		var id = $("input[name=id]");
		if(id.val().trim() != "") {
			$("#idCheck").css("display", "none");
		}
	} else {
		//비밀번호
		var pw = $("input[name=pw]");
		if(pw.val().trim() != ""){
			$("#pwCheck").css("display","none");
		}
	}
	$("#resultText").css("display","none");
}
</script>
</head>
<body>
	<div class="login_content">
	<fieldset class="login_form" style="border: 0px;">
		<legend class="blind">로그인</legend>
		<form action="opt.do" method="post" onsubmit="return check()" name="fr">
			<input type="hidden" name="command" value="login" />
<%
	String my = request.getParameter("mypageFlag");
%>			
			
			<input type="hidden" name="mypageFlag" value="<%=my%>">
			<input type="hidden" name="hidden_chk" value=""/>
			<div class=id_area>	
				<span class="input_box">
				<input type="text" placeholder="아이디" name="id" id="userId" onkeyup="checkData('id');" class="id_pw" value=<%=cValue %> ><span id="idCheck" style="display:none" class="idchk_span"></span>
				</span>
			</div>
			<div class="pw_area">
				<input type="text" placeholder="비밀번호" name="pw" onkeyup="checkData('pw');" class="id_pw" ><span id="pwCheck" style="display:none" class="idchk_span"></span>
			</div>
				
		<% if(res.equals("fail")){ %>
			<span id="resultText" class="idchk_span">아이디와 비밀번호를 확인해주세요</span>
		<% } %>	 
				
			<div class="checks etrans">
			<% if(cValue == "" || cValue == null){ %>
	  			<input type="checkbox" id="ex_chk3" name="id_save" /> 
	 			<label for="ex_chk3">아이디저장</label>
			<% } else { %>
				<input type="checkbox" id="ex_chk3" name="id_save" checked="checked"/> 
	 			<label for="ex_chk3">아이디저장</label>
			<%} %>
			</div>
			
			<input type="submit" value="로그인" class="login_btn"/> 
			<input type="button" value="회원가입" onclick="" class="regist_btn"/>
		</form>
	</fieldset>
	</div>
</body>
</html>