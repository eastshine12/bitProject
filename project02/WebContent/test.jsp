<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<title>Insert title here</title>
</head>
<body>



<input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요." />
<input type="button" class="btn btn-secondary" name="chkIdBtn" id="chkIdBtn" value="중복확인"/>
<p id="idcheck" style="font-size: 8px"></p>



</body>



<script type="text/javascript">



$(function () {
	$("#chkIdBtn").click(function () {
		$.ajax({
			type: "post",
			url: "/member?param=idcheck",
			data: { "id":$("#id").val() },
			success:function( data ){
				alert('chkIdBtn success');
			//	alert(data.msg);
				if(data.msg == "YES"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").html('사용할 수 있는 id입니다');
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").html('사용할 수 없는 id입니다');
					$("#id").val("");
				}
			},
			error:function(){
				alert('error');
			}			
		});
		
	});	
});




</script>
</html>