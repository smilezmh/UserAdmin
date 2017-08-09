<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="js/messages_zh.js"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
		function changeFlag(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/123.action",
				type:"post",
				data:{"id":id},
				success:function(data){
					window.location.reload();
				}
			});
		}
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
		function editUSER(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/editFunction.action",
				type:"post",
				data:{"id":id},
				success:function(data){
					alert(data.username);
					var idi=data.id;
					 window.location.href="${pageContext.request.contextPath}/editUser.action?id="+idi;
				}
			});
		}
	</script>

<title>账户管理</title>
</head>
<body>

<div class="page-header">
  <h1 align="center">用户查询管理<span>&nbsp;&nbsp;</span><small>USER SEARCH&ADMIN</small></h1>
</div>

<!-- 导航条 -->
<div>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">功能 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/selectID.action">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="输入要查询的用户的id" name="id" >
        </div>
        <button type="submit" class="btn btn-default">查询</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>

<div>
<form  id="itemsearch" cellpadding="2px" cellspacing="2px" align="center" >
	<table class="table" >
		<thead style="font-weight: bold;">
				<tr>
					
					<td>用户id</td>
					<td>用户名</td>
					<td>用户电话</td>
					<td>用户密码</td>
					<td>邮箱</td>
					<td>使用状态</td>
					<td>操作</td>
				
				</tr>
		</thead>	
			
			<c:forEach items="${itemlist}" var="item">
			<tr>
				
				<td>${item.id}</td>
				<td>${item.username}</td>
				<td>${item.telephone}</td>
				<td>${item.password}</td>
				<td>${item.email}</td>
				<td>
					<c:if test="${item.flag == 1}">已启用</c:if>
					<c:if test="${item.flag ==0 }">已禁用</c:if>
				</td>
 				<td>
				<c:if test="${item.flag == 1}">
				<a href="#"   onclick="changeFlag(${item.id})">禁用</a>
			<%-- 	<a href="${pageContext.request.contextPath}/editUser.action?id=${item.id}">编辑</a> --%>
				<a href="#" onclick="editUSER(${item.id})">编辑</a>
				</c:if>
				<c:if test="${item.flag == 0}">
				<a href="#" onclick="changeFlag(${item.id})">启用</a>
				<a  href="#" onclick="deleteItem(${item.id})">删除</a>
				</c:if>
				</td>
			<tr>
			</c:forEach>
	</table>

</form>
</div>
<div>
<nav align="center">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>
<div id="saysome">
</div>
</div>

</body>
</html>