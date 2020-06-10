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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>汽车管理</title>
<!-- css -->
<link href="${ctx}/static/layui/css/layui.css"  rel="stylesheet"/>
<link href="${ctx}/static/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${ctx}/static/bootstrap/bootstrap-table.css" rel="stylesheet" />
<!-- js -->
<script src="${ctx}/static/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/layer/layer.js"></script>
<script src="${ctx}/static/layui/layui.all.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table.js"></script>
<script src="${ctx}/static/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/static/js/car.js"></script>
<script src="${ctx}/static/js/index.js"></script>
<style type="text/css">a{text-decoration: none;}</style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
<input type="hidden" value="${ctx}" id="ctx">
<input type="hidden" value="${tag}" id="tag">
	<div class="tabbable-line boxless tabbable-reversed">
	 <ul class="nav nav-tabs" id="myTab">
					<li class="active"><a href="#tab_0" data-toggle="tab">
							汽车基本信息 </a></li>
		</ul>
	</div>
	<br>
	<div class="m-heading-1 border-blue m-bordered">
		 <form class="form-inline" >
	            <div class="form-group"> 
	                <label>&nbsp;&nbsp;汽车名称：</label> 
	                <input type="text" id="carName" name="carName" class="form-control" >
	            </div> 
	            <button class="layui-btn" type="button" onclick="javascript:doSearch();" style="margin-left:50px"><i class="layui-icon">&#xe605;</i></button> &nbsp;&nbsp;
			    <button class="layui-btn" type="button" onclick="javascript:doReset();"> <i class="layui-icon">&#x1002;</i></button>
            </form>
            
	</div>
<c:if test="${empty tag }">
	<div id="toolbar" class="btn-group toolbar">
	<!-- 新增 -->
			<button type="button" onclick="add()"
				class="layui-btn" style="margin-left:10px;">
				<i class="layui-icon">&#xe61f;</i>
			</button> 
    <!-- 修改 -->			
			<button type="button" onclick="update()"
				class="layui-btn layui-btn-danger" style="margin-left:10px;">
				<i class="layui-icon">&#xe642;</i>
			</button>
    <!-- 删除 -->			
			<button type="button" onclick="deleteRow()"
				class="layui-btn" style="margin-left:10px;">
				<i class="layui-icon">&#xe640;</i>
			</button>  
	</div>
</c:if>
<!-- Begin -->
	<table id="car" class="table table-hover active result"></table>
<!-- End -->
	<div class="print">
			<button style="opacity: 0.7;" onclick="printPage();" type="button" class="layui-btn">打印</button>
	</div>
</div>
<script type="text/javascript">

var preOrder=function(carId){
	 var tag='${tag}';
	 if(tag==1){
		 $.ajax({
				url:  ctx+"/car/selectCar?carId="+carId,
				type:'POST',
				success:function(state){
					if(state==1){
// 						parent.location.reload(); // 父页面刷新
// 						$('#selCar').hide();
						opration('/order/toPreOrder');
						layer.close(carLay);
					}
				}
			});
	 }else{
		 $.ajax({
				url:  ctx+"/car/selectCar?carId="+carId,
				type:'POST',
				success:function(state){
					if(state==1){
//						parent.location.reload(); // 父页面刷新
//						$('#selCar').hide();
						opration('/order/toPreOrder');
// 						layer.close(carLay);
					}
				}
			});
	 }
};
</script>
</body>
</html>
