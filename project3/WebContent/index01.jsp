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
<!-- CSS 파일 불러오기 -->
<link rel="stylesheet" type="text/css" href="./css/main.css">
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

</head>

<body>


<nav class="nav">
	<div class="container">
		<div class="logo">
			<a class="navbar-brand" href="#">TITLE</a>
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
    
    <div class="jb-box">
		<video muted autoplay loop>
	        <source src="https://videos.ctfassets.net/6jnflt57iyzx/173A96oWVHS9wSHrrzlWgK/e30e33508be5b74da6d87422f992ab5a/2207703341.mp4" type="video/mp4">
	        <strong>Your browser does not support the video tag.</strong>
		</video>
	</div>






<div class="container" >

   <nav class="navbar navbar-expand-lg bg-light navbar-light" style="width: 100%">
    
    <a class="navbar-brand" href="#">MAIN</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#naviChange" aria-controls="naviChange" aria-expanded="false" aria-label="네비게이션 전환">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="naviChange">
      <ul class="navbar-nav mr-auto">
      
        <li class="nav-item active dropdown" >
          <a id="len1" class="nav-link" href="#" id="navbardrop" data-toggle="dropdown">운동하기</a>
             <div class="dropdown-menu">
                 <a class="dropdown-item" href="#">나의 루틴</a>
              <a class="dropdown-item" href="#">운동 선택</a>
              <a class="dropdown-item" href="#">부위 선택</a>
                 <a class="dropdown-item" href="#">난이도 선택</a>
            </div>
        </li>
        <li class="nav-item active dropdown">
          <a id="len2" class="nav-link" href="#" id="navbardrop" data-toggle="dropdown">운동일지</a>
             <div class="dropdown-menu">
                 <a class="dropdown-item" href="#">운동 캘린더</a>
              <a class="dropdown-item" href="#">체중량 그래프</a>
            </div>
        </li>
        <li class="nav-item active dropdown">
          <a id="len3" class="nav-link" href="#" id="navbardrop" data-toggle="dropdown">트레이너</a>
             <div class="dropdown-menu">
                 <a class="dropdown-item" href="#">이용 방법</a>
              <a class="dropdown-item" href="#">트레이너 소개</a>
            </div>
        </li>
         <li class="nav-item active dropdown">
          <a id="len4" class="nav-link" href="#" id="navbardrop" data-toggle="dropdown">커뮤니티</a>
             <div class="dropdown-menu">
                 <a class="dropdown-item" href="#">자유게시판</a>
              <a class="dropdown-item" href="#">Q&A</a>
              <a class="dropdown-item" href="#">Link 3</a>
            </div>
        </li>
      </ul>
    </div>
  </nav>

</div>

<br><br>

</body>


</html>