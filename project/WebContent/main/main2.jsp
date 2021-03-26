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
<link rel="stylesheet" type="text/css" href="../css/main.css">
<script type="text/javascript">

$('.navTrigger').click(function () {
    $(this).toggleClass('active');
    console.log("Clicked menu");
    $("#mainListDiv").toggleClass("show_list");
    $("#mainListDiv").fadeIn();

});

$(window).scroll(function() {
    if ($(document).scrollTop() > 50) {
        $('.nav').addClass('affix');
        console.log("OK");
    } else {
        $('.nav').removeClass('affix');
    }
});

</script>

<title>홈피트 Home-Fitness</title>
</head>
<body>

<div>
	<nav class="nav">
		<div class="container">
			<div class="logo">
				<a class="navbar-brand" href="nav.jsp"> <img src="../images/fitnessIcon.png" width="30" height="30" alt=""> HOME FIT</a>
			</div>
			<div id="mainListDiv" class="main_list">
				<ul class="navlinks">
					<li><a href="#">운동하기</a></li>
					<li><a href="#">운동일지</a></li>
					<li><a href="#">트레이너</a></li>
					<li><a href="#">커뮤니티</a></li>
				</ul>
			</div>
		<span class="navTrigger">
           <i></i>
           <i></i>
           <i></i>
		</span>
		</div>
	</nav>
</div>

<div class="jb-box">
	<video muted autoplay loop>
		<source src="https://videos.ctfassets.net/6jnflt57iyzx/173A96oWVHS9wSHrrzlWgK/e30e33508be5b74da6d87422f992ab5a/2207703341.mp4" type="video/mp4">
		<strong>Your browser does not support the video tag.</strong>
	</video>
</div>









</body>
</html>