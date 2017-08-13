<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 自定义标签库 -->
<%@ taglib prefix="smilezmh" uri="http://smilezmh.cn/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/messages_zh.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<title>账户管理</title>
</head>
<body>
<div id="wrapper">
	<div class="page-header">
		<h1 align="center">
			用户查询管理<span>&nbsp;&nbsp;</span><small>USER SEARCH&ADMIN</small>
		</h1>
	</div>

	<!-- 导航条 -->
	<div>
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>

			<%-- ${pageContext.request.contextPath }/addUser.action --%>

		
			<!--多条件查询  -->
			<li>
				<form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/multiSearch.action"
					method="post">
					<div class="form-group">
							<label for="customerName">用户名称</label> 
							<input type="text" class="form-control" id="customerName" value="${username }" name="username">
						</div>
					<div class="form-group">
						<label for="userFrom">国别</label>
						 <select class="form-control" id="userFrom" placeholder="请输入要查询用户的国别" name="home">
							<option value="">--请选择--</option>
							<c:forEach items="${home2}" var="item">
								<%-- <option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option> --%>
								<option value="${item}"
									<c:if test="${item == home1 }">selected </c:if>>${item}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="customerFrom">职业</label> 
						<select class="form-control" id="customerFrom" placeholder="请输入要查询用户的职业" name="pro">
							<option value="">--请选择--</option>
							<c:forEach items="${pro2}" var="item">
								<option value="${item}"
									<c:if test="${item == pro1 }">selected </c:if>>${item}</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-default">多条件查询</button>
					
				</form>
			</li>
			</ul>
		</div>
		<!-- /.navbar-collapse --> <!-- /.container-fluid --> </nav>

	</div>
	<div>
		<form id="itemsearch" cellpadding="2px" cellspacing="2px"
			align="center">
			<table class="table">
				<thead style="font-weight: bold;">
					<tr>
						<td>用户id</td>
						<td>用户名</td>
						<td>用户电话</td>
						<td>用户密码</td>
						<td>邮箱</td>
						<td>国别</td>
						<td>职业</td>

					</tr>
				</thead>
	<tbody>
				<c:forEach items="${page.rows}" var="row">
					<tr>

						<td>${row.id}</td>
						<td>${row.username}</td>
						<td>${row.telephone}</td>
						<td>${row.password}</td>
						<td>${row.email}</td>
						<td>${row.home}</td>
						<td>${row.pro}</td>
					<tr>
				</c:forEach>
</tbody>
			</table>
			<div class="col-md-12">
				<smilezmh:page url="${pageContext.request.contextPath}/multiSearch.action" />
				<a href="${pageContext.request.contextPath }/search.action"> 
					返回搜索主页</a>
			</div>
</form>
	</div>
</div>

</body>
</html>