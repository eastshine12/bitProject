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
<title>홈피트 Home-Fitness 회원가입</title>
</head>
<body>


<div class="container">
	<div class="row justify-content-center">
			<div class="col-md-8">
			    <div class="card">
			        <div class="card-header">일반회원 가입</div>
			        <div class="card-body">
			
			            <form method="post" action="#">
			
			                <div class="form-group">
			                    <label for="id" class="cols-sm-2 control-label">ID</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
			                            <input type="text" class="form-control" name="name" id="name" placeholder="아이디를 입력하세요." />
			                            <input type="button" class="btn btn-secondary" name="name" id="name" value="중복확인"/>
			                        </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="password" class="cols-sm-2 control-label">비밀번호</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
			                            <input type="password" class="form-control" name="email" id="email" placeholder="비밀번호를 입력하세요." />
			                        </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="confirm" class="cols-sm-2 control-label">비밀번호 재확인</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
			                            <input type="password" class="form-control" name="email" id="email" placeholder="비밀번호를 다시 한번 입력하세요." />
			                        </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="username" class="cols-sm-2 control-label">이름</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
			                            <input type="text" class="form-control" name="username" id="username" placeholder="이름을 입력하세요." />
			                        </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="phoneNum" class="cols-sm-10 control-label">전화번호</label>
			                    <div class="cols-sm-1">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
			                            <input type="text" class="form-control" name="password" id="password" placeholder="010" />
			                        </div>
			                    </div>
			                    <div class="cols-sm-3">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
			                            <input type="text" class="form-control" name="password" id="password" placeholder="전화번호를 입력하세요." />
			                        </div>
			                    </div>
			                    <div class="cols-sm-3">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
			                            <input type="text" class="form-control" name="password" id="password" placeholder="전화번호를 입력하세요." />
			                        </div>
			                    </div>
			                </div>
							<div class="form-group">
								<label class="cols-sm-2 control-label">성별</label>
								<div class="cols-sm-10">
									<div class="row">
										<div class="col-sm-3">
											<label class="radio-inline">
												<input type="radio" name="gender" value="Female" checked="checked"> 여자
											</label>
										</div>
										<div class="col-sm-3">
											<label class="radio-inline">
												<input type="radio" name="gender" value="Male"> 남자
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-16 panel panel-heading">&nbsp;&nbsp;다양한 서비스를 위해 아래 몇 가지 정보를 추가로 입력하세요.</div>
									<div class="col-md-4 panel panel-heading" style="display:none; color:red" id="address_error"></div>
								</div>
							</div>
			                <div class="form-group">
			                    <label for="confirm" class="cols-sm-2 control-label">키</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
			                            <input type="number" class="form-control" name="height" id="height" placeholder="키 (cm)" />
			                        </div>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label for="confirm" class="cols-sm-2 control-label">몸무게</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
			                            <input type="number" class="form-control" name="weight" id="weight" placeholder="몸무게 (kg)" />
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



</body>
</html>