<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<script>
    $(function () {
        $("input[type=radio]").click(function () {
            var filetype = $(this).val();
            if (filetype == "개인동영상") {
                $("#videotype").html("<input type='file' name='video_url' required='required'>");
                $("#videoFrm").attr({
                    method: "post",
                    enctype: "multipart/form-data"
                });
            } else if (filetype == "유튜브") {
                $("#videotype").html("<input type='text' name='video_url' required='required'>");
                $("#videoFrm").attr({
                    method: "GET",
                    enctype: ""
                });

            }
        })

    })
</script>

<body>
    <form id="videoFrm" action="video.do" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="command" value="videoupload">
    	<input type="hidden" name="videoarea" value="main">
        <input type="hidden" name="opt_no_seq" value="${ memdto.opt_no_seq}">
        <h1>${ memdto.opt_id}님 비디오 등록사이트 입니다.</h1>
        <table>
            <tr>
                <th>비디오 제목</th>
                <td><input type="text" name="video_title" required="required"></td>
            </tr>
            <tr>
                <th>비디오 내용</th>
                <td><input type="text" name="video_content" required="required"></td>
            </tr>
            <tr>
                <th>비디오</th>
                <td id="videotype"></td>
            </tr>
            <tr>
                <td><input type="submit" value="비디오 등록" /> <input type="reset" value="리셋" /></td>
            </tr>

            <tr>
                <td>
                    <input name="type" type="radio" value="유튜브">유튜부
                    <input name="type" type="radio" value="개인동영상" />개인동영상
                <td>
            </tr>
        </table>
    </form>
</body>
</html>