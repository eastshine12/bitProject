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


<div class="container">
	<div class="row justify-content-center">
			<div class="col-md-8 col-md-offset-1">
			    <div class="card">
			        <div class="card-header">트레이너 회원가입</div>
			        <div class="card-body">
			
			            <form class="form-horizontal" method="post" action="#">
			
			               <div class="form-group">
			                    <label for="id" class="cols-sm-2 control-label">ID</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
			                            <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요." />
			                            <input type="button" class="btn btn-secondary" name="chkIdBtn" id="chkIdBtn" value="중복확인"/>
			                            <br>
			                            <p id="idCheck" style="font-size: 12px"></p>
			                        </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="password" class="cols-sm-2 control-label">비밀번호</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
			                            <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요." />
			                        </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="confirm" class="cols-sm-2 control-label">비밀번호 재확인</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
			                            <input type="password" class="form-control" name="pwd2" id="pwd2" placeholder="비밀번호를 다시 한번 입력하세요." />
			                            <p id="pwdCheck" style="font-size: 12px"></p>
			                        </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="username" class="cols-sm-2 control-label">이름</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
			                            <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요." />
			                        </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="phoneNum" class="cols-sm-4 control-label">전화번호</label>
			                    <div class="row">
				                    <div class="col-sm-2">
										<input type="text" class="form-control" name="phoneNum1" id="phoneNum1" value="010" />
				                    </div>
				                    -
				                    <div class="col-sm-3">
				                    	<input type="text" class="form-control" name="phoneNum2" id="phoneNum2" />
				                    </div>
				                    -
				                    <div class="col-sm-3">
				                    	<input type="text" class="form-control" name="phoneNum3" id="phoneNum3" />
				                    </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="email" class="cols-sm-2 control-label">이메일</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
			                            <input type="text" class="form-control" name="email" id="email" placeholder="이메일 주소를 입력하세요. ex) example@gmail.com" />
			                            <p id="emailCheck" style="font-size: 12px"></p>
			                        </div>
			                    </div>
			                </div>
							<div class="form-group">
								<label for="gender" class="cols-sm-2 control-label">성별</label>
								<div class="cols-sm-10">
									<div class="row">
										<div class="col-sm-3">
											<label class="radio-inline">
												<input type="radio" name="gender" value="F" checked="checked"> 여자
											</label>
										</div>
										<div class="col-sm-3">
											<label class="radio-inline">
												<input type="radio" name="gender" value="M"> 남자
											</label>
										</div>
									</div>
								</div>
							</div>


							<!-- 프로필 사진 -->
							<div class="form-group">
								<label class="cols-sm-2 control-label">프로필 사진</label>	
								<div class="row">
									<div class="col-sm-7">
										<img id="profileImg" style="width: auto; height: 150px; align-content: center;"/>
										&nbsp;<input type='file' id="imgInput"/>
									</div>
								</div>
							</div>
							
							<!-- 피트니스 센터 이름 -->
							<div class="form-group">
			                    <label for="gymName" class="cols-sm-2 control-label">센터명</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
			                            <input type="text" class="form-control" name="gymName" id="gymName" placeholder="운영 중인 피트니스 센터 이름을 적어주세요." />
			                        </div>
			                    </div>
			                </div>
							
							<!-- 소개글 -->
							<div class="form-group">
								<label class="cols-sm-2 control-label">소개글</label>
								<div class="cols-sm-8">
									<div class="row">
										<div class="col-sm-10">
											<textarea rows="10%" cols="50%" style="resize: none;" placeholder="트레이너 이력/자기소개를 적어주세요."></textarea>
										</div>
									</div>
								</div>
							</div>
							
							
							
				            <div class="form-group">
				            	<button type="button" class="btn btn-primary btn-lg btn-block login-button">회원 가입</button>
				            </div>
			                <div class="login-register">
			                    <a href="#">Login</a>
			                </div>
			            </form>
			        </div>
			
			    </div>
			</div>
	</div>
</div>


<script type="text/javascript">






/* 3/26 김동현 : 프로필 사진 미리보기 */
function readURL(input) {
 if (input.files && input.files[0]) {
  var reader = new FileReader();
  
  reader.onload = function (e) {
   $('#profileImg').attr('src', e.target.result);  
  }
  
  reader.readAsDataURL(input.files[0]);
  }
}
 
// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
$("#imgInput").change(function(){
   readURL(this);
});

</script>


</body>
</html>