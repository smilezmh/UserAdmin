
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1">	
		<title>修改密码</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="js/messages_zh.js"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<style>
			body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
.container .row div {
	/* position:relative;
				 float:left; */
}
font {
	color: #666;
	font-size: 22px;
	font-weight: normal;
	padding-right: 17px;
</style>

</head>
<body>

	<div class="container"
		style="width: 100%; height: 550px; background: #FF2C4C url('images/loginbg.jpg') no-repeat;">
		<div class="row">
			<div class="col-md-5">
				<!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
			</div>

			<div class="col-md-7">
				<div
					style="width: 600px; border: 1px solid #E7E7E7; padding: 27px 0 2px 30px; border-radius: 5px; margin-top: 47px; background: #fff;">
					<font>用户修改密码</font>EDIT USER        <span>${word1}</span>
					<div>&nbsp;</div>
					<form class="form-horizontal" action="${pageContext.request.contextPath }/refresh.action" method="post" id="register">
						<div class="form-group">
							<label for="username" class="col-sm-3 control-label">用户名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="username" name="username2" value="${user.username}"
									placeholder="请输入用户名">
							</div>
						</div>
						
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">新密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control"  name="password2" value="${user.password}"
									placeholder="请输入密码">
							</div>
						</div>
							<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">确认新密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control"  name="password"  
									placeholder="请确认新密码 ">
							</div>
							</div>
							
							
						<div class="form-group">
						<div class="col-sm-offset-4 col-sm-8">
							<input type="submit" width="100" value="修改" name="submit"
								style="background: url('images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						<span>${word}</span></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</ul>
	</body>
</html>

