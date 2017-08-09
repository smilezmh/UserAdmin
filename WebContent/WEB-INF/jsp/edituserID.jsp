<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="js/messages_zh.js"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
<title>账户管理</title>
</head>
<body>

<div class="page-header">
  <h1 align="center">用户查询管理<span>&nbsp;&nbsp;</span><small>USER SEARCH&ADMIN</small></h1>
</div>



<div>
<form  id="itemsearch" cellpadding="2px" cellspacing="2px" align="center" action="${pageContext.request.contextPath }/editSuccess.action" >
	<table class="table" >
		<thead style="font-weight: bold;">
				<tr>
					<td>用户id</td>
					<td>用户名</td>
					<td>用户电话</td>
					<td>用户密码</td>
					<td>邮箱</td>
				
				</tr>
		</thead>	
	<tr>
	<td><input type="text" name="id" value="${item1.id }" readonly></td>
	<td><input type="text" name="username" value="${item1.username }"></td>
	<td><input type="text" name="telephone" value="${item1.telephone }"></td>
	<td><input type="text" name="password" value="${item1.password }"></td>
	<td><input type="text" name="email" value="${item1.email }"></td>
	
	</tr>
	
	
	</table>
	<tr>
	<input type="submit" class="btn btn-default" alligin="center" value="确认修改">
	</tr>
	
</form>
</div>
<div>

</div>
</div>
</body>
</html>