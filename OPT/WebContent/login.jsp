<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">


//아이디 검사 ---------------------------------------------------------------------------
//1. ID : 4~12자 이내의 영어와 숫자로 입력<br>
//2. 첫문자는 숫자로 시작할 수 없음.<br>
//3. Password : 4~12자 이내며, 입력 필수.<br><br>

function check() {
	
	

  if(fr.id.value == "") {

    alert("아이디를 입력해주세요");

    fr.id.focus();

    return false;

  }else if (fr.id.value.length < 4 || fr.id.value.length > 12){
   alert("아이디는 4~12자 이내로 입력 가능합니다!");

   fr.id.select();//입력한 문자를 선택 상태로 만듬.
   return false;
  
  }else if (!isNaN(fr.id.value.substr(0,1))) {
           alert("아이디는 숫자로 시작할 수 없습니다!");
           fr.id.select();
           return false;
  

  
  }else if(fr.pw.value == "") {

    alert("비밀번호를 입력해주세요");

    fr.pw.focus();

    return false;

  }else if(fr.pw.value.length < 4 || form.txtPwd.value.length > 12){
	  alert("비밀번호는 4~12자리이상 작성해주세요");
	  
	  fr.pw.focus();
	  
	  return false;
  }
  

}

</script>
</head>
<body>

	<form action="opt.do" method="post" onsubmit="return check()" name="fr">
		<input type="hidden" name="command" value="login" />
		<table border="1">
			<col width="100px">
			<col width="100px">
			<tr>
				<th>I D</th>
				<td><input type="text" placeholder="아이디" name="id"></td>
			</tr>
			<tr>
				<th>P W</th>
				<td><input type="text" placeholder="비밀번호" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="login" /> 
				<input type="button" value="regist" onclick="" /></td>
			</tr>
		</table>
	</form>
</body>
</html>