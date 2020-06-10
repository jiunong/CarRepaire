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
<title>汽车维修管理系统</title>
<script src="${ctx}/static/jquery/1.8.0/jquery.min.js"></script>
<script src="${ctx}/static/layui/layui.all.js"></script>
<script src="${ctx}/static/js/home.js"></script>
<script src="${ctx}/static/js/echarts-all.js"></script>
<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
<link rel="shortcut icon" type="image/x-icon" href="static/images/icon.ico">
</head>
<body class="layui-layout-body">
<blockquote class="layui-elem-quote layui-text">
	<marquee loop="-1">
		<h5>
		您有${count}条订单未处理，请及时处理~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
		<c:forEach items="${parts}" var="part">
			${part.partName}库存仅剩${part.partNum}件，请及时补充库存~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		</c:forEach>
		</h5>
	</marquee>
</blockquote>
<form class="layui-form" action="">
	<div class="layui-row layui-col-space15">
		 <div class="layui-col-md6">
		 	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	 			 <legend>员工统计</legend>
			</fieldset>
			<div class="layui-form-item">
			 	<select  class="form-control"   lay-search=""  lay-filter="date1" >
			 			<c:forEach items="${yearMonths}" var="yearMonth">
			 					<option value="${yearMonth}">${yearMonth}</option>
			 			</c:forEach>
			 	</select>
		 	</div>
		 	<div id="work" style="width: 100%;height: 65%;">Echart1</div>
		 </div>
		 <div class="layui-col-md6">
		 	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	 			 <legend>订单统计</legend>${selMonth}
			</fieldset>
			<div class="layui-form-item">
				<select  class="form-control"  lay-search=""  lay-filter="date2" >
			 			<c:forEach items="${yearMonths}" var="yearMonth">
			 					<option value="${yearMonth}">${yearMonth}</option>
			 			</c:forEach>
			 	</select>
		 	</div>
		 	<div id="carType" style="width: 100%;height: 65%;">Echart2</div>
		 </div>
	</div>
</form>
<script type="text/javascript">
layui.use([ 'form' ], function() {
	var form = layui.form;
	form.render();
	form.on('select(date1)',function(data){
		getWorkDataBar(data.value);
	});
	form.on('select(date2)',function(data){
		getCarTypeData(data.value);
	});
});

</script>
</body>
</html>
