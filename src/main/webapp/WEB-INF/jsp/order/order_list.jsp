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
<title>订单</title>
<!-- css -->
<link href="${ctx}/static/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${ctx}/static/layui/css/layui.css"  rel="stylesheet"/>
<!-- js -->
<script src="${ctx}/static/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/layer/layer.js"></script>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/js/order_list.js"></script>
<script src="${ctx}/static/js/base.js"></script>
<style type="text/css">a{text-decoration: none;}th,td{text-align: center;}</style>
</head>
<body>
<input type="hidden" value="${ctx}" id="ctx">
<table class="table table-hover table-bordered">
<thead>
		<tr><th>订单编号</th><th>用户</th><th>车辆</th><th>状态</th>
			<th>预定时间</th><th>预计到达时间</th>
			<th colspan="3">操作</th>
		</tr>
</thead>
<tbody>
	<c:forEach items="${order}" var="o">
		<tr>
			<td>${o.o_id}</td><td>${o.userName}</td><td>${o.car_name}</td>
			<td>
				<c:if test="${o.o_state eq 0}"><span style="color: #00EE00;">正在预约</span></c:if>
				<c:if test="${o.o_state eq 1}"><span style="color: #1874CD;">进行中</span></c:if>
				<c:if test="${o.o_state eq 2}">
					<c:if test="${not  empty o.s_id}"><span style="color: #9ACD32;">已完成</span></c:if>
					<c:if test="${empty o.s_id}"><span style="color: #EE0000;">已拒绝</span></c:if>
				</c:if>
				
			</td>
			<td>${o.orderTime}</td><td>${o.arriveTime}</td>
			<!-- 未处理订单 -->
			<c:if test="${state eq 0 }">
				<td><a href="javascript:manage('${o.o_id}');">处理</a></td>
			</c:if>
			<!-- 正在处理订单 -->
			<c:if test="${state eq 1 }">
				<td><a href="javascript:edit('${o.o_id}');">修改</a></td>
				<td><a href="javascript:detail('${o.o_id}');">详情</a></td>
				<td><a href="javascript:done('${o.o_id}');">完成</a></td>
			</c:if>
			<!-- 完成订单 -->
			<c:if test="${state eq 2 }">
				<td><a href="javascript:detail('${o.o_id}');">详情</a></td>
			</c:if>
		</tr>
	</c:forEach>
</tbody>
</table>
<c:if test="${not empty order }">
<c:if test="${state eq 0 }">
<button type="button" onclick="excellayer(0)" style="margin-left:10px;" class="btn yellow">
		<i class="layui-icon">&#xe601;</i> Excel导出
</button>
</c:if>
<c:if test="${state eq 1 }">
<button type="button" onclick="excellayer(1)" style="margin-left:10px;" class="btn yellow">
		<i class="layui-icon">&#xe601;</i> Excel导出
</button>
</c:if>
<c:if test="${state eq 2 }">
<button type="button" onclick="excellayer(2)" style="margin-left:10px;" class="btn yellow">
		<i class="layui-icon">&#xe601;</i> Excel导出
</button>
</c:if>

</c:if>
<script type="text/javascript">
var done=function(orderId){
	$.ajax({
		url:'order/done',
		data : {"orderId":orderId},
		type : "POST", // 请求方式
		dataType:'html',
		success:function(data){
			layer.alert(data==1?'订单结束成功！':'订单结束失败~！');
			opration('/order/list?state=2');
		}
});
};
</script>
</body>
</html>
