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
	function deleteUsers(){
		var list=new Array();
		$("input:checkbox[name='usersSelect']:checked").each(function(){
			list.push($(this).val());
		});
		$.ajax({
			url:"${pageContext.request.contextPath}/deleteMany.action",
			traditional: true, //这个设置为true，data:{"steps":["qwe","asd","zxc"]}会转换成steps=qwe&steps=asd&...
			type:"post",
			data:{"list":list},
			success:function(data){
				window.location.reload();
				alert("删除成功");
			}
		});
	}
	//全选/全不选
	function selectAll(){
		if($("#usersSelectAll").is(":checked"))
		$("input:checkbox[name='usersSelect']").prop("checked", true); 
		else {
		$("input:checkbox[name='usersSelect']").prop("checked", false);
		}
		
		      
	}

	/* function editUsers(){
		var list=new Array();
		var v=new Array();
		$("input:checkbox[name='usersSelect']:checked").each(function(){
			list.push($(this).val());
		});
		$.ajax({
			url:"${pageContext.request.contextPath}/editMany.action",
			traditional: true, //这个设置为true，data:{"steps":["qwe","asd","zxc"]}会转换成steps=qwe&steps=asd&...
			type:"post",
			data:{"users":vo[list]},
			success:function(data){
				window.location.reload();
				alert("删除成功");
			}
		});
	} */
	
</script>
<title>账户管理</title>
</head>
<body>
	<div id="wrapper">
		<div class="page-header">
			<h1 align="center">
				用户查询管理<span>&nbsp;&nbsp;</span><small>USER SEARCH&ADMIN</small>
			</h1>
		</div>
			<form id="itemsearch" cellpadding="2px" cellspacing="2px"
				align="center" action="${pageContext.request.contextPath}/editMany.action" method="post">
				<table class="table table-bordered">
				<button type="submit" class="btn btn-default navbar-btn">修改</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-default navbar-btn" onclick="deleteUsers()">刪除</button>
					<div class="checkbox">
						<thead style="font-weight: bold;">
							<tr>
								<td>全选/全不选<input type="checkbox" id="usersSelectAll" name="usersSelectAll" onclick="selectAll()"></td>
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
						<div id="haha">
							<c:forEach items="${page.rows}" var="row" varStatus="v">
								<tr>
									<td><input type="checkbox"  name="usersSelect"
										value="${row.id}"></td>
									<td><input type="text" name="list[${v.index }].id" value="${row.id}"
										readonly></td>
									<td><input type="text" name="list[${v.index}].username"
										value="${row.username}"></td>
									<td><input type="text" name="list[${v.index }].telephone"
										value="${row.telephone}" /></td>
									<td><input type="text" name="list[${v.index }].password"
										value="${row.password}"></td>
									<td><input type="text" name="list[${v.index }].email" value="${row.email}"></td>
									<td><input type="text" name="list[${v.index }].home" value="${row.home}"></td>
									<td><input type="text" name="list[${v.index }].pro" value="${row.pro}"></td>
								<tr>
							</c:forEach>
						</div>
					</div>
					
				</table>
			
				</tbody>
				
					<div class="col-md-12">
					<smilezmh:page
						url="${pageContext.request.contextPath}/deleteManyJsp.action" />
						<a href="${pageContext.request.contextPath }/search.action"> 
					返回搜索主页</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>