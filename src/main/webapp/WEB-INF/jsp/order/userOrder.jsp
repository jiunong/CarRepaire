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
		<tr><th>订单编号</th><th>用户</th><th>车辆</th>
			<th>预定时间</th>
			<th>备注</th><th>订单状态</th><th>操作</th>
		</tr>
</thead>
<tbody>
	<c:forEach items="${orders}" var="o">
		<tr>
			<td>${o.o_id}</td><td>${o.userName}</td><td>${o.car_name}</td>
			<td>${o.orderTime}</td><td>${o.remark}</td>
			<td>
				<c:if test="${o.o_state eq 0}"><span style="color: #00EE00;">正在预约</span></c:if>
				<c:if test="${o.o_state eq 1}"><span style="color: #1874CD;">进行中</span></c:if>
				<c:if test="${o.o_state eq 2}">
					<c:if test="${not  empty o.s_id}"><span style="color: #9ACD32;"><a onclick="go();">待支付</a></span></c:if>
					<c:if test="${empty o.s_id}"><span style="color: #EE0000;">已拒绝</span></c:if>
				</c:if>
			</td>
			<td><a href="javascript:detail('${o.o_id}');">详情</a></td>
		</tr>
	</c:forEach>
</tbody>
</table>
<script type="text/javascript">
function go(){
	layer.open({
		  type: 1,
		  skin: 'layui-layer-rim', //加上边框
		  area: ['420px', '420px'], //宽高
		  content: '<img  src="${ctx}/static/images/PAY.jpg">'
		});
}
</script>
</body>
</html>
