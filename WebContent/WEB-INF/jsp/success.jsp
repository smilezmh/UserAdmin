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
<script type="text/javascript">
		$(function () {
	  $('[data-toggle="popover"]').popover()
	})
		//改变flag值
		function changeFlag(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/123.action",
				type:"post",
				data:{"id":id},
				success:function(data){
					 window.location.href="${pageContext.request.contextPath}/search.action?";
				}
			});
		}
		//删除
		function deleteItem(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/deleteFunction.action",
				type:"post",
				data:{"id":id},
				success:function(data){
					window.location.reload();
				}
			});
		}
		//进行修改页面跳转显示，跳了几次写的有点繁琐
		function editUSER(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/editFunction.action",
				type:"post",
				data:{"id":id},
				success:function(data){
					alert("要修改的用戶是："+data.username);
					var idi=data.id;
					 window.location.href="${pageContext.request.contextPath}/editUser.action?id="+idi;
					
				}
			});
		}
		//这种方式对于传送json格式字符串有用
 	/* function addUser(){
			var params='{"username"="zhangsan","address"="chengdu","age"=25}'
	 		
			$.ajax({
				url:"${pageContext.request.contextPath}/addUser.action",
				data:params,
				type:"post",
				contentType : "application/json;charset=UTF-8",//发送数据的格式
				success:function(data){
					alert("客户信息更新成功！");
					window.location.reload();
				}
			});
		}   */
		//添加用户，将用户对象以json格式字符传给controller对象
	function addUser() {
			$.post("<%=basePath%>addUser.action",$("#add_user").serialize(),function(data){
				alert("添加用户成功！");
				window.location.reload();
			}); 
		}
		
	</script>

<title>账户管理</title>
</head>
<body>

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
			
			<%-- ${pageContext.request.contextPath }/addUser.action --%>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">功能
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">

							<li><a href="${pageContext.request.contextPath}/deleteManyJsp.action">批量删除</a></li>
							<li><a href="${pageContext.request.contextPath}/deleteManyJsp.action">批量修改</a></li>
							<li class="divider"></li>
							<li><a href="#" data-toggle="modal"
								data-target="#userAddDialog">增加用户</a></li>
							<li><a href="${pageContext.request.contextPath}/multiSearch.action" >多条件查询</a></li>
						</ul>
					</li>
					<!--ID查询  -->
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li>
						<form class="navbar-form navbar-left" role="search"
							action="${pageContext.request.contextPath}/selectID.action">
							
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="输入要查询的用户的id" name="id">
								<button type="submit" class="btn btn-default">ID查询</button>
							</div>
						</form>
					</li>
					
				</ul>
			</div>
			<!-- /.navbar-collapse -->
					<!-- /.container-fluid --> </nav>
		
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
						<td>使用状态</td>
						<td>操作</td>

					</tr>
				</thead>

				<c:forEach items="${page.rows}" var="item">
					<tr>

						<td>${item.id}</td>
						<td>${item.username}</td>
						<td>${item.telephone}</td>
						<td>${item.password}</td>
						<td>${item.email}</td>
						<td>${item.home}</td>
						<td>${item.pro}</td>
						<td><c:if test="${item.flag == 1}">已启用</c:if> 
						<c:if test="${item.flag ==0 }">已禁用</c:if></td>
						<td><c:if test="${item.flag == 1}">
								<a href="#" onclick="changeFlag(${item.id})">禁用</a>
								<%-- 	<a href="${pageContext.request.contextPath}/editUser.action?id=${item.id}">编辑</a> --%>
								<a href="#" onclick="editUSER(${item.id})">编辑</a>
							</c:if> <c:if test="${item.flag == 0}">
								<a href="#" onclick="changeFlag(${item.id})">启用</a>
								<a href="#" onclick="deleteItem(${item.id})">删除</a>
							</c:if></td>
					<tr>
				</c:forEach>
				
			</table>
				<div class="col-md-12">
			<smilezmh:page url="${pageContext.request.contextPath}/search.action"/>
				</div>
		</form>
	
	
	
	</div>
	
	


	<!--增加新用户动态弹出  -->
	<div class="modal fade" id="userAddDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">增加新用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_user">


						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_username"
									placeholder="用户名" name="username">
							</div>
						</div>

						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_email"
									placeholder="邮箱" name="email">
							</div>
						</div>
						<div class="form-group">
							<label for="jklj" class="col-sm-2 control-label">电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_telephone"
									placeholder="电话" name="telephone">
							</div>
						</div>
						<div class="form-group">
							<label for="jljl" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_password"
									placeholder="密码" name="password">
							</div>
						</div>
						<div class="form-group">
							<label for="jljl" class="col-sm-2 control-label">国别</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_home"
									placeholder="国别" name="home">
							</div>
						</div>
						<div class="form-group">
							<label for="jljl" class="col-sm-2 control-label">职业</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_home"
									placeholder="密码" name="pro">
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button"  class="btn btn-default" onclick="addUser()">确定添加</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <!--编辑新用户动态弹出 
	<div class="modal fade" id="userAddDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">编辑用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_user">


						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_username"
									placeholder="用户名" name="username">
							</div>
						</div>

						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_email"
									placeholder="邮箱" name="email">
							</div>
						</div>
						<div class="form-group">
							<label for="jklj" class="col-sm-2 control-label">电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_telephone"
									placeholder="电话" name="telephone">
							</div>
						</div>
						<div class="form-group">
							<label for="jljl" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_password"
									placeholder="密码" name="password">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary"
								onclick="editUser()">确定添加</button>
						</div>
				</div>
			</div>
		</div>
	</div> -->
	
	
		
</body>
</html>