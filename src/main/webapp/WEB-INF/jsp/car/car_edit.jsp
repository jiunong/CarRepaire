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
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>汽车基本信息</title>
<script src="${ctx}/static/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/static/js/car.js"></script>

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
					<label class="col-sm-2 control-label" for="carName">名称</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="carName" name="carName" type="text"
						 lay-verify="required"
						 placeholder="请输入汽车名称" value="${car.carName }" required/>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="carType">类型</label>
					<div class="layui-col-xs4">
						<select class="form-control" id="carType" name="carType"  required  >
							<option value="">-请选择-</option>
			           		<option value="货车" <c:if test="${car.carType eq '货车'}">selected </c:if>>货车</option>	
			            	<option value="轿车" <c:if test="${car.carType eq '轿车'}">selected </c:if>>轿车</option>	
			            	<option value="客车" <c:if test="${car.carType eq '客车'}">selected </c:if>>客车</option>	
			            	<option value="自卸汽车" <c:if test="${car.carType eq '自卸汽车'}">selected </c:if>>自卸汽车</option>
			            	<option value="越野汽车" <c:if test="${car.carType eq '越野汽车'}">selected </c:if>>越野汽车</option>	
			            	<option value="牵引汽车" <c:if test="${car.carType eq '牵引汽车'}">selected </c:if>>牵引汽车</option>
			            	<option value="专用汽车" <c:if test="${car.carType eq '专用汽车'}">selected </c:if>>专用汽车</option>
						</select>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="carPlace">产地</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="carPlace" name="carPlace"  
						value="${car.carPlace}"  placeholder="请输入汽车产地"  required />
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="carNo">车牌号</label>
					<div class="layui-col-xs4">
						<input class="form-control" id="carNo" name="carNo"  
						value="${car.carNo}"  lay-verify="carNo" placeholder="请输入车牌号"  required />
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="buytime">购入时间</label>
					<div class="layui-col-xs4">
						<input class="form-control" type="date" id="buytime" name="buytime"  
						value="<fmt:formatDate value="${car.buytime}" pattern="yyyy-MM-dd"/>"  required />
						
					</div>
				</div>
			</div>
			<input type="hidden" name="carId" id="carId" value="${car.carId }" />
			<div class="modal-footer">
				<button type="button" class="btn btn-default" onclick="closeLay();">关闭</button>
				<button type="submit" class="btn btn-primary" lay-submit="" lay-filter="add">保存</button>
			</div>
		</form>
	</div>
</body>
</html>
