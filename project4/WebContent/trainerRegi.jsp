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
			
			            <form class="form-horizontal" id="fileForm" method="post" action="#" enctype="multipart/form-data">
			
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
										<img id="imgInput" style="width: auto; height: 150px; align-content: center;"/>
										&nbsp;<input type='file' id="profileImg" name="profileImg"/>
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
											<textarea id="trainerContent" name="trainerContent" rows="10%" cols="50%" style="resize: none;" placeholder="트레이너 이력/자기소개를 적어주세요."></textarea>
										</div>
									</div>
								</div>
							</div>
							
							
				            <div class="form-group">
				            	<button type="button" id="regiBtn" class="btn btn-primary btn-lg btn-block login-button">회원 가입</button>
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

/* 프로필 사진 미리보기 */
function readURL(input) {
 if (input.files && input.files[0]) {
  var reader = new FileReader();
  
  reader.onload = function (e) {
   $('#imgInput').attr('src', e.target.result);  
  }
  
  reader.readAsDataURL(input.files[0]);
  }
}
 
$("#profileImg").change(function(){
   readURL(this);
});


/* 아이디 중복확인 버튼 클릭 */
$(function () {
	$("#chkIdBtn").click(function () {
		$.ajax({
			type: "post",
			url: "member?param=idCheck",
			data: { "id":$("#id").val() },
			success:function( data ){
			//	alert('chkIdBtn success');
				if(data.msg == "YES"){
					$("#idCheck").css("color", "#0000ff");
					$("#idCheck").html('사용 가능한 ID입니다.');
				}else{
					$("#idCheck").css("color", "#ff0000");
					$("#idCheck").html('이미 존재하는 ID입니다.');
					$("#id").val("");
				}
			},
			error:function(){
				alert('error');
			}			
		});
		
	});	
});


/* 이메일 본인 인증 버튼 클릭 */
$(function () {
	$("#emailBtn").click(function () {
		alert("본인 확인을 위한 이메일을 전송했습니다. 이메일 인증을 진행해주세요.")
		$.ajax({
			type: "post",
			url: "member?param=auth",
			data: { "email":$("#email").val() },
			success:function(data){
			},
			error:function(){
				alert('1 error');
			}			
		});
	});	
});



/* 비밀번호 2번 맞게 썼는지 확인 */
$(function () {
	$('#pwd2').blur(function(){
		if($('#pwd').val() != $('#pwd2').val()){
		    if($('#pwd2').val()!=''){
			$("#pwdCheck").css("color", "#ff0000");
			$("#pwdCheck").html('비밀번호가 일치하지 않습니다.');
			$('#pwd2').val('');				
			$('#pwd2').focus();
			}
		}
		else {
			$("#pwdCheck").html('');
		}
	})  	   
});



/* 이메일 형식 체크 */
$(function () {		
	let filter = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	$('#email').blur(function () {
	
		if(!filter.test($('#email').val())) {
			$("#emailCheck").css("color", "#ff0000");
			$("#emailCheck").html('이메일 형식이 올바르지 않습니다.');
		}
		else {
			$("#emailCheck").html('');
		}
	})
});



/* 회원가입 버튼 클릭 */
$(function () {
	$("#regiBtn").click(function () {
		
		/* 필수 입력 사항 체크 */
		if($("#id").val() == null || $("#id").val() == "" ||
			$("#pwd").val() == null || $("#pwd").val() == "" ||
				$("#name").val() == null || $("#name").val() == "" ||
					$("#phoneNum1").val() == null || $("#phoneNum1").val() == "" ||
							$("#phoneNum2").val() == null || $("#phoneNum2").val() == "" ||
								$("#phoneNum3").val() == null || $("#phoneNum3").val() == "" ||
									$("#email").val() == null || $("#email").val() == "" ||
									$("#profileImg").val() == null || $("#profileImg").val() == "" ||
									$("#gymName").val() == null || $("#gymName").val() == "" ||
									$("#trainerContent").val() == null || $("#trainerContent").val() == "") {
			alert('필수 입력 항목이 비어있습니다.');
			return;
		}
		
		
		/* 파일 업로드 되게  */
		let formData = new FormData($('#fileForm')[0]);
		//formData.append("fileObj", $('#profileImg')[0].files[0]);
	
		
		/* 선택사항 입력 안하면 0으로 처리 */ 
		if($("#age").val() == null || $("#age").val() == ""){
			$("#age").val(0);
		}
		if($("#height").val() == null || $("#height").val() == ""){
			$("#height").val(0);
		}
		if($("#weight").val() == null || $("#weight").val() == ""){
			$("#weight").val(0);
		}
		if($("#gWeight").val() == null || $("#gWeight").val() == ""){
			$("#gWeight").val(0);
		}
			
		
		$.ajax({
			type: "post",
			enctype: 'multipart/form-data',
			url: "member?param=normalRegi",
			data: formData,
			processData: false,
			contentType: false,
			success:function(data){
				//alert('regiBtn success');
				if(data.msg == "YES"){
					alert('회원가입이 정상적으로 처리되었습니다.');
					location.href = "main.jsp";
				}else{
					alert('오류가 발생했습니다.');
				}

			},
			error:function(){
				alert('error.');
			}			
		});
		
	});	
});




</script>


</body>
</html>