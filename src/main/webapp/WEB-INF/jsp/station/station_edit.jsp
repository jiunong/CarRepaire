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
<title>机床管理</title>
<script src="${ctx}/static/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/layui/layui.all.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/static/js/station.js"></script>

<link href="${ctx}/static/layui/css/layui.css"  rel="stylesheet"/>
<link href="${ctx}/static/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${ctx}/static/bootstrap/bootstrap-table.css" rel="stylesheet" />
<style type="text/css">input{margin-bottom: 20px;}</style>
<style type="text/css">a{text-decoration: none;}</style>
</head>
<body>
	<div style="margin: 30px;">
		<form class="layui-form layui-form-pane" id="stationForm" action="" method="post">
			<div class="layui-container">
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="sType">维修类型</label>
					<div class="layui-col-xs4">
						<select class="form-control" id="carType" name="carType" >
							<option value="">-请选择-</option>
			           		<option value="货车" <c:if test="${car.carType eq '货车'}">selected </c:if>>货车</option>	
			            	<option value="轿车" <c:if test="${station.sState eq '轿车'}">selected </c:if>>轿车</option>	
			            	<option value="客车" <c:if test="${station.sState eq '客车'}">selected </c:if>>客车</option>	
			            	<option value="自卸汽车" <c:if test="${station.sState eq '自卸汽车'}">selected </c:if>>自卸汽车</option>
			            	<option value="越野汽车" <c:if test="${station.sState eq '越野汽车'}">selected </c:if>>越野汽车</option>	
			            	<option value="牵引汽车" <c:if test="${station.sState eq '牵引汽车'}">selected </c:if>>牵引汽车</option>
			            	<option value="专用汽车" <c:if test="${station.sState eq '专用汽车'}">selected </c:if>>专用汽车</option>
						</select>
					</div>
				</div>
				<div class="layui-row">
					<label class="col-sm-2 control-label" for="sState">机床状态</label>
					<div class="layui-col-xs4">
						<select class="form-control" id="sState" name="sState" >
							<option value="">-请选择-</option>
			           		<option value="完好待使用" <c:if test="${station.sState eq '完好待使用'}">selected </c:if>>完好待使用</option>	
			            	<option value="完好在使用" <c:if test="${station.sState eq '完好在使用'}">selected </c:if>>完好在使用</option>	
			            	<option value="损坏在维修" <c:if test="${station.sState eq '损坏在维修'}">selected </c:if>>损坏在维修</option>
						</select>
					</div>
				</div>
				<c:if test="${ not empty station.sId }">
					<div class="layui-row">
						<label class="col-sm-2 control-label" for="begintime">建立时间</label>
							<div class="layui-col-xs4">
								<input class="form-control" id="begintime" name="begintime"
									value="${station.begintime}" type="date"
									disabled="disabled"/>
							</div>
						<label class="col-sm-2 control-label" for="scraptime">废弃时间</label>
							<div class="layui-col-xs4">
								<input class="form-control" id="scraptime" name="scraptime"
									value="${station.scraptime}" type="date"
									disabled="disabled"/>
							</div>
					</div>
				</c:if>
			</div>
			<input type="hidden" name="sId" id="sId" value="${station.sId }" />
			<div class="modal-footer">
				<button type="button" class="btn btn-default" onclick="closeLay();">关闭</button>
				<button type="submit" class="btn btn-primary" lay-submit="" lay-filter="add">保存</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">

	layui.use(['form', 'layedit'], function(){
	  var form = layui.form
	  ,layer = layui.layer;
	  form.render();
	  //监听提交
	  form.on('submit(add)', function(data){
			var data=$("#stationForm").serialize();
			$.ajax({
				url:'station/add',
				type:'POST',
				data:data,
				success:function(state){
					if(state==1){
						layer.alert("添加成功");
						closeLay();
					}
				},
				error:function(){
					alert("添加失败！请联系管理员");
				},
			});
	    return false;
	  });
	});
	function closeLay(){
		window.close();
	}
	</script>
</body>
</html>
