<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">

body {
        background: #f8f8f8;
        padding-top: 5em;           
    }
    
    #login-form > div {
        margin: 15px 0;
    }


</style>


</head>
<body>

<div class="container" align="center">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">      
            <div class="panel-heading">
                  <h6 class="display-4 font-weight-bold" style="margin-bottom: 50px" >Home Fit</h6>
                 <div class="panel-title">환영합니다 !</div>
            </div>
            
            <div class="panel-body" >
                <form id="login-form">
                
                   <!-- 아이디 텍스트 -->
                    <div>
                       <input type="text" id="id" class="form-control" name="username" placeholder="ID" autofocus>
                    </div>
                    <!-- 비밀번호 텍스트 -->
                    <div>
                       <input type="password" id="pwd" class="form-control" name="password" placeholder="Password">
                    </div>
                    
                    <!-- 로그인 회원가입 버튼 -->
                    <div>
                        <button id="loginBtn" type="button" class="form-control btn btn-primary" >로그인</button>
                        <button id="regiBtn" type="button" class="form-control btn btn-primary" style="margin-top: 10px" >회원 가입</button>        
                    </div>
                    
                    <!-- id 기억 체크박스 -->
                    <div class="custom-control custom-switch">   
                   <input type="checkbox" class="custom-control-input" id="myid" checked="checked">
                   <label class="custom-control-label" for="myid" >Remember ID</label>
               </div>
               
                <p class="text-primary"><a href="#">비밀번호를 잊어 버리셨나요?</a></p>
                    
                </form>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">

$(function () {
	$('#loginBtn').click(function() {
		
	})
});



</script>



</html>