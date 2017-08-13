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
  <h1 align="center">修改后显示 <small>USER ALTER DISPLAY</small></h1>
</div>
<!-- 导航条 -->


<div>
<div>
<form id="itemsearch" cellpadding="2px" cellspacing="2px" align="center" >
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
				<td>${item2.id}</td>
				<td>${item2.username}</td>
				<td>${item2.telephone}</td>
				<td>${item2.password}</td>
				<td>${item2.email}</td>
				</tr>
			
	</table>
</form>
</div>
<a href="${pageContext.request.contextPath }/search.action"> 
					返回搜索主页</a>
</body>
</html>