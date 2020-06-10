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
<script src="${ctx}/static/layui/layui.all.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/static/js/part.js"></script>

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
					<label class="col-sm-2 control-label" for="partName">名称</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="partName" name="partName" type="text"
						 lay-verify="required"
						 placeholder="请输入零件名称" value="${part.partName }" lay-verify="required"/>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="partPrice">单价</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="partPrice" name="partPrice"
						value="${part.partPrice}" lay-verify="price"  placeholder="请输入零件单价（元）"  lay-verify="required"/>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="partNum">数量</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="partNum" name="partNum" type="number"  lay-verify="required"
						value="${part.partNum}"  oninput="javascript:this.value=this.value.replace(/[^\d]/g,'')"/>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="warning">预警值</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="warning" name="warning" type="number" 
						value="${part.warning}" lay-verify="required" oninput="javascript:this.value=this.value.replace(/[^\d]/g,'')"/>
					</div>
				</div>
			</div>
			<input type="hidden" name="partId" id="partId" value="${part.partId }" />
			<div class="modal-footer">
				<button type="button" class="btn btn-default" onclick="closeLay();">关闭</button>
				<button type="submit" class="btn btn-primary" lay-submit="" lay-filter="add">保存</button>
			</div>
		</form>
	</div>
</body>
</html>
