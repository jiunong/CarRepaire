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
<title>零件基本信息</title>
<script src="${ctx}/static/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/static/js/user.js"></script>

<link href="${ctx}/static/layui/css/layui.css"  rel="stylesheet"/>
<link href="${ctx}/static/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${ctx}/static/bootstrap/bootstrap-table.css" rel="stylesheet" />
<style type="text/css">input{margin-bottom: 20px;}</style>
<style type="text/css">a{text-decoration: none;}</style>
</head>
<body>
	<div style="margin: 30px;">
		<form class="layui-form layui-form-pane" id="myForm" action="" method="post">
			<div class="layui-container">
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="uName">系统用户名</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="uName" name="uName" type="text"
						 lay-verify="required"
						 placeholder="请输入系统用户名" value="${user.uName }" required/>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="uPass">密码</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="uPass" name="uPass"
						value="${user.uPass}" placeholder="请输入密码" lay-verify="required"/>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="uPhone">电话</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="uPhone" name="uPhone" 
						value="${user.uPhone}" placeholder="请输入联系电话"  lay-verify="required|phone" required />
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="uLevel">用户类型</label>
					<div class="layui-col-xs4">
						<select class="form-control" id="uLevel" name="uLevel" lay-verify="required" >
							<option value="">-请选择-</option>
			           		<option value="0" <c:if test="${user.uLevel eq 0}">selected </c:if>>客户</option>	
			            	<option value="1" <c:if test="${user.uLevel eq 1}">selected </c:if>>管理员</option>	
			            	<option value="2" <c:if test="${user.uLevel eq 2}">selected </c:if>>维修工</option>
						</select>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="uLoc">家庭住址</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="uLoc" name="uLoc" 
						value="${user.uLoc}"  placeholder="请输入家庭住址" lay-verify="required"  />
					</div>
				</div>
			</div>
			<input type="hidden" name="uId" id="uId" value="${user.uId }" />
			<div class="modal-footer">
				<button type="button" class="btn btn-default" onclick="closeLay();">关闭</button>
				<button type="submit" class="btn btn-primary" lay-submit="" lay-filter="add">保存</button>
			</div>
		</form>
	</div>
</body>
</html>
