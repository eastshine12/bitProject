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
<title>홈피트 Home-Fitness 회원가입</title>
</head>
<body>

<h2>회원가입</h2>


<div id="context">
	<div align="center">
		<h3>회원유형 선택</h3><br>
		<div style="float: left;">
			<div style="width: 280px; height: 280px; background-color: #BDBDBD;">
				<p style="padding-top : 80px; font-size: 22px; font: bold;">일반회원</p>
				<button type="button" id="normalRegi" class="btn btn-primary btn-lg" style="margin: 35px">가입하기</button>
			</div>
		</div>
		
		<div>
			<div style="width: 280px; height: 280px; background-color: #BDBDBD;">
				<p style="padding-top : 80px; font-size: 22px; font: bold;">트레이너</p>
				<button type="button" id="trainerRegi" class="btn btn-warning btn-lg" style="margin: 35px">가입하기</button>
			</div>
		</div>
	</div>
</div>




</body>

<script type="text/javascript">

$(function () {
	$("#normalRegi").click(function() {
		$.ajax({
			type: "GET",
			url: "normalRegi.jsp",
			dataType: "text",
			success: function(data) {
				$('#context').html(data);
			},
			error: function() {
				alert("normalRegi() error!");
			}
		});
	});
});


$(function () {
	$("#trainerRegi").click(function() {
		$.ajax({
			type: "GET",
			url: "trainerRegi.jsp",
			dataType: "text",
			success: function(data) {
				$('#context').html(data);
			},
			error: function() {
				alert("trainerRegi() error!");
			}
		});
	});
});



</script>

</html>