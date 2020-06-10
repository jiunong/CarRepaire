<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>汽车维修管理平台</title>
<!-- js引入部分 -->
<script src="${ctx}/static/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/layer/layer.js"></script>
<!-- css引入部分 -->
<link rel="stylesheet" href="${ctx}/static/css/login.css">
<link rel="shortcut icon" type="image/x-icon" href="static/images/icon.ico">
</head>
<body class="layui-layout-body">
<script type="text/javascript">
$(function(){
	var message='${msg}';
	if(message!=''){
		layer.msg(message);
	}
});
signUp=function(){
	$.ajax({
		url:'${ctx}/user/toPage',
		type:'POST',
		success:function(){
			window.location.href='${ctx}/user/toPage';
		}
	});
};
</script>
<div class="layui-layout layui-layout-admin">
 	<h1>汽车维修管理平台</h1>
	<div class="login-form">
		<div class="close"> </div>
			<div class="clear"> </div>
		<div class="avtar">
		<img src="static/images/icon.ico" />
	</div>
			<form action="user/login" method="post">
					<input type="text" class="text" value="Username"  name="uName"
						onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}" >
				<div class="key">
					<input type="password" value="Password"  name="uPass"
						onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
				</div>
		<div class="signin">
			<input type="submit" value="Login">
		</div>
			</form>
	</div>
		<div class="copy-rights">
			<p><a href="javascript:void(0);" onclick="signUp()" >新用户注册</a></p>
		</div>
	<div class="copy-rights">
		<p>Time &copy;<%=new Date()%></p>
	</div>
</div>
</body>
</html>
