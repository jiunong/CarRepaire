<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>员工管理</title>
<script src="${ctx}/static/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/static/js/worker.js"></script>

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
					<label class="col-sm-2 control-label" for="wName">姓名</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="wName" name="wName" type="text"
						 lay-verify="required"
						 placeholder="请输入员工姓名" value="${worker.wName }"  />
					</div>
					<label class="col-sm-2 control-label" for="wBirthday">年龄</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="wAge" name="wAge" type="number"  lay-verify="required"
						value="${worker.wAge}" oninput="javascript:this.value=this.value.replace(/[^\d]/g,'')"/>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="wSex">性别</label>
					<div class="layui-col-xs4">
						<select class="form-control" id="wSex" name="wSex" lay-verify="required">
								<option value="">-请选择-</option>
				           		<option value="1" <c:if test="${worker.wSex==1}">selected </c:if>>男</option>	
				            	<option value="0" <c:if test="${worker.wSex==0}">selected </c:if>>女</option>	
							</select>
					</div>
					<label class="col-sm-2 control-label" for="wIdcard">身份证信息</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="wIdcard" name="wIdcard"
							value="${worker.wIdcard}" type="text" lay-verify="required"
							placeholder="请输入身份证信息"/>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="wPhone">电话</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="wPhone" name="wPhone"
							value="${worker.wPhone}" type="text" lay-verify="required|phone"
							placeholder="请输入员工电话" />
					</div>
					<label class="col-sm-2 control-label" for="wlevel">职位</label>
					<div class="layui-col-xs4">
						<select  class="form-control" id="wLevel" name="wLevel"  lay-verify="required">
								<option value="">-请选择-</option>
				            	<option value="0" <c:if test="${worker.wLevel==0}">selected </c:if>>实习生</option>	
				           		<option value="1" <c:if test="${worker.wLevel==1}">selected </c:if>>初级维修员</option>	
				           		<option value="1" <c:if test="${worker.wLevel==2}">selected </c:if>>高级维修员</option>
							</select>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="wSalary">薪资</label>
						<div class="layui-col-xs4">
							<input class="form-control" id="wSalary" lay-verify="required"
								name="wSalary" value="${worker.wSalary }"
								type="text" placeholder="请输入员工薪资" />
						</div>
					<label class="col-sm-2 control-label" for="wLocation">家庭住址</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="wLocation" lay-verify="required"
							name="wLocation" value="${worker.wLocation }"
							type="text" placeholder="请输入家庭住址" />
					</div>
				</div>
			</div>
			<input type="hidden" name="wId" id="wId" value="${worker.wId }" />
			<div class="modal-footer">
				<button type="button" class="btn btn-default" onclick="closeLay();">关闭</button>
				<button type="submit" class="btn btn-primary" lay-submit="" lay-filter="add">保存</button>
			</div>
		</form>
	</div>
</body>
</html>
